"
<ISO10303-11-EXPRESS>
PROCEDURE prepare_root_ada_classes;
	LOCAL 
		clslist : LIST OF ada_class := all_ada_classes ( );
	END_LOCAL;

	REPEAT no := LOINDEX ( clslist ) TO HIINDEX ( clslist );

		ALIAS curr FOR clslist [ no];
			IF SIZEOF ( curr.supertypes ) = 0 THEN
				IF NOT has_attribute_named ( curr, xml_id_name ) THEN
					add_xml_id_to_ada_class ( curr );
				END_IF;
			END_IF;
		END_ALIAS;
	END_REPEAT;
END_PROCEDURE;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdPrepareRootAdaClassesProcedure,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'clslist'
	],
	#category : #'Express2Cheddar-Express2cheddarFacadeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdPrepareRootAdaClassesProcedure class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdPrepareRootAdaClassesProcedure class >> schemaDefinition [
	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdPrepareRootAdaClassesProcedure class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdPrepareRootAdaClassesProcedure class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdPrepareRootAdaClassesProcedure >> clslist [
	^ clslist


]

{ #category : #'platypus-generated-accessing' }
ExChdPrepareRootAdaClassesProcedure >> clslist: aListOfExChdAdaClass [
	clslist := aListOfExChdAdaClass
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaClass as: OrderedCollection ]


]

{ #category : #'platypus-generated-invoking' }
ExChdPrepareRootAdaClassesProcedure >> invoke [
	" ---------- locals assignments ----------"

	self clslist: ExChdAllAdaClassesFunction invoke.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no3894 | 
			PlatypusCoreAliasStatement
				alias: (self clslist pltAt: no3894)
				statementsBlock: [ :curr908 | 
					(PltSIZEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: (curr908 supertypesUsingContext: self class context);
								yourself)) = 0
						ifTrue: [ 
							(PTsHasAttributeNamedFunction
								invokeFromValues:
									(OrderedCollection new
										add: curr908;
										add: 'cheddar_private_id';
										yourself)) not
								ifTrue: [ 
									ExChdAddXmlIdToAdaClassProcedure
										invokeFromValues:
											(OrderedCollection new
												add: curr908;
												yourself) ] ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self clslist;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self clslist;
						yourself))


]
