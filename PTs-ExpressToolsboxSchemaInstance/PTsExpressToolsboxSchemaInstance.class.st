"
<ISO10303-11-EXPRESS>
SCHEMA express_dictionary_queries;
	USE FROM Platypus_dictionary_schema;
	USE FROM Platypus_expressions_schema;
	USE FROM express_toolsbox_functions;

	FUNCTION expressionValueToString ( arg : expression ) : STRING;
		(*#  | t |
		t := PlatypusExpressExpression2AdaTranslater new.
		^ self return: (PltStringLiteral val: (t translate: self arg))   #*) (*# <pharo> ^ self return: (self arg printableCode)  #*) END_FUNCTION;

	FUNCTION typeof_as_string ( e : entity_instance ) : STRING;
		RETURN ( '[' + StringAggregateConcatSeparatedBy ( TYPEOF ( e ), '; ' ) + ']' );
	END_FUNCTION;

	FUNCTION schema_definition_of ( e : dictionary_instance ) : schema_definition;

		IF 'PLATYPUS_DICTIONARY_SCHEMA.SCHEMA_DEFINITION' IN TYPEOF ( e ) THEN
			RETURN ( e );
		END_IF;
		RETURN ( schema_definition_of ( e.owner ) );
	END_FUNCTION;

	FUNCTION schema_instance_of ( e : dictionary_instance ) : schema_definition;
		RETURN ( schema_definition_of ( e ).owner );
	END_FUNCTION;

	FUNCTION remarks_for ( e : dictionary_instance ) : LIST OF remark;
		LOCAL 
			sch : schema_definition := schema_definition_of ( e );
			remarks : LIST OF remark := [ ];
		END_LOCAL;

		REPEAT no := LOINDEX ( sch.remark_references ) TO HIINDEX ( sch.remark_references );
			ALIAS remref FOR sch.remark_references [ no];
				IF ( remref.referenced.ref :=: e ) THEN
					remarks := remarks + remref.remark;
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( remarks );
	END_FUNCTION;

	FUNCTION clean_remark_text_of ( rem : remark ) : STRING;
		LOCAL 
			foundMarkPos : INTEGER := 0;
		END_LOCAL;

		REPEAT no := 1 TO LENGTH ( rem.text );
			IF ( rem.text [ no] = '""' ) OR ( rem.text [ no] = '<' ) THEN
				foundMarkPos := no;
				ESCAPE;
			ELSE
				IF ( rem.text [ no] <> ' ' ) THEN
					ESCAPE;
				END_IF;
			END_IF;
		END_REPEAT;

		IF ( foundMarkPos > 0 ) THEN
			REPEAT no := foundMarkPos + 1 TO LENGTH ( rem.text );
				IF ( rem.text [ no] = '""' ) OR ( rem.text [ no] = '>' ) THEN
					RETURN ( rem.text [ no + 1 : LENGTH ( rem.text ) ] );
				END_IF;
			END_REPEAT;
		END_IF;
		RETURN ( rem.text );
	END_FUNCTION;

	FUNCTION root_entity_list ( entities : LIST OF entity_definition ) : LIST OF entity_definition;
		LOCAL 
			l : LIST OF entity_definition := [ ];
		END_LOCAL;

		REPEAT no := LOINDEX ( entities ) TO HIINDEX ( entities );
			ALIAS ent FOR entities [ no];
				IF ( SIZEOF ( ent.supertypes ) = 0 ) THEN
					INSERT ( l, ent, SIZEOF ( l ) );
				ELSE
					ALIAS sup FOR ent.supertypes [ 1 ].ref;
						IF ( sup.owner :<>: ent.owner ) THEN
							INSERT ( l, ent, SIZEOF ( l ) );
						END_IF;
					END_ALIAS;
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( l );
	END_FUNCTION;

	FUNCTION subtypes_of ( ent : entity_definition; allent : LIST OF entity_definition ) : LIST OF entity_definition;
		RETURN ( QUERY ( e <* allent | SIZEOF ( QUERY ( ee <* e.supertypes | ee.ref = ent ) ) > 0 ) );
	END_FUNCTION;

	FUNCTION attribute_named_from ( e : entity_definition; name : STRING ) : attribute;
		LOCAL 
			key : STRING := upperize ( name );
			attributes : LIST OF attribute;
		END_LOCAL;
		attributes := QUERY ( a <* e.attributes | upperize ( a.name ) = key );

		IF ( SIZEOF ( attributes ) > 0 ) THEN
			RETURN ( attributes [ SIZEOF ( attributes ) ] );
		ELSE
			RETURN ( ? );
		END_IF;
	END_FUNCTION;

	FUNCTION has_attribute_named ( e : entity_definition; name : STRING ) : BOOLEAN;
		RETURN ( EXISTS ( attribute_named_from ( e, name ) ) );
	END_FUNCTION;

	FUNCTION inherited_attribute_named_from ( e : entity_definition; name : STRING ) : attribute;
		LOCAL 
			key : STRING := upperize ( name );
			attributes : LIST OF attribute;
		END_LOCAL;
		attributes := QUERY ( a <* inherited_attributes ( e ) | upperize ( a.name ) = key );

		IF ( SIZEOF ( attributes ) > 0 ) THEN
			RETURN ( attributes [ SIZEOF ( attributes ) ] );
		ELSE
			RETURN ( ? );
		END_IF;
	END_FUNCTION;

	FUNCTION has_inherited_attribute_named ( e : entity_definition; name : STRING ) : BOOLEAN;
		RETURN ( EXISTS ( inherited_attribute_named_from ( e, name ) ) );
	END_FUNCTION;

	FUNCTION query_attributes ( ent : entity_definition; attr_kind : STRING; with_inherited : BOOLEAN; with_redeclaring : BOOLEAN ) : LIST OF attribute;
		LOCAL 
			attributes : LIST OF attribute;
		END_LOCAL;

		IF with_inherited THEN
			attributes := inherited_attributes ( ent );
		ELSE
			attributes := ent.attributes;
		END_IF;

		IF EXISTS ( attr_kind ) THEN
			attributes := QUERY ( a <* attributes | ( 'PLATYPUS_DICTIONARY_SCHEMA.' + Upperize ( attr_kind ) ) IN TYPEOF ( a ) );
		END_IF;

		IF NOT with_redeclaring THEN
			attributes := QUERY ( a <* attributes | NOT EXISTS ( a.redeclaring ) );
		END_IF;
		RETURN ( attributes );
	END_FUNCTION;

	FUNCTION attribute_redeclared_by ( ent : entity_definition; tested_attr_pos : INTEGER ) : attribute;
		LOCAL 
			attributes : LIST OF attribute := query_attributes ( ent, ?, true, true );
			tested_attr : attribute := attributes [ tested_attr_pos];
		END_LOCAL;

		REPEAT no := LOINDEX ( attributes ) TO HIINDEX ( attributes );
			ALIAS curr FOR attributes [ no];
				IF ( curr = tested_attr ) THEN
					REPEAT noi := no + 1 TO HIINDEX ( attributes );
						ALIAS curri FOR attributes [ noi];
							IF ( EXISTS ( curri.redeclaring ) AND ( curri.redeclaring.ref = curr ) ) THEN
								RETURN ( curri );
							END_IF;
						END_ALIAS;
					END_REPEAT;
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( ? );
	END_FUNCTION;

	FUNCTION all_supertypes_of ( e : entity_definition ) : LIST OF entity_definition;
		LOCAL 
			res : LIST OF entity_definition := [ ];
		END_LOCAL;

		IF ( 'PLATYPUS_DICTIONARY_SCHEMA.ENTITY_DEFINITION' IN TYPEOF ( e ) ) THEN
			REPEAT no := LOINDEX ( e.supertypes ) TO HIINDEX ( e.supertypes );
				res := all_supertypes_of ( e.supertypes [ no].ref ) + res;
			END_REPEAT;
		END_IF;
		res := res + e;
		RETURN ( res );
	END_FUNCTION;

	FUNCTION local_root_supertype_of ( e : entity_definition ) : entity_definition;
		LOCAL 
			sups : LIST OF entity_definition := all_supertypes_of ( e );
			tmp : LIST OF entity_definition;
		END_LOCAL;
		tmp := QUERY ( s <* sups | s.owner :=: e.owner );
		RETURN ( tmp [ LOINDEX ( tmp ) ] );
	END_FUNCTION;

	FUNCTION inherits_from_entity_named ( e : entity_definition; supname : STRING ) : BOOLEAN;
		LOCAL 
			key : STRING := upperize ( supname );
			allsups : LIST OF entity_definition := all_supertypes_of ( e );
		END_LOCAL;
		RETURN ( SIZEOF ( QUERY ( i <* allsups | upperize ( i.name ) = key ) ) > 0 );
	END_FUNCTION;

	FUNCTION inherited_attributes ( e : entity_definition ) : LIST OF attribute;
		LOCAL 
			res : LIST OF attribute := [ ];
			allsups : LIST OF entity_definition := all_supertypes_of ( e );
		END_LOCAL;

		REPEAT no := LOINDEX ( allsups ) TO HIINDEX ( allsups );
			res := res + allsups [ no].attributes;
		END_REPEAT;
		RETURN ( res );
	END_FUNCTION;

	FUNCTION inherited_explicit_attributes ( e : entity_definition ) : LIST OF attribute;
		LOCAL 
			attributes : LIST OF attribute := inherited_attributes ( e );
		END_LOCAL;
		RETURN ( QUERY ( a <* attributes | 'PLATYPUS_DICTIONARY_SCHEMA.EXPLICIT_ATTRIBUTE' IN TYPEOF ( a ) ) );
	END_FUNCTION;

	FUNCTION derive_attribute_result ( d : derived_attribute ) : dictionary_instance;
		(*#  | r e interpreter evalResult | 
		r := self d valueOfExplicitAttributeNamed: 'assign'.
		""instDefinition := self d valueOfExplicitAttributeNamed: 'owner'.""
		interpreter := PlatypusExpressInterpretor new.
		evalResult := interpreter
								evaluate: r ref val
								in: self d mySchemaInstance
								to: nil
								notifying: nil
								ifFail: [self halt]. 
		self halt.
		self return: evalResult.
		 #*) END_FUNCTION;
END_SCHEMA;


SCHEMA express_toolsbox_functions;

	FUNCTION string_ends_with ( s : STRING; token : STRING ) : BOOLEAN;

		IF ( LENGTH ( s ) >= LENGTH ( token ) ) THEN
			IF ( s [ LENGTH ( s ) - LENGTH ( token ) + 1 : LENGTH ( s ) ] = token ) THEN
				RETURN ( true );
			END_IF;
		END_IF;
		RETURN ( false );
	END_FUNCTION;

	FUNCTION string_replace ( src : STRING; replWhat : STRING; replWith : STRING ) : STRING;
		(*#  | r | 
     r := self src val copyReplaceAll: self replWhat val with: self replWith val asTokens: false.
		self return: (PltStringLiteral val: r).  #*) (*# <pharo>| r | 
     r := self src copyReplaceAll: self replWhat with: self replWith asTokens: false.
		^ self return: r.  #*) END_FUNCTION;

	FUNCTION SmalltalkCodeOf ( arg : STRING ) : STRING;
		(*#  ^ self return: (PltStringLiteral val: (self arg asClearText))  #*) (*# <pharo>^ self return: ((PltStringLiteral val: (self arg)) asClearText)  #*) END_FUNCTION;

	FUNCTION StringAggregateConcatSeparatedBy ( l : LIST OF STRING; sep : STRING ) : STRING;
		LOCAL 
			s : STRING := '';
		END_LOCAL;

		REPEAT no := LOINDEX ( l ) TO HIINDEX ( l );
			s := s + l [ no];
			IF ( no < HIINDEX ( l ) ) THEN
				s := s + sep;
			END_IF;
		END_REPEAT;
		RETURN ( s );
	END_FUNCTION;

	FUNCTION LinesFromString ( source : STRING ) : LIST OF STRING;
		LOCAL 
			lines : LIST OF STRING := [ ];
		END_LOCAL;
		(*#  | r |
   			r := self source val lines.
			self lines val addAll: (r collect: [:i | PltStringLiteral val: i]).
			self lines val adjustLowerAndUpperBounds
		 #*) (*# <pharo>
    			 self lines addAll: self source lines.
		 #*) RETURN ( lines );
	END_FUNCTION;

	FUNCTION SetToAggregate ( input : AGGREGATE OF GENERIC ) : AGGREGATE OF GENERIC;
		RETURN ( input );
	END_FUNCTION;

	FUNCTION SetToList ( input : SET OF GENERIC ) : LIST OF GENERIC;
		LOCAL 
			result : LIST OF GENERIC := [ ];
		END_LOCAL;
		(*#  
			self input val do: [ :el | self result val add: el]. 
		 	self result val adjustLowerAndUpperBounds. 
		 #*) (*# <pharo>
			self input do: [ :el | self result add: el]. 
		 #*) RETURN ( result );
	END_FUNCTION;

	FUNCTION ListToSet ( input : LIST OF GENERIC ) : SET OF GENERIC;
		LOCAL 
			result : SET OF GENERIC := [ ];
		END_LOCAL;
		(*#  
			self input val do: [ :el | self result val add: el]. 
		 	self result val adjustLowerAndUpperBounds. 
		 #*) (*# <pharo>
			self input do: [ :el | self result add: el]. 
		 #*) RETURN ( result );
	END_FUNCTION;

	FUNCTION AggregateToSet ( input : AGGREGATE OF GENERIC ) : SET OF GENERIC;
		LOCAL 
			result : SET OF GENERIC := [ ];
		END_LOCAL;
		(*#  
			self input val do: [ :el | self result val add: el]. 
		 	self result val adjustLowerAndUpperBounds. 
		 #*) (*# <pharo>
			self input do: [ :el | self result add: el]. 
		 #*) RETURN ( result );
	END_FUNCTION;

	FUNCTION capitalize ( input : STRING; capitalizeFirstChar : LOGICAL ) : STRING;
		(*#  
			| instr outstr resString curr |
			instr := ReadStream on:  self input pltNativeValue.
			outstr := WriteStream on: String new.
			[instr atEnd]
			whileFalse: [
					((curr := instr next) == $_)
						ifTrue: [curr := instr next.
							instr atEnd ifFalse: [outstr nextPut: (curr asUppercase)]]
						ifFalse: [outstr nextPut: curr]].
			resString := outstr contents.
			(self capitalizeFirstChar) pltNativeValue
				ifTrue: [resString at: 1 put: (resString first asUppercase)]
				ifFalse: [resString at: 1 put: (resString first asLowercase)].
			^ self return: (PltStringLiteral val: resString) 
		 #*) (*# <pharo>
			| instr outstr resString curr |
			instr := ReadStream on:  self input.
			outstr := WriteStream on: String new.
			[instr atEnd]
			whileFalse: [
					((curr := instr next) == $_)
						ifTrue: [curr := instr next.
							instr atEnd ifFalse: [outstr nextPut: (curr asUppercase)]]
						ifFalse: [outstr nextPut: curr]].
			resString := outstr contents.
			(self capitalizeFirstChar)
				ifTrue: [resString at: 1 put: (resString first asUppercase)]
				ifFalse: [resString at: 1 put: (resString first asLowercase)].
			^ self return: resString.
		 #*) END_FUNCTION;

	FUNCTION lowerize ( input : STRING ) : STRING;
		(*#  ^ self return: (PltStringLiteral val: self input pltNativeValue  asLowercase)  #*) (*# <pharo> ^ self return: (self input asLowercase)  #*) END_FUNCTION;

	FUNCTION upperize ( input : STRING ) : STRING;
		(*#  ^ self return: (PltStringLiteral val: self input pltNativeValue asUppercase)   #*) (*# <pharo> ^ self return: (self input asUppercase)  #*) END_FUNCTION;

	PROCEDURE PrintLn ( arg : GENERIC );
		(*#  Transcript show: self arg printableCode, '\' withCRs  #*) (*# <pharo> Transcript show: (self arg printString), '\' withCRs  #*) END_PROCEDURE;

	PROCEDURE Print ( arg : GENERIC );
		(*#  Transcript show: self arg printableCode  #*) (*# <pharo> Transcript show: self arg printString  #*) END_PROCEDURE;

	FUNCTION ToString ( arg : GENERIC ) : STRING;
		(*#  ^ self return: (PltStringLiteral val: self arg printableCode)   #*) (*# <pharo> ^ self return: (self arg printableCode)  #*) END_FUNCTION;

	PROCEDURE Halt;
		(*#  self halt  #*) (*# <pharo> self halt  #*) END_PROCEDURE;

	PROCEDURE clrscr;
		(*#  Transcript clear  #*) (*# <pharo> Transcript clear  #*) END_PROCEDURE;

	FUNCTION numbered_name ( nb : INTEGER; prefix : STRING; suffix : STRING ) : STRING;
		LOCAL 
			nbstr : STRING := FORMAT ( nb, '07I' );
			pos_first : INTEGER := 0;
		END_LOCAL;

		REPEAT no := 2 TO LENGTH ( nbstr ) UNTIL ( nbstr [ no] <> '0' );
			pos_first := no;
		END_REPEAT;
		RETURN ( prefix + nbstr [ pos_first : LENGTH ( nbstr ) ] + suffix );
	END_FUNCTION;

	FUNCTION allModelInstances : SET OF GENERIC;
		LOCAL 
			founds : SET OF GENERIC := [ ];
		END_LOCAL;
		(*#  self founds addAll: (myInterpreter allApplicationInstances)   #*) (*# <pharo> self founds addAll: (self myContext allApplicationInstances)   #*) RETURN ( founds );
	END_FUNCTION;

	PROCEDURE instance_become ( VAR old : GENERIC : t; VAR new : GENERIC : t );
		(*#  self old becomeInstance: self new  #*) END_PROCEDURE;

	PROCEDURE explore ( VAR arg : GENERIC );
		(*#  self arg explore  #*) (*# <pharo> self arg explore  #*) END_PROCEDURE;

	PROCEDURE inspect ( arg : GENERIC );
		(*#   self arg inspect  #*) (*# <pharo> self arg inspect  #*) END_PROCEDURE;

	PROCEDURE TestExpr ( expr : GENERIC; shouldBe : GENERIC );
		(*#  Transcript show: ('[', self expr printableCode, ']', ' [', self shouldBe printableCode, ']\') withCRs  #*) (*# <pharo> Transcript show: ('[', self expr printString, ']', ' [', self shouldBe printString, ']\') withCRs  #*) END_PROCEDURE;

	PROCEDURE runAll0ArgProcsOf ( schemaName : STRING; haltIt : BOOLEAN );

		PROCEDURE doIt;
			runAll0ArgProcsOf ( 'localTests', true );
			runAll0ArgProcsOf ( 'localTests', false );
		END_PROCEDURE;
		(*#   | context noArgAlgos schemaInstance schema  | 
			context :=  self contextsStack first contextInstance.
			schemaInstance := context schemaInstance.
			schema := schemaInstance schemata 
				detect: [ :sch | sch name asUppercase = self schemaName pltNativeValue asUppercase]
				ifNone: [].
			schema ifNotNil: [
			 	noArgAlgos := schema algorithmes 
					select: [ :alg | alg formalParameters isEmpty].
				noArgAlgos do: [:naa | 
					Transcript show: ('\>>>>>>>> Start of: ', naa name, ' >>>>>>>>>\') withCRs.
					self 
						evaluate: (ReadStream on: (naa name, ';'))
						in: naa tamarisItemRef
						to: self 
						notifying: self requestor 
						ifFail: [].
					Transcript show: ('\<<<<<<<< End of: ', naa name, ' <<<<<<<<<<\') withCRs.
					self haltIt  val ifTrue: [self halt]]]
		 #*) (*# <pharo> self error: 'not implemented'  #*) END_PROCEDURE;

	PROCEDURE ReadStepFile ( filePath : STRING );
		(*#   | context schemaInstance modelContents  | 
			Transcript show: ('reading ""', self filePath val, '""...').
			context :=  myInterpreter contextsStack first contextInstance.
			schemaInstance := context schemaInstance.
			schemaInstance associatedModels isEmpty ifTrue: [schemaInstance tamarisItemRef newModelContents].
			modelContents := schemaInstance associatedModels first.
			modelContents tamarisItemRef stepFileIn: self filePath val.
			modelContents verifySilently.
			Transcript show: 'done', String cr.
		 #*) (*# <pharo>
			Transcript show: ('reading ', self filePath, '...').
			self myContext stepFileIn: self filePath.
			Transcript show: 'done', String cr.
		 #*) END_PROCEDURE;

	PROCEDURE WriteFile ( filename : STRING; contents : STRING );
		(*# 	| fref |
	fref := self filename val asFileReference.
	fref parent parent ensureCreateDirectory.
	fref parent ensureCreateDirectory.
	fref ensureDelete.
	fref ensureCreateFile.
	fref writeStreamDo: [:fileStream | 
		fileStream nextPutAll: self contents asClearText. 
		fileStream flush].
	 #*) (*# <pharo> 
	| fref |
	fref := self filename asFileReference.
	fref parent parent ensureCreateDirectory.
	fref parent ensureCreateDirectory.

	fref ensureDelete.
	fref ensureCreateFile.
	fref writeStreamDo: [:fileStream | 
		fileStream nextPutAll: (PltStringLiteral val: self contents) asClearText. 
		fileStream flush].
	 #*) END_PROCEDURE;

	FUNCTION askForExpressDictionaryMetaData ( metaDataFilePath : STRING ) : STRING;
		LOCAL 
			doit : BOOLEAN := false;
			chosenName : STRING;
		END_LOCAL;
		(*#  
		PlatypusSchemaInstanceReference 
			chooseSchemaInstanceForClient: nil 
			selectingBlock: [:hierarList :chosen |  | expDict |
						hierarList close. 
						expDict := chosen.
						(self confirm: 'translate ', expDict name, '?')
							ifTrue: [self chosenName: (PltStringLiteral val: expDict name). 
									Transcript show: 'writing meta data file ""', self metaDataFilePath val, '""...'.
									expDict metaDataToStepFile: self metaDataFilePath pltNativeValue.
									Transcript show: 'done\' withCRs.]].
		 #*) (*# <pharo> 
		PlatypusSchemaInstanceReference 
			chooseSchemaInstanceForClient: nil 
			selectingBlock: [:hierarList :chosen | | expDict |
						hierarList close. 
						expDict := chosen.
						(self confirm: 'translate ', expDict name, '?')
							ifTrue: [self chosenName: (expDict name). 
									Transcript show: 'writing meta data file ""', self metaDataFilePath, '""...'.
									expDict metaDataToStepFile: self metaDataFilePath.
									Transcript show: 'done\' withCRs.]].
		 #*);
		RETURN ( chosenName );
	END_FUNCTION;
END_SCHEMA;


</ISO10303-11-EXPRESS>
"
Class {
	#name : #PTsExpressToolsboxSchemaInstance,
	#superclass : #PlatypusCoreSchemaInstance,
	#instVars : [
		'context'
	],
	#category : #'PTs-ExpressToolsboxSchemaInstance'
}

{ #category : #'platypus-generated-initializing' }
PTsExpressToolsboxSchemaInstance class >> initialize [
	self reinitializeSingleton.
	self singleton buildIndexes


]

{ #category : #'platypus-generated-platypus-signature' }
PTsExpressToolsboxSchemaInstance class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-platypus-signature' }
PTsExpressToolsboxSchemaInstance class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsExpressToolsboxSchemaInstance class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-context-accessing' }
PTsExpressToolsboxSchemaInstance >> context [
	^ context


]

{ #category : #'platypus-generated-context-accessing' }
PTsExpressToolsboxSchemaInstance >> context: aContext [
	context := aContext.
	super context: aContext


]

{ #category : #'platypus-generated-accessing' }
PTsExpressToolsboxSchemaInstance >> externalSchemaInstanceClassNames [
	^ #(#PltPlatypusMetaSchemasSchemaInstance)


]

{ #category : #'platypus-generated-accessing' }
PTsExpressToolsboxSchemaInstance >> namesBuilder [
	| namesBuilder |
	namesBuilder := self namesBuilderClass new.
	namesBuilder classPrefix: 'PTs'.
	namesBuilder systemCategoryPrefix: #PTs.
	namesBuilder rootClassName: 'PTsCoreEntity'.
	namesBuilder rootClassSystemCategory: 'PTs-CoreEntity'.
	^ namesBuilder


]

{ #category : #'platypus-generated-accessing' }
PTsExpressToolsboxSchemaInstance >> namesBuilderClassName [
	^ #PlatypusNamesBuilder


]

{ #category : #'platypus-generated-accessing' }
PTsExpressToolsboxSchemaInstance >> repositoryClassName [
	^ #PTsExpressToolsboxRepository


]

{ #category : #'platypus-generated-schemata-accessing' }
PTsExpressToolsboxSchemaInstance >> schemaDefinition1 [
	^ #(#express_dictionary_queries #PTsExpressDictionaryQueriesSchemaDefinition)


]

{ #category : #'platypus-generated-schemata-accessing' }
PTsExpressToolsboxSchemaInstance >> schemaDefinition2 [
	^ #(#express_toolsbox_functions #PTsExpressToolsboxFunctionsSchemaDefinition)


]

{ #category : #'platypus-generated-schemata-accessing' }
PTsExpressToolsboxSchemaInstance >> schemaDefinitionCount [
	^ 2


]
