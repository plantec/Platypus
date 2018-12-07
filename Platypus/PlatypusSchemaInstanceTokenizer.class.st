Class {
	#name : #PlatypusSchemaInstanceTokenizer,
	#superclass : #PlatypusStepAbstractVisitor,
	#instVars : [
		'tokenList',
		'tokenClassifier',
		'literalEncoder'
	],
	#classVars : [
		'Singleton'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #accessing }
PlatypusSchemaInstanceTokenizer class >> singleton [
	^ Singleton ifNil: [Singleton := self new]
]

{ #category : #'visit aggregate data schema' }
PlatypusSchemaInstanceTokenizer >> acceptAggregateInitializer: e [ 
	self add: '[' asSymbol.
	self acceptAll: e contents separator: ',' asSymbol.
	self add: ']' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptAggregateInitializerDomain: e [ 
	self add: '[' asSymbol.
	self acceptAll: e types separator: ',' asSymbol.
	self add: ']' asSymbol
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptAggregateInitializerElement: e [ 
	e val acceptTry: self.
	e repetition notNil
		ifTrue: [self add: ':' asSymbol.
			e repetition acceptTry: self]
]

{ #category : #'visit aggregate data schema' }
PlatypusSchemaInstanceTokenizer >> acceptAggregateInstance: e [ 
	self add: '[' asSymbol.
	self acceptAll: e contents separator: ',' asSymbol.
	self add: ']' asSymbol
]

{ #category : #'visit generic' }
PlatypusSchemaInstanceTokenizer >> acceptAggregationType: e lower: l upper: u symbol: subtype flags: aCollection [ 
	self add: subtype.
	l notNil
		ifTrue: [self add: '[' asSymbol.
			l acceptTry: self.
			self add:  ':' asSymbol.
			u notNil
				ifTrue: [u acceptTry: self]
				ifFalse: [self add: '?' asSymbol].
			self add: ']' asSymbol].
	self add: #of.
	aCollection
		do: [:f | self add: f].
	self acceptTry: e elementType
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptAliasStatement: e [ 
	self add: #alias.
	e variable acceptTry: self.
	self add: ';' asSymbol.
	e statements acceptTry: self.
	self add: #'end_alias';
		 add: ';' asSymbol
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptAliasStatementVariable: e [ 
	self add: e name;
		 add: #for.
	e ref acceptTry: self
]

{ #category : #'visit generic' }
PlatypusSchemaInstanceTokenizer >> acceptAll: aCollection separator: sep [ 
	aCollection
		do: [:each | each acceptTry: self]
		separatedBy: [self add: sep]
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptAssignmentStatement: e [ 
	
	e left acceptTry: self.
	self add: #':='.
	e rightExpr acceptTry: self.
	self add: ';' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptAttribute: e [ 
	self remarksBefore: e.
	e redeclaring notNil 
		ifTrue: 
			[self
				add: #self;
				add: '\' asSymbol;
				add: e redeclaring entityRef name;
				add: '.' asSymbol].
	self add: e name
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptAttributeQualifier: e [ 
	self add: '.' asSymbol;
		 add: e attributeName
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptAttributeReference: e [ 
	
	self add: e name
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptBinaryExpression: e [ 
	(e parenthesis notNil
			and: [e parenthesis])
		ifTrue: [self add: #'('].
	e leftExpr acceptTry: self.
	self add: e operatorSymbol.
	e rightExpr acceptTry: self.
	(e parenthesis notNil
			and: [e parenthesis])
		ifTrue: [self add: #')']
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptBinarySupertypeExpression: e [ 
	(e parenthesis notNil
			and: [e parenthesis])
		ifTrue: [self add: #'('].
	e leftExpr acceptTry: self.
	self add: e operatorSymbol.
	e rightExpr acceptTry: self.
	(e parenthesis notNil
			and: [e parenthesis])
		ifTrue: [self add: #')']
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptBinaryType: e [ 
	self add: #binary.
	e width notNil
		ifTrue: [self add: #'('.
			e width acceptTry: self.
			self add: #')']
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptBooleanType: e [ 
	self add: #boolean
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptCardinalityExpression: e [ 
	e leftExpr acceptTry: self.
	self add: '{' asSymbol.
	e card1 acceptTry: self.
	self add: ',' asSymbol.
	e card2 acceptTry: self.
	self add: '}' asSymbol.
	e rightExpr acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptCaseAction: e [ 
	self acceptAll: e labels separator: ',' asSymbol.
	self add:  ':' asSymbol.
	e action acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptCaseStatement: e [ 
	self add: #case.
	e selector acceptTry: self.
	self add: #of.
	e caseActions acceptTry: self.
	e caseOtherwise notNil
		ifTrue: [self add: #otherwise;
				 add:  ':' asSymbol.
			e caseOtherwise acceptTry: self].
	self add: #'end_case';
		 add: ';' asSymbol
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptCompoundStatement: e [ 
	self add: #begin.
	e statements acceptTry: self.
	self add: #end;
		 add: ';' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptConstantDefinition: e [ 
	self remarksBefore: e.
	self add: e name.
	self add: ':' asSymbol.
	self acceptTry: e domain.
	self add: #':='.
	e initializer acceptTry: self.
	self add: ';' asSymbol. 	self remarksAfter: e.

]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptContextDefinition: e [ 
	e constants isEmpty
		ifFalse: [self add: #constant.
			e constants acceptTry: self.
			self add: #'end_constant';
				 add: ';' asSymbol].
	 e types acceptTry: self.
	 e entities acceptTry: self.
	 e algorithmes acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptDefinedType: e [ 
	self remarksBefore: e.
	self
		add: #type;
		add: e name;
		add: '=' asSymbol.
	self acceptTry: e domain.
	self add: ';' asSymbol.
	e whereRules size > 0 
		ifTrue: 
			[self add: #where.
			e whereRules acceptTry: self].
	self
		add: #'end_type';
		add: ';' asSymbol.
			self remarksAfter: e.

]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptDerivedAttribute: e [ 
	self acceptAttribute: e.
	self add: ':' asSymbol.
	self acceptTry: e domain.
	self add: #':='.
	e assign acceptTry: self.
	self add: ';' asSymbol.
	self remarksAfter: e
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptDictionaryInstanceReference: e [ 
	self add: e name
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptDomainEquivalentItem: e [ 
	| |
	self add: (e nativeItem name).
	e nativeItem name asLowercase ~= e externalItemId asLowercase
		ifTrue: [self add: #as;
				 add: e externalItemId]
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptElementQualifier: e [ 
	self add: '[' asSymbol.
	e index acceptTry: self.
	self add: ']' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptEmbeddedRemark: e [ 
	self tokenList add: (PlatypusEmbeddedRemarkToken token: e text)
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptEndSplitmarkStatement: e [ 
	self 
		 add: '{*';
		 add: #'end_splitmark';
		 add: '*}'
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptEntityDefinition: e [ 
	| supertypes |
	self remarksBefore: e.
	self
		add: #entity;
		add: e name.
	e metaConcept acceptTry: self.
	e supertypeConstraint acceptTry: self.
	(supertypes := e supertypes) ifNotNil: 
			[supertypes isEmpty 
				ifFalse: 
					[self add: #subtype.
					self
						add: #of;
						add: #'('.
					supertypes acceptTry: self separatedBy: [self add: ',' asSymbol].
					self add: #')']].
	self add: ';' asSymbol.
	self remarksAfter: e.
	e explicitAttributesDo: [:ea | ea acceptTry: self].
	e derivedAttributes isEmpty 
		ifFalse: 
			[self add: #derive.
			e derivedAttributes acceptTry: self].
	e inverseAttributes isEmpty 
		ifFalse: 
			[self add: #inverse.
			e inverseAttributes acceptTry: self].
	(e uniquenessRules notNil and: [e uniquenessRules notEmpty]) 
		ifTrue: 
			[self add: #unique.
			e uniquenessRules acceptTry: self].
	(e whereRules notNil and: [e whereRules notEmpty]) 
		ifTrue: 
			[self add: #where.
			e whereRules acceptTry: self].
	self
		add: #'end_entity';
		add: ';' asSymbol
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptEntityInstancesSet: e [ 
	self add: e entityRef name
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptEnumerationType: e [ 
	self add: #enumeration;
		 add: #of;
		 add: #'('.
	e elements
		do: [:l | self add: l]
		separatedBy: [self add: ',' asSymbol].
	self add: #')'
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptEnumerationValue: e [ 
	self  add: e element
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptEscapeStatement: e [ 
	self 
		 add: #escape;
		 add: ';' asSymbol
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptEscapedExpression: e [ 
	self add: #%.
	e expr acceptTry: self.
	self add: #%
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptExplicitAttribute: e [ 
	self acceptAttribute: e.
	self add: ':' asSymbol.
	e optionalFlag ifTrue: [self add: #optional].
	self acceptTry: e domain.
	self add: ';' asSymbol.
		self remarksAfter: e
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptExternalSchema: e [ 
	e isPltExternalMetaSchema
		ifTrue: [self add: #meta]
		ifFalse: [e isPltUsedSchema
				ifTrue: [self add: #use]
				ifFalse: [self add: #reference]].
	self add: #from;
		 add: e name.
	e isPltIncludeSchema ifTrue: [
		e explicitlyImportedItems
			ifNotNil: [e explicitlyImportedItems size > 0
					ifTrue: [self add: #'('.
						self acceptAll: e explicitlyImportedItems separator: ',' asSymbol.
						self add: #')']]].
	self add: ';' asSymbol
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptFalseConstant: e [ 
	self 
		 add: #false
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptFunctionDeclaration: e [ 
	self remarksBefore: e.
	self
		add: #function;
		add: e name.
	e formalParameters isEmpty 
		ifFalse: 
			[self add: #'('.
			self acceptAll: e formalParameters separator: ';' asSymbol.
			self add: #')'].
	self add: ':' asSymbol.
	self acceptTry: e returnType.
	self add: ';' asSymbol.
		self remarksAfter: e.

	self acceptContextDefinition: e.
	e locals isEmpty 
		ifFalse: 
			[self add: #local.
			e locals acceptTry: self.
			self
				add: #'end_local';
				add: ';' asSymbol].
	e statements acceptTry: self.
	self
		add: #'end_function';
		add: ';' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptGeneralAggregateType: e [ 
	self add: #aggregate.
	e typeLabel notNil
		ifTrue: [self add:  ':' asSymbol;
				 add: e typeLabel].
	self add: #of.
	self acceptTry: e elementType
]

{ #category : #'visit population schema' }
PlatypusSchemaInstanceTokenizer >> acceptGenericInstance: e [ 
	| writer |
	writer := PlatypusModelContentsStepWriter new.
	writer outStream: (WriteStream on: String new).
	writer acceptTry: e.
	self add: writer outStream contents
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptGenericType: e [ 
	self add: #generic.
	e typeLabel notNil
		ifTrue: [self add:  ':' asSymbol;
				 add: e typeLabel]
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptGlobalRule: e [ 
	self remarksBefore: e.
	self
		add: #rule;
		add: e name;
		add: #for;
		add: #'('.
	self acceptAll: e forEntities separator: ',' asSymbol.
	self
		add: #')';
		add: ';' asSymbol.
	self remarksAfter: e.
	self acceptContextDefinition: e.
	e locals isEmpty 
		ifFalse: 
			[self add: #local.
			e locals acceptTry: self.
			self
				add: #'end_local';
				add: ';' asSymbol].
	e statements acceptTry: self.
	e whereRules isEmpty 
		ifFalse: 
			[self add: #where.
			e whereRules acceptTry: self].
	self
		add: #'end_rule';
		add: ';' asSymbol
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptGroupQualifier: e [ 
	self add: #\;
		 add: e groupName
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptIdentifier: e [ 
	self add: e name.
	e parameters
		ifNotNil: [self add: #'('.
			self acceptAll: e parameters separator: ',' asSymbol.
			self add: #')'].

]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptIfStatement: e [ 
	self add: #if.
	e selector acceptTry: self.
	self add: #then.
	e thenStatements acceptTry: self.
	(e elseStatements notNil
			and: [e elseStatements notEmpty])
		ifTrue: [self add: #else.
			e elseStatements acceptTry: self].
	self add: #'end_if';
		 add: ';' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptIncludeSchema: e [
	self acceptExternalSchema: e 

]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptIncrementControl: e [ 
	e variable acceptTry: self.
	self add: #':='.
	e first acceptTry: self.
	self add: #to.
	e last acceptTry: self.
	e step notNil
		ifTrue: [self add: #by.
			e step acceptTry: self]
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptIncrementControlVariable: e [ 
	self add: e variableId
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptIntegerBound: e [ 
	self add: e boundValue printString
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptIntegerType: e [ 
	self add: #integer.
	e precision notNil
		ifTrue: [self add: #'('.
			e precision acceptTry: self.
			self add: #')']
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptInterval: e [ 
	| andExpression left right |
	andExpression := e expr.
	left := andExpression leftExpr.
	right := andExpression rightExpr.
	self add: '{' asSymbol.
	left leftExpr acceptTry: self.
	self add: left operatorSymbol.
	left rightExpr acceptTry: self.
	self add: right operatorSymbol.
	right rightExpr acceptTry: self.
	self add: '}' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptInverseAttribute: e [ 
	self acceptAttribute: e.
	self add: ':' asSymbol.
	e minCardinality notNil 
		ifTrue: 
			[e duplicates 
				ifTrue: 
					[self
						add: #bag;
						add: '[' asSymbol]
				ifFalse: 
					[self
						add: #set;
						add: '[' asSymbol].
			e minCardinality acceptTry: self.
			self add: ':' asSymbol.
			e maxCardinality notNil 
				ifTrue: [e maxCardinality acceptTry: self]
				ifFalse: [self add: '?' asSymbol].
			self
				add: ']' asSymbol;
				add: #of].
	self
		add: e domain name;
		add: #for;
		add: e invertedAttr name;
		add: ';' asSymbol.
		self remarksAfter: e
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptLiteral: e [ 
	self literalEncoder doToken: e val.
	self add: self literalEncoder flushedContents
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptLocalVariable: e [ 
	self add: e name;
		 add:  ':' asSymbol.
	self acceptTry: e domain.
	e initializer notNil
		ifTrue: [self add: #':='.
			e initializer acceptTry: self].
	self add: ';' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptLogicalType: e [ 
	self add: #logical
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptMetaConceptDefinition: e [ 
	self add: #'{'.
	e metaExpression acceptTry: self.
	self add: #'}'
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptMetaMappingDefinition: e [ 
	self add: #map.
	e definitionPath
		do: [:p | self add: p]
		separatedBy: [self add: #'.'].
	self add: #=; add: #'{'.
	e metaExpression acceptTry: self.
	self add: #'}';
		 add: #';';
		 add: #'end_map';
		 add: #';'
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptMetaMappingRule: e [ 
	self add: #map.
	self add: #to.
	e metaExpression acceptTry: self.
	self add: #where.
	e metaCondition acceptTry: self.
	self add: #';';
		 add: #'end_map';
		 add: #';'
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptMissingValue: e [ 
	self add: '?' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptNamedTypeReference: e [ 
	self add: e name.
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptNativeAlgorithme: e [ 

	e implementations do: [:i | i acceptTry: self]
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptNativeCode: e [ 
	self add: '(*#'.
	(e languageSignature notNil
			and: [e languageSignature notEmpty])
		ifTrue: [self add: '<' , e languageSignature , '>' , e code]
		ifFalse: [self add: e code].
	self add: '#*)'.

]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptNativeExpression: e [ 
	e source acceptTry: self.
	
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptNativeStatement: e [ 
	e source acceptTry: self.

]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptNullStatement: e [ 
	self add: ';' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptNumberType: e [ 
	self add: #number
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptOneofSupertypeExpression: e [ 
	self 
		 add: e operatorSymbol;
		 add: #'('.
	self acceptAll: e exprList separator: ',' asSymbol.
	self add: #')'
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptOutputStatement: e [ 
	self 
		 add: #|.
	e output acceptTry: self.
	self add: #|;
		 add: ';' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptParameterDefinition: e [ 
	e byCopy
		ifFalse: [self add: #var].
	self add: e name;
		 add:  ':' asSymbol.
	self acceptTry: e domain
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptProcedureCallStatement: e [
	super acceptProcedureCallStatement: e.
	self add: ';' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptProcedureDeclaration: e [ 
	self remarksBefore: e.
	self
		add: #procedure;
		add: e name.
	e formalParameters isEmpty 
		ifFalse: 
			[self add: #'('.
			self acceptAll: e formalParameters separator: ';' asSymbol.
			self add: #')'].
	self add: ';' asSymbol.
		self remarksAfter: e.

	self acceptContextDefinition: e.
	e locals isEmpty 
		ifFalse: 
			[self add: #local.
			e locals acceptTry: self.
			self
				add: #'end_local';
				add: ';' asSymbol].
	e statements acceptTry: self.
	self
		add: #'end_procedure';
		add: ';' asSymbol
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptQueryExpression: e [ 
	self 
		 add: #query;
		 add: #'('.
	e variable acceptTry: self.
	self add: #<*.
	e aggregateSource acceptTry: self.
	self add: #|.
	e suchThat acceptTry: self.
	self add: #')'
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptQueryVariable: e [ 
	self 
		 add: e variableId
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptRangeQualifier: e [ 
	self add: '[' asSymbol.
	e index1 acceptTry: self.
	self add:  ':' asSymbol.
	e index2 acceptTry: self.
	self add: ']' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptRealType: e [ 
	self add: #real.
	(e precision notNil)
		ifTrue: [self add: #'('.
			e precision acceptTry: self.
			self add: #')']
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptRedefinedAttributeValue: e [ 
	^ self add: #'*'
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptReferencedSchema: e [
	self acceptIncludeSchema: e 

]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptRemarkReference: e [ 
	e remark acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptRepeatStatement: e [ 
	self add: #repeat.
	e incrControl notNil
		ifTrue: [e incrControl acceptTry: self].
	e untilControl notNil
		ifTrue: [self add: #until.
			e untilControl acceptTry: self].
	e whileControl notNil
		ifTrue: [self add: #while.
			e whileControl acceptTry: self].
	self add: ';' asSymbol.
	e statements notNil
		ifTrue: [e statements acceptTry: self].
	self add: #'end_repeat';
		 add: ';' asSymbol
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptReturnStatement: e [ 
	self 
		 add: #return.
	e returned notNil
		ifTrue: [self add: #'('.
			e returned acceptTry: self.
			self add: #')'].
	self add: ';' asSymbol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptSchemaDefinition: e [ 
	self remarksBefore: e.
	self add: #schema;
		 add: e name;
		 add: ';' asSymbol.
	self remarksAfter: e.
	e interface acceptTry: self.
	self acceptContextDefinition: e.
	e globalRules acceptTry: self.
	e mappings acceptTry: self.
	self addEol; add: #'end_schema'; add: ';' asSymbol; addEol
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptSelectType: e [ 
	self add: #select.
	self add: #'('.
	e selections
		do: [:s | self acceptTry: s]
		separatedBy: [self add: ',' asSymbol].
	self add: #')'
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptSelfIdentifier: e [ 
	self  add: #self
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptSimpleUnaryExpression: e [ 
	self add: e operatorSymbol.
	e expr acceptTry: self
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptSkipStatement: e [ 
	self 
		 add: #skip;
		 add: ';' asSymbol
]

{ #category : #'visit statements schema' }
PlatypusSchemaInstanceTokenizer >> acceptSplitmarkStatement: e [ 
	self add: #'{*';
		 add: #splitmark.
		
	e filename acceptTry: self.
	self add: #'*}'
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptStringType: e [ 
	self add: #string.
	e width notNil
		ifTrue: [self add: #'('.
			e width acceptTry: self.
			self add: #')']
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptSubEntityRefExpression: e [ 
	self add: e entityRef name
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptSupertypeConstraint: e [ 
	(e constrained ref notNil and: [e constrained ref instantiable])
		ifTrue: [self add: #supertype]
		ifFalse: [self add: #abstract;
				 add: #supertype].
	e expr notNil
		ifTrue: [self add: #of;
				 add: #'('.
			e expr acceptTry: self.
			self add: #')']
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptTailRemark: e [ 
	self tokenList add: (PlatypusTailRemarkToken token: e text)
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptTrueConstant: e [ 
	self 
		 add: #true
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptTypedExpression: e [ 
	self add: e domain name;
		 add: #'('.
	e expr acceptTry: self.
	self add: #')'
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptUniquenessRule: e [ 
	self remarksBefore: e.
		e label notNil 
		ifTrue: 
			[self
				add: e label;
				add: ':' asSymbol].
	e attributes do: [:a | self add: a name]
		separatedBy: [self add: ',' asSymbol].
	self add: ';' asSymbol.
	self remarksAfter: e
]

{ #category : #'visit expressions schema' }
PlatypusSchemaInstanceTokenizer >> acceptUnknownConstant: e [ 
	self 
		 add: #unknown
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptUsedSchema: e [
	self acceptIncludeSchema: e 

]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> acceptWhereRule: e [ 
	self remarksBefore: e.
	e label notNil 
		ifTrue: 
			[self
				add: e label;
				add: ':' asSymbol].
	e whereValue acceptTry: self.
	self add: ';' asSymbol.
	self remarksAfter: e
]

{ #category : #adding }
PlatypusSchemaInstanceTokenizer >> add: aLexicalElement [ 
	| tokenClass |
	tokenClass := tokenClassifier tokenClassFromString: aLexicalElement
				ifAbsent: [PlatypusIdentifierToken].
	self tokenList add: (tokenClass token: aLexicalElement)
]

{ #category : #adding }
PlatypusSchemaInstanceTokenizer >> addAll: aCollection [
	aCollection do: [:e | self add: e]
]

{ #category : #adding }
PlatypusSchemaInstanceTokenizer >> addEol [
	self tokenList add: PlatypusEolToken new
]

{ #category : #initializing }
PlatypusSchemaInstanceTokenizer >> initialize [
	tokenList := PlatypusTokenList new.
	tokenClassifier := PlatypusExpressTokenClassifier new.
	super initialize
]

{ #category : #accessing }
PlatypusSchemaInstanceTokenizer >> literalEncoder [
	^ literalEncoder
		ifNil: [literalEncoder := PlatypusCoreRepositoryStepFileWriter new]
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> remarksAfter: e [ 
	(e relatedRemarks select: [:r | r isPltTailRemark]) acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusSchemaInstanceTokenizer >> remarksBefore: e [ 
	(e relatedRemarks select: [:r | r isPltEmbeddedRemark]) acceptTry: self
]

{ #category : #accessing }
PlatypusSchemaInstanceTokenizer >> tokenList [
	^ tokenList
]

{ #category : #'public tokenizing' }
PlatypusSchemaInstanceTokenizer >> tokenize: anPlatypusDictionaryInstance [ 
	tokenList := PlatypusTokenList new.
	self acceptTry: anPlatypusDictionaryInstance.
	^ self tokenList
]
