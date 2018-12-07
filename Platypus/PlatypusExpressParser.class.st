Class {
	#name : #PlatypusExpressParser,
	#superclass : #PlatypusExpressAbstractParser,
	#instVars : [
		'contextsStack',
		'errorsIndexMap',
		'errorMessages'
	],
	#category : #'Platypus-HW-parsers'
}

{ #category : #compiling }
PlatypusExpressParser class >> schemaInstanceFromSource: aSource [
	| parsingResult |
	parsingResult := self 
				parseStream: (ReadStream on: aSource)
				startingAt: self startingStateForSchemaInstanceEntry
				owner: PltSchemaInstance new.
	parsingResult metaData resolvesSilently.
	^ parsingResult metaData
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> abstractSupertypeConstraint: supertypeConstraintOrNil [ 
	| supertypeConstraint |
	supertypeConstraint := self supertypeConstraint: supertypeConstraintOrNil.
	self currentContext setInstantiable: false.
	^ supertypeConstraint
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> actionBodyDecl: declarationsOrNil statements: statementsOrNil [ 
	^ Array with: declarationsOrNil with: statementsOrNil
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> aggregateInitializer: initList [ 
	| aggrInit |
	aggrInit := self new: PltAggregateInitializer.
	aggrInit setContents: initList.
	^ aggrInit
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> aggregateInitializerElement: expression repetition: expressionOrNil [ 
	| aggrInitElem |
	aggrInitElem := self new: PltAggregateInitializerElement.
	aggrInitElem setVal: expression.
	aggrInitElem setRepetition: expressionOrNil.
	^ aggrInitElem
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> aggregateType: keyIdentOrNil parameterType: parameterType [ 
	| type |
	type := self new: PltGeneralAggregateType.
	type setElementType: parameterType.
	keyIdentOrNil notNil
		ifTrue: [type setTypeLabel: keyIdentOrNil].
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> aliasStatement: aliasStatement statements: statements [ 
	statements notNil ifTrue: [aliasStatement statements addAll: statements].
	self popContext.
	^aliasStatement
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> aliasStatementVariable: anIdentifier for: assignable [ 
	| aliasVariable aliasStatement |
	aliasVariable := self new: PltAliasStatementVariable.
	aliasVariable setAliasIdent: anIdentifier.
	aliasVariable setRef: assignable.
	aliasStatement := self new: PltAliasStatement.
	aliasStatement setVariable: aliasVariable.
	aliasVariable setOwner: aliasStatement.
	self pushContext: aliasStatement.
	self registerIdentifier: aliasVariable named: anIdentifier.
	^ aliasStatement
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> arrayType: indexSpecOrNil baseType: baseType optionalOrUnique: arrayOfSymbolsOrNil [ 
	| type |
	type := self new: PltArrayType.
	type setElementType: baseType.
	indexSpecOrNil
		ifNil: [type setIsGeneralType: self currentContext isPltNamedType not]
		ifNotNil: [type setIsGeneralType: false.
			type setLowerBound: indexSpecOrNil first.
			type setUpperBound: indexSpecOrNil second.
			indexSpecOrNil first ifNotNil: [:is | is owner: type].
			indexSpecOrNil second ifNotNil: [:is | is owner: type]].
	type setOptionalFlag: false.
	type setUniqueFlag: false.
	arrayOfSymbolsOrNil notNil
		ifTrue: [arrayOfSymbolsOrNil
				do: [:s | s == #optional
						ifTrue: [type setOptionalFlag: true]
						ifFalse: [s == #unique
								ifTrue: [type setUniqueFlag: true]]]].
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> assignable: aCollection [ 
	| assignable |
	assignable := self new: PltAssignable.
	assignable setHead: aCollection first.
	assignable setOwner: self currentContext.
	2
		to: aCollection size
		do: [:pos | assignable qualifiers
				add: (aCollection at: pos)].
	^ assignable
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> assignmentStatement: assignable from: expression [ 
	| assignment |
	assignment := self new: PltAssignmentStatement.
	assignment setLeft: assignable.
	assignment setRightExpr: expression.
	^ assignment
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> attributeName: simpleIdent groupRef: aGroupIdentOrNil [ 
	| attribute redecl |
	attribute := self new: PltAttribute.
	aGroupIdentOrNil
		ifNotNil: [redecl := self new: PltAttributeReference.
			simpleIdent isString
				ifTrue: [attribute
						setRedeclaring: (redecl name: simpleIdent entityRefName: aGroupIdentOrNil)]
				ifFalse: [attribute
						setRedeclaring: (redecl name: simpleIdent ident entityRefName: aGroupIdentOrNil)]].
	attribute setName: simpleIdent.
	attribute setOwner: self currentNamedType.
	^ attribute
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> attributeQualifier: aQualifier [ 
	| qualifier |
	qualifier := self new: PltAttributeQualifier.
	qualifier setAttributeName: aQualifier.
	^ qualifier
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> bagType: indexSpecOrNil baseType: baseType [ 
	| type |
	type := self new: PltBagType.
	type setElementType: baseType.
	type setIsGeneralType: false.
	indexSpecOrNil notNil
		ifTrue: [
			type setLowerBound: indexSpecOrNil first.
			type setUpperBound: indexSpecOrNil second.
			indexSpecOrNil first ifNotNil: [:is | is owner: type].
			indexSpecOrNil second ifNotNil: [:is | is owner: type]].
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> beginSplitmarkStatement: stringExpression [ 
	| splitmark |
	splitmark := self new: PltSplitmarkStatement.
	splitmark setFilename: stringExpression.
	^ splitmark
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> beginSplitmarkStatement: stringExpression append: abool [
	| splitmark |
	splitmark := self new: PltSplitmarkStatement.
	splitmark setFilename: stringExpression.
	splitmark append: abool.
	^ splitmark
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> binaryLiteral: aBinary [ 
	| lit |
	lit := self new: PltBinaryLiteral.
	lit setVal: aBinary.
	^ lit
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> binaryType: FixedOrNotPrecisionSpecOrNil [ 
	| type |
	type := self new: PltBinaryType.
	FixedOrNotPrecisionSpecOrNil notNil
		ifTrue: [type setWidth: FixedOrNotPrecisionSpecOrNil first.
			type setFixedWidth: FixedOrNotPrecisionSpecOrNil second].
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> booleanType [
	^ self new: PltBooleanType
]

{ #category : #'result building' }
PlatypusExpressParser >> buildParserResultWith: aMetaData [ 
	^ (PlatypusExpressParserResult tokenList: scanner tokenList metaData: aMetaData)

]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> cardinalityExpressionFrom: expression1 to: expression2 [ 
	^ Array with: expression1 with: expression2
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> caseAction: expressionsList statement: aStatement [ 
	| caseAction |
	caseAction := self new: PltCaseAction.
	caseAction labels addAll: expressionsList.
	caseAction setAction: aStatement.
	^ caseAction
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> caseOtherwise: aStatement [ 
	^ aStatement
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> caseStatement: caseSelectorExpression caseActions: caseActionsListOrNil caseOtherwise: caseOtherwiseOrNil [ 
	| caseStatement |
	caseStatement := self new: PltCaseStatement.
	caseStatement setSelector: caseSelectorExpression.
	caseActionsListOrNil notNil
		ifTrue: [caseActionsListOrNil do: [ :ca | ca owner: caseStatement].
				caseStatement caseActions addAll: caseActionsListOrNil].
	caseStatement setCaseOtherwise: caseOtherwiseOrNil.
	^ caseStatement
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> compoundStatement: aCompoundStatement statements: statementsListOrNil [ 
	statementsListOrNil notNil
		ifTrue: [aCompoundStatement statements
				addAll: statementsListOrNil].
	self popContext.
	^ aCompoundStatement
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> compoundStatementBegin [
	| compound |
	compound := self new: PltCompoundStatement.
	self pushContext: compound.
	^ compound
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> conceptIdentifier: anIdent [ 
	^ PlatypusExpressParsedMetaConcept ident: anIdent 
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> conceptIdentifier: anIdent metaExpression: aMetaExpression [ 
	^ PlatypusExpressParsedMetaConcept ident: anIdent metaExpression: aMetaExpression
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> constantBody: ident baseType: baseType expression: initExpression [ 
	| constant |
	constant := self new: PltConstantDefinition.
	constant setOwner: self currentContextDefinition.
	ident updateDictionaryInstanceName: constant.
	constant setDomain: baseType.
	constant setInitializer: initExpression.
	self registerIdentifier: constant named: ident ident.
	^ constant
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> constantsDecl: constantsBodyCollectionOrNil [ 
	constantsBodyCollectionOrNil notNil
		ifTrue: [self currentContextDefinition setConstants: constantsBodyCollectionOrNil].
	^ constantsBodyCollectionOrNil
]

{ #category : #accessing }
PlatypusExpressParser >> contextsStack [
	^contextsStack
]

{ #category : #accessing }
PlatypusExpressParser >> currentAlgorithmDeclaration [
	self contextsStack
		reverseDo: [:c | c isPltAlgorithmDeclaration
				ifTrue: [^ c]].
	^ nil
]

{ #category : #accessing }
PlatypusExpressParser >> currentContext [
	^ self contextsStack isEmpty ifFalse: [self contextsStack last]
]

{ #category : #accessing }
PlatypusExpressParser >> currentContextDefinition [
	self contextsStack
		reverseDo: [:c | c isPltContextDefinition
				ifTrue: [^ c]].
	^ nil
]

{ #category : #accessing }
PlatypusExpressParser >> currentNamedType [
	self contextsStack
		reverseDo: [:c | c isPltNamedType
				ifTrue: [^ c]].
	^ nil
]

{ #category : #accessing }
PlatypusExpressParser >> currentNamedTypeOrContextDefinition [
	self contextsStack
		reverseDo: [:cinst | (cinst isPltContextDefinition
					or: [cinst isPltNamedType])
				ifTrue: [^ cinst]].
	^ nil
]

{ #category : #accessing }
PlatypusExpressParser >> currentSchema [
	self contextsStack
		reverseDo: [:c | c isPltSchemaDefinition
				ifTrue: [^ c]].
	^ nil
]

{ #category : #accessing }
PlatypusExpressParser >> currentUniquenessRuleContainer [
	self contextsStack
		reverseDo: [:c | c isPltEntityDefinition
				ifTrue: [^ c]].
	^ nil
]

{ #category : #accessing }
PlatypusExpressParser >> currentWhereRuleContainer [
	self contextsStack
		reverseDo: [:c | (c isPltNamedType
					or: [c isPltGlobalRule])
				ifTrue: [^ c]].
	^ nil
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> deriveClause: derivedAttributesList [ 
	^ derivedAttributesList
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> derivedAttribute: attribute baseType: baseType expression: expression [ 
	| derivedAttribute |
	derivedAttribute := self new: PltDerivedAttribute.
	derivedAttribute setRedeclaring: attribute redeclaring.
	derivedAttribute setOwner: attribute owner.
	attribute name updateDictionaryInstanceName: derivedAttribute.
	self registerIdentifier: derivedAttribute named: derivedAttribute name.
	derivedAttribute setAssign: expression.
	derivedAttribute setDomain: baseType.
	^ derivedAttribute
]

{ #category : #'initialize-release' }
PlatypusExpressParser >> destroy [
	contextsStack := nil.
	errorsIndexMap := nil.
	errorMessages := nil.
	super destroy
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> eConstant [
	| lit |
	lit := self new: PltEConstant.
	lit setVal: 2.71828.
	^ lit
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> elementQualifier: anExpression [ 
	| qualifier |
	qualifier := self new: PltElementQualifier.
	qualifier setIndex: anExpression.
	^ qualifier
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> encodedStringLiteral: anEncodedString [ 
	| lit |
	lit := self new: PltBinaryLiteral.
	lit setVal: anEncodedString.
	^ lit
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> endSplitmarkStatement [
	| splitmark |
	splitmark := self new: PltEndSplitmarkStatement.
	^ splitmark
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> entity: entity subSuper: anArrayOrNil explicitAttributes: explicitAttrListOrNil deriveClause: derivedClauseOrNil inverseClause: inverseClauseOrNil uniqueClause: uniqueClauseOrNil whereClause: whereClauseOrNil [ 
	entity owner notNil
		ifTrue: [entity owner entities add: entity].
	explicitAttrListOrNil notNil
		ifTrue: [explicitAttrListOrNil
				do: [:attrs | entity attributes addAll: attrs]].
	derivedClauseOrNil notNil
		ifTrue: [derivedClauseOrNil
				do: [:attrs | entity attributes add: attrs]].
	inverseClauseOrNil notNil
		ifTrue: [inverseClauseOrNil
				do: [:attrs | entity attributes add: attrs]].
	uniqueClauseOrNil notNil
		ifTrue: [entity setUniquenessRules: uniqueClauseOrNil].
	whereClauseOrNil notNil
		ifTrue: [entity setWhereRules: whereClauseOrNil].
	entity attributes
		do: [:a | a setOwner: entity].
	entity uniquenessRules
		do: [:a | a setOwner: entity].
	self popContext.
	^ entity
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> entityIdentifier: anIdentifier [ 
	| entity |
	entity := self new: PltEntityDefinition.
	self setScannerTokenMetaData: entity.
	entity setOwner: self currentContextDefinition.
	anIdentifier updateDictionaryInstanceName: entity.
	entity setInstantiable: true.
	self registerNamedType: entity named: anIdentifier ident.
	self pushContext: entity.
	self registerIdentifier: entity named: 'SELF'.
	^ entity
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> entityReferenceType: anIdentifier [ 
	| type |
	type := self new: PltEntityDefinitionReference.
	type owner: self currentNamedTypeOrContextDefinition.
	anIdentifier updateDictionaryInstanceName: type.
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> entitySupertype: supertypeConstraintOrNil subtype: subtypeDeclarationOrNil [ 
	| entity |
	(entity := self currentNamedType)
		ifNotNil: [entity setSupertypeConstraint: supertypeConstraintOrNil.
			subtypeDeclarationOrNil
				ifNotNil: [entity setSupertypes: subtypeDeclarationOrNil]].
	^ Array with: supertypeConstraintOrNil with: subtypeDeclarationOrNil
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> enumerationType: identList [ 
	| type |
	type := self new: PltEnumerationType.
	type setElements: identList.
	type owner: self currentNamedType.
	^ type
]

{ #category : #accessing }
PlatypusExpressParser >> errorIndexOf: aSymbol [
	^ self errorsIndexMap at: aSymbol ifAbsent: [0]
]

{ #category : #accessing }
PlatypusExpressParser >> errorTable [
	^ errorMessages
]

{ #category : #accessing }
PlatypusExpressParser >> errorsIndexMap [
	^ errorsIndexMap
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> escapeStatement [
	| escape |
	escape := self new: PltEscapeStatement.
	^ escape
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> escapedExpression: anExpression [ 
	| expr |
	expr := self new: PltEscapedExpression.
	expr expr: anExpression.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> explicitAttributes: attributes baseType: baseType optional: isOptional [ 
	| attribute |
	^ attributes collect: 
			[:a | 
			attribute := self new: PltExplicitAttribute.
			attribute setOwner: a owner.
			attribute setRedeclaring: a redeclaring.
			a name updateDictionaryInstanceName: attribute.
			self registerIdentifier: attribute named: attribute name.
			attribute setOptionalFlag: isOptional.
			attribute setDomain: baseType.
			attribute]
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> explicitlyImportedItem: name renamedAs: localName [ 
	| item |
	item := self new: PltDomainEquivalentItem.
	item setName: name.
	item setExternalItemId: localName.
	^ item
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> explicitlyImportedItems: aCollectionOfDomainEquivalentItems [ 
	^ aCollectionOfDomainEquivalentItems 
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 and: op2 [ 
	| expr |
	expr := self new: PltAndExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: exp1 cardinality: op expression: exp2 [ 
	| expression |
	expression := self new: PltCardinalityExpression.
	expression setLeftExpr: exp1.
	expression setRightExpr: exp2.
	expression setCard1: op first.
	expression setCard2: op second.
	^ expression
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 div: op2 [ 
	| expr |
	expr := self new: PltDivExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 equal: op2 [ 
	| expr |
	expr := self new: PltEqualExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 expo: op2 [ 
	| expr |
	expr := self new: PltExpoExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 greaterThan: op2 [ 
	| expr |
	expr := self new: PltGreaterThanExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 greaterThanOrEqual: op2 [ 
	| expr |
	expr := self new: PltGreaterEqualExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 in: op2 [ 
	| expr |
	expr := self new: PltInExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 instConst: op2 [ 
	| expr |
	expr := self new: PltInstanceConstructionExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 instEqual: op2 [ 
	| expr |
	expr := self new: PltInstEqualExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 instNotEqual: op2 [ 
	| expr |
	expr := self new: PltInstNotEqualExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 lessThan: op2 [ 
	| expr |
	expr := self new: PltLessThanExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 lessThanOrEqual: op2 [ 
	| expr |
	expr := self new: PltLessEqualExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 like: op2 [ 
	| expr |
	expr := self new: PltLikeExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 minus: op2 [ 
	| expr |
	expr := self new: PltMinusExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 mod: op2 [ 
	| expr |
	expr := self new: PltModExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 mult: op2 [ 
	| expr |
	expr := self new: PltMultExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 notEqual: op2 [ 
	| expr |
	expr := self new: PltNotEqualExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 or: op2 [ 
	| expr |
	expr := self new: PltOrExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 plus: op2 [ 
	| expr |
	expr := self new: PltPlusExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 realDiv: op2 [ 
	| expr |
	expr := self new: PltRealDivExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expression: op1 xor: op2 [ 
	| expr |
	expr := self new: PltXorExpression.
	expr setLeftExpr: op1.
	expr setRightExpr: op2.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> expressionBetweenParenthesis: expression [ 
	expression setParenthesis: true.
	^expression
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> externalMetaSchema: schemaIdent [ 
	| interface |
	interface := self new: PltExternalMetaSchema.
	interface setName: schemaIdent.
	interface setOwner: self currentSchema.
	^ interface
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> formalParameter: identList parameterType: type var: varOrNotBoolean [ 
	| parameter |
	^identList collect: 
			[:ident | 
			parameter := self new: PltParameterDefinition.
			parameter setByCopy: varOrNotBoolean not.
			parameter setName: ident.
			parameter setDomain: type.
			self registerIdentifier: parameter named: ident.
			parameter setOwner: self currentContextDefinition.
			parameter]
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> formalParametersList: aCollectionOfCollections [ 
	aCollectionOfCollections
		do: [:col | self currentAlgorithmDeclaration formalParameters addAll: col].
	^ self currentAlgorithmDeclaration formalParameters
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> function: function formalParametersDecl: parametersListOrNil returnType: returnType actionBody: actionBody [ 
	function owner notNil
		ifTrue: [function owner algorithmes add: function].
	actionBody second notNil
		ifTrue: [function statements addAll: actionBody second].
	function setReturnType: returnType.
	self popContext.
	^ function
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> functionIdentifier: anIdentifier [ 
	| function |
	function := self new: PltFunctionDeclaration.
	function setOwner: self currentContextDefinition.
	anIdentifier updateDictionaryInstanceName: function.
	self setScannerTokenMetaData: function.
	self registerIdentifier: function named: anIdentifier ident.
	self pushContext: function.
	^ function
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> genericType: keyIdentOrNil [ 
	| type |
	type := self new: PltGenericType.
	type setTypeLabel: keyIdentOrNil.
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> groupRef: groupIdent [ 
	| groupRef |
	groupRef := self new: PltGroupQualifier.
	groupRef setGroupName: groupIdent.
	^ groupRef
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> identifier: aString [ 
	| ident identClass |
	self currentContext
		ifNotNil: [:cc |
			aString asUppercase = 'SELF'
				ifTrue: [identClass := PltSelfIdentifier]
				ifFalse: [identClass := PltIdentifier].
			ident := self new: identClass.
			ident owner: cc.
			ident setName: aString].
	^ ident
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> identifier: aString arguments: arguments [ 
	| ident |
	ident := self identifier: aString.
	ident parameters: arguments.
	^ ident
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> ifStatement: cond then: thenStatementOrNil else: elseStatementOrNil [ 
	| ifStatement |
	ifStatement := self new: PltIfStatement.
	ifStatement setSelector: cond.
	thenStatementOrNil notNil
		ifTrue: [ifStatement thenStatements addAll: thenStatementOrNil].
	elseStatementOrNil notNil
		ifTrue: [ifStatement setElseStatements: elseStatementOrNil].
	^ ifStatement
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> incrementControl: ident first: firstValueExpression last: lastValueExpression step: byExpressionOrNil [ 
	| incrementControlVariable incrementControl |
	incrementControlVariable := self new: PltIncrementControlVariable.
	incrementControlVariable setVariableId: ident.
	incrementControl := self new: PltIncrementControl.
	incrementControl setVariable: incrementControlVariable.
	incrementControlVariable setOwner: incrementControl.
	incrementControl setFirst: firstValueExpression.
	incrementControl setLast: lastValueExpression.
	incrementControl setStep: byExpressionOrNil.
	self pushContext: incrementControl.
	self registerIdentifier: incrementControlVariable named: ident.
	^ incrementControl
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> indexSpecFrom: lowIndex to: hiIndex [ 
	^ Array with: lowIndex asBound with: hiIndex asBound
]

{ #category : #'initialize-release' }
PlatypusExpressParser >> initialize [
	super initialize.
	contextsStack := OrderedCollection new.
	self initializeErrors
]

{ #category : #'initialize-release' }
PlatypusExpressParser >> initializeErrors [
	errorsIndexMap := Dictionary new.
	errorMessages := OrderedCollection new.
	#(#(#BadInverseAttributeDomain '<< Inverse attribute domain must be a Set, a Bag of Entity or an Entity') #(#SupertypeHierarchyCycle 'Cycle in supertype hierarchy') #(#DefinedTypeDomainCycle 'Cycle in domain path') #(#NamingConflict 'Name already used in this context') )
		do: [:couple | 
			errorMessages add: couple second.
			errorsIndexMap at: couple first put: errorMessages size]
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> integerLiteral: anInteger [ 
	| lit |
	lit := self new: PltIntegerLiteral.
	lit setVal: anInteger.
	^ lit
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> integerType: precisionSpecOrNil [ 
	| type |
	type := self new: PltIntegerType.
	precisionSpecOrNil notNil
		ifTrue: [type setPrecision: precisionSpecOrNil].
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> interfaceSpecification: useOrRefSymbol schema: schemaIdent interfaceList: interfacesListOrNil [ 
	| interface |
		useOrRefSymbol = #USED
				ifTrue: [interface := self new: PltUsedSchema]
				ifFalse: [interface := self new: PltReferencedSchema].
			interface setExplicitlyImportedItems: interfacesListOrNil.
	interface setName: schemaIdent.
	interface setOwner: self currentSchema.
	^ interface
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> intervalExpression: expression1 op: lessThanOrLessEqualSymbol1 expression: expression2 op: lessThanOrLessEqualSymbol2 expression: expression3 [ 
	| lexpr1 lexpr2 and interval |
	lessThanOrLessEqualSymbol1 == #<
		ifTrue: [lexpr1 := self expression: expression1 lessThan: expression2]
		ifFalse: [lexpr1 := self expression: expression1 lessThanOrEqual: expression2].
	lessThanOrLessEqualSymbol2 == #<
		ifTrue: [lexpr2 := self expression: expression2 lessThan: expression3]
		ifFalse: [lexpr2 := self expression: expression2 lessThanOrEqual: expression3].
	and := self expression: lexpr1 and: lexpr2.
	interval := self new: PltInterval.
	interval setExpr: and.
	^ interval
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> inverseAttribute: attribute baseType: domain for: attrIdent [ 
	| unresolvedInverse minbound maxbound unresolvedDomain aref |
	unresolvedInverse := self new: PltInverseAttribute.
	unresolvedInverse setOwner: attribute owner.
	attribute name updateDictionaryInstanceName: unresolvedInverse.
	unresolvedInverse setRedeclaring: attribute redeclaring.
	self registerIdentifier: unresolvedInverse named: unresolvedInverse name.
	domain isPltAggregationType 
		ifTrue: 
			[unresolvedInverse setDomain: domain elementType.
			minbound := domain lowerBound.
			minbound isNil 
				ifTrue: 
					[minbound := self new: PltIntegerBound.
					minbound owner: domain.
					minbound setBoundValue: 0].
			maxbound := domain upperBound.
			maxbound ifNotNil: [maxbound owner: domain].
			domain isPltSetType 
				ifTrue: [unresolvedInverse setDuplicates: false]
				ifFalse: [unresolvedInverse setDuplicates: true].
			unresolvedInverse setMinCardinality: minbound.
			unresolvedInverse setMaxCardinality: maxbound.
			unresolvedDomain := domain elementType]
		ifFalse: 
			[unresolvedInverse setDomain: domain.
			unresolvedDomain := domain].
	aref := self new: PltAttributeReference.
	aref owner: unresolvedInverse.
	aref name: attrIdent entityRefName: unresolvedDomain name.
	unresolvedInverse setInvertedAttr: aref.
	^ unresolvedInverse
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> inverseClause: inverseAttributesList [ 
	^ inverseAttributesList
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> listType: indexSpecOrNil baseType: baseType unique: uniqueOrNil [ 
	| type |
	type := self new: PltListType.
	type setElementType: baseType.
	type setIsGeneralType: false.
	indexSpecOrNil notNil
		ifTrue: [
			type setLowerBound: indexSpecOrNil first.
			type setUpperBound: indexSpecOrNil second.
			indexSpecOrNil first ifNotNil: [:is | is owner: type].
			indexSpecOrNil second ifNotNil: [:is | is owner: type]].
	uniqueOrNil notNil
		ifTrue: [type setUniqueFlag: true]
		ifFalse: [type setUniqueFlag: false].
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> localBody: identsList baseType: baseType initializer: expressionOrNil [ 
	| local |
	^ identsList
		collect: [:ident | 
			local := self new: PltLocalVariable.
			local setName: ident.
			local setDomain: baseType.
			local setInitializer: expressionOrNil.
			self currentContextDefinition locals add: local.
			local setOwner:  self currentContextDefinition.
			self registerIdentifier: local named: ident.
			local]
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> localDecl: declarationsOrNil [ 
	^ declarationsOrNil
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> logicalLiteral: trueFalseOrUnknown [ 
	#(#(#true #PltTrueConstant) #(#false #PltFalseConstant) #(#unknown #PltUnknownConstant) )
		do: [:couple | trueFalseOrUnknown == couple first
				ifTrue: [^ (PlatypusPharoSmalltalk at: couple second) new]]
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> logicalType [
	^ self new: PltLogicalType
]

{ #category : #accessing }
PlatypusExpressParser >> lookUpIdentifierBN: anIdentifier [ 
	^ self currentContext lookUpIdentifierBN: anIdentifier
]

{ #category : #accessing }
PlatypusExpressParser >> lookUpNamedTypeBN: anIdentifier [ 
	^ self currentContext lookUpNamedTypeBN: anIdentifier 
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> metaEntitySpec: anIdentifier namedParameters: parametersOrNil [ 
	^ Association key: anIdentifier value: parametersOrNil
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> metaEntitySpec: anIdentifier parameters: parametersOrNil [ 
	^ Association key: anIdentifier value: parametersOrNil
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> missingValue: isARedefine [ 
	^ self new: PltMissingValue
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> namedType: anIdentifier [ 
	| type |
	type := self new: PltNamedTypeReference.
	type owner: self currentNamedTypeOrContextDefinition.
	anIdentifier updateDictionaryInstanceName: type.
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> nativeAlgorithm: nativeAlgorithmList [ 
	| stmt |
	stmt := self new: PltNativeAlgorithm.
	nativeAlgorithmList
		do: [:na | stmt buildNativeCodesFromString: na value lexicalElement].
	^ stmt
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> nativeExpression: nativeAlgo [ 
	| expr |
	expr := self new: PltNativeExpression.
	expr source: nativeAlgo.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> nativeStatement: nativeAlgo [ 
	| stmt |
	stmt := self new: PltNativeStatement.
	stmt source: nativeAlgo.
	^ stmt
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> negativeExpression: expression [ 
	| expr |
	expr := self new: PltNegativeExpression.
	expr setExpr: expression.
	^ expr
]

{ #category : #'result building' }
PlatypusExpressParser >> new: aClass [ 
	| new |
	new := aClass new stepInitialize.
	^ new
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> not: expression [ 
	| expr |
	expr := self new: PltNotExpression.
	expr setExpr: expression.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> nullStatement [
	^ self new: PltNullStatement
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> numberType [
	^ self new: PltNumberType
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> outputStatement: expression [ 
	| output |
	output := self new: PltOutputStatement.
	output setOutput: expression.
	^ output
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> piConstant [
	| lit |
	lit := self new: PltPiConstant.
	lit setVal: 3.14159.
	^ lit
]

{ #category : #accessing }
PlatypusExpressParser >> popContext [
	| last |
	last := self contextsStack last.
	self contextsStack removeLast.
	^ last
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> positiveExpression: expression [ 
	| expr |
	expr := self new: PltPositiveExpression.
	expr setExpr: expression.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> precisionSpec: anExpression [ 
	^ anExpression asBound
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> procedure: procedure formalParametersDecl: parametersListOrNil actionBody: actionBody [ 
	procedure owner notNil
		ifTrue: [procedure owner algorithmes add: procedure].
	actionBody second notNil
		ifTrue: [procedure statements addAll: actionBody second].
	self popContext.
	^ procedure
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> procedureCall: ident [ 
	| proc |
	proc := self new: PltProcedureCallStatement.
	proc setCall: ident.
	^ proc

]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> procedureIdentifier: anIdentifier [ 
	| procedure |
	procedure := self new: PltProcedureDeclaration.
	self setScannerTokenMetaData: procedure.
	procedure setOwner: self currentContextDefinition.
	anIdentifier updateDictionaryInstanceName: procedure.
	self registerIdentifier: procedure named: anIdentifier ident.
	self pushContext: procedure.
	^ procedure
]

{ #category : #accessing }
PlatypusExpressParser >> pushContext: aPltDictionaryInstance [
	self contextsStack add: aPltDictionaryInstance
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> qualifiedExpression: expression qualifiers: qualifiersList [ 
	| expr |
	expr := self new: PltQualifiedExpression.
	expr setHead: expression.
	expr setQualifiers: qualifiersList.
	^ expr
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> queryExpression: queryExpression source: sourceExpression suchThat: suchThatExpression [ 
	queryExpression setAggregateSource: sourceExpression.
	queryExpression setSuchThat: suchThatExpression.
	self popContext.
	^ queryExpression
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> queryVariable: ident [ 
	| queryVariable queryExpression |
	queryVariable := self new: PltQueryVariable.
	queryVariable setVariableId: ident.
	queryExpression := self new: PltQueryExpression.
	queryExpression setVariable: queryVariable.
	queryVariable setOwner: queryExpression.
	self pushContext: queryExpression.
	self registerIdentifier: queryVariable named: ident.
	^ queryExpression
]

{ #category : #'private-error handling' }
PlatypusExpressParser >> raiseError: aSymbol [ 
	^ self reportError: (self errorIndexOf: aSymbol)
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> rangeQualifierFrom: lowExpression to: highExpression [ 
	| range |
	range := self new: PltRangeQualifier.
	range setIndex1: lowExpression.
	range setIndex2: highExpression.
	^ range
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> realLiteral: aReal [ 
	| lit |
	lit := self new: PltRealLiteral.
	lit setVal: aReal.
	^ lit
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> realType: precisionSpecOrNil [ 
	| type |
	type := self new: PltRealType.
	precisionSpecOrNil notNil
		ifTrue: [type setRadix: precisionSpecOrNil].
	^ type
]

{ #category : #accessing }
PlatypusExpressParser >> registerIdentifier: aData named: anIdentifier [ 
	self currentContext insertIntoIdentifiersCache: aData named: anIdentifier.

]

{ #category : #accessing }
PlatypusExpressParser >> registerNamedType: aData named: anIdentifier [ 
	self currentContext insertIntoNamedTypeCache: aData named: anIdentifier.

]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> remarkReference: aRemarkToken [ 
	| remarkRef rem keys idents iref ctxt |
	rem := aRemarkToken lexicalElement.
	keys := rem findBetweenSubstrings: #($" $< $> ).
	keys size > 1
		ifTrue: [idents := keys first findBetweenSubstrings: #($. ).
			idents notEmpty
				ifTrue: [remarkRef := self new: PltRemarkReference.
					remarkRef setRemark: aRemarkToken asPltRemark.
					remarkRef setPrefix: idents first.
					idents size > 1
						ifTrue: [remarkRef setSuffix: idents second].
					iref := self new: PltDictionaryInstanceReference.
					iref name: (ctxt := self currentNamedTypeOrContextDefinition) name.
					iref ref: ctxt.
					remarkRef setInside: iref.
					self currentSchema remarkReferences add: remarkRef.
					^ remarkRef]].
	^ nil
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> repeatStatement: incrementControlOrNil whileControl: whileExpressionOrNil untilControl: untilExpressionOrNil statements: statementsListOrNil [ 
	| repeat |
	repeat := self new: PltRepeatStatement.
	statementsListOrNil notNil
		ifTrue: [repeat statements addAll: statementsListOrNil].
	incrementControlOrNil notNil
		ifTrue: [repeat setIncrControl: incrementControlOrNil.
			incrementControlOrNil setOwner: repeat].
	whileExpressionOrNil notNil
		ifTrue: [repeat setWhileControl: whileExpressionOrNil].
	untilExpressionOrNil notNil
		ifTrue: [repeat setUntilControl: untilExpressionOrNil].
	incrementControlOrNil notNil
		ifTrue: [self popContext].
	^ repeat
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> returnStatement: expressionOrNil [ 
	| return |
	return := self new: PltReturnStatement.
	return setReturned: expressionOrNil.
	^ return
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> rule: rule entities: fromEntitiesList actionBody: actionBody whereClause: whereClause [ 
	| instancesSet |
	rule
		setForEntities: (fromEntitiesList
				collect: [:s | 
					instancesSet := self new: PltEntityInstancesSet.
					instancesSet
						setEntityRef: (self entityReferenceType: s).
					instancesSet]).
	rule forEntities
		do: [:fe | self registerIdentifier: fe named: fe entityRef name].
	rule owner notNil
		ifTrue: [rule owner globalRules add: rule].
	rule whereRules addAll: whereClause.
	actionBody second notNil
		ifTrue: [rule statements addAll: actionBody second].
	self popContext.
	^ rule
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> ruleIdentifier: anIdentifier [ 
	| rule |
	rule := self new: PltGlobalRule.
	rule setOwner: self currentSchema.
	self setScannerTokenMetaData: rule.
	anIdentifier updateDictionaryInstanceName: rule.
	self pushContext: rule.
	^ rule
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> schema: schema interfaces: interfacesCollectionOrNil blocks: blocksCollectionOrNil [ 
	schema setInterface: interfacesCollectionOrNil.
	schema owner addElement: schema.
	self popContext.
	^ schema
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> schemaIdentifier: anIdentifier [ 
	| schema |
	schema := self new: PltSchemaDefinition.
	self setScannerTokenMetaData: schema.
	schema setOwner: self schemaInstance.
	anIdentifier updateDictionaryInstanceName: schema.
	self pushContext: schema.
	^ schema
]

{ #category : #accessing }
PlatypusExpressParser >> schemaInstance [
	self contextsStack
		reverseDo: [:c | c isPltSchemaInstance
				ifTrue: [^ c]].
	^ nil
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> schemaInstance: aCollectionOfSchemaParseResults [ 
	^ self schemaInstance

]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> selectType: identifiersList [ 
	| type |
	type := self new: PltSelectType.
	type
		setSelections: (identifiersList
				collect: [:s | self namedType: s]).
	type owner: self currentNamedType.
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> selfIdentifier [
	
	^ self currentNamedType ifNil: [PltSelfIdentifier new] ifNotNil: [self currentNamedType asSelfIdentifier]
]

{ #category : #'result building' }
PlatypusExpressParser >> setScannerTokenMetaData: aMetaData [ 
	| token |
	(token := scanner tokenList previousPrimaryElementOpenKeywordFrom: scanner tokenList last)
	ifNotNil: [token metaData: aMetaData]
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> setType: indexSpecOrNil baseType: baseType [ 
	| type |
	type := self new: PltSetType.
	type setElementType: baseType.
	type setIsGeneralType: false.
	indexSpecOrNil notNil
		ifTrue: [
			type setLowerBound: indexSpecOrNil first.
			type setUpperBound: indexSpecOrNil second.
			indexSpecOrNil first ifNotNil: [:is | is owner: type].
			indexSpecOrNil second ifNotNil: [:is | is owner: type]].
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> skipStatement [
	^ self new: PltSkipStatement
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> stringLiteral: aString [ 
	| lit |
	lit := self new: PltStringLiteral.
	lit
		setVal: ((aString copyFrom: 2 to: aString size - 1)
				copyReplaceAll: ''''''
				with: '''').
	^ lit
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> stringType: FixedOrNotPrecisionSpecOrNil [ 
	| type |
	type := self new: PltStringType.
	FixedOrNotPrecisionSpecOrNil notNil
		ifTrue: [type setWidth: FixedOrNotPrecisionSpecOrNil first.
			type setFixedWidth: FixedOrNotPrecisionSpecOrNil second].
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> subtypeDeclaration: anIdentifiersList [ 
	^ anIdentifiersList

]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> subtypeIdentifier: anIdentifier [ 
	| |
	^ self namedType: anIdentifier.

]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> supertypeConstraint: supertypeExpressionOrNil [ 
	| supertypeConstraint eref |
	supertypeConstraint := self new: PltSupertypeConstraint.
	eref := (self new: PltEntityDefinitionReference)
				name: self currentContext name.
	eref  owner: self currentNamedTypeOrContextDefinition.
	supertypeConstraint setConstrained: eref.
	self currentContext setInstantiable: true.
	supertypeConstraint setExpr: supertypeExpressionOrNil.
	^ supertypeConstraint
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> supertypeEntityReference: anIdentifier [ 
	| subEntityRef |
	subEntityRef := self new: PltSubEntityRefExpression.
	subEntityRef
		entityRef: (self namedType: anIdentifier).
	^ subEntityRef
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> supertypeExpression: supertypeExpression1 and: supertypeExpression2 [ 
	| andSupertype |
	andSupertype := self new: PltAndSupertype.
	andSupertype setLeftExpr: supertypeExpression1.
	andSupertype setRightExpr: supertypeExpression2.
	^ andSupertype
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> supertypeExpression: supertypeExpression1 andor: supertypeExpression2 [ 
	| andSupertype |
	andSupertype := self new: PltAndorSupertype.
	andSupertype setLeftExpr: supertypeExpression1.
	andSupertype setRightExpr: supertypeExpression2.
	^ andSupertype
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> supertypeOneofExpression: identifiersList [ 
	| oneofSupertypeExpression |
	oneofSupertypeExpression := self new: PltOneofSupertypeExpression.
	oneofSupertypeExpression setExprList: identifiersList.
	^ oneofSupertypeExpression
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> type: aDefinedType underlyingType: underlyingType whereClause: whereClauseOrNil [ 
	| enumVal |
	aDefinedType setDomain: underlyingType.
	aDefinedType setWhereRules: whereClauseOrNil.
	aDefinedType owner notNil
		ifTrue: [aDefinedType owner types add: aDefinedType].
	self popContext.
	underlyingType isPltEnumerationType
		ifTrue: [underlyingType elements
				do: [:el | 
					enumVal := PltEnumerationValue
								domain: (PltDefinedTypeReference ref: aDefinedType)
								element: el.
					enumVal domain owner: self currentNamedTypeOrContextDefinition.

					self registerIdentifier: enumVal named: el asUppercase]].
	^ aDefinedType
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> typeIdentifier: anIdentifier [ 
	| type |
	type := self new: PltDefinedType.
	self setScannerTokenMetaData: type.
	type setOwner: self currentContextDefinition.
	anIdentifier updateDictionaryInstanceName: type.
	self registerNamedType: type named: anIdentifier ident.
	self pushContext: type.
	self registerIdentifier: type named: 'SELF'.
	^ type
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> typeMapFrom: aListOfIdent to: anExpression [ 
	| sch |
	(sch := self currentSchema) isNil
		ifFalse: [
			sch
				addTypeMap: (PltMetaMappingDefinition definitionPath: aListOfIdent metaExpression: anExpression)]
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> typeMapWhere: aWhereRule to: anExpression [
	| sch |
	(sch := self currentSchema) isNil
		ifFalse: [
			sch
				addTypeMap: (PltMetaMappingRule typeMapWhere: aWhereRule whereValue  to: anExpression)]
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> uniqueAttributesList: anIdentifiersCollection head: anIdentOrNil [ 
	| uniquenessRule ref |
	uniquenessRule := self new: PltUniquenessRule.
	uniquenessRule
		setAttributes: (anIdentifiersCollection
				collect: [:attr | 
					ref := self new: PltUniquenessRuleAttributeIdentifier.
					ref fastSetParameters: nil.
					ref setName: attr name.
					ref
						setGroupRefName: (attr redeclaring
								ifNotNil: [attr redeclaring entityRef name]).
					ref]).
	uniquenessRule setLabel: anIdentOrNil.
	uniquenessRule setOwner: self currentUniquenessRuleContainer.
	^ uniquenessRule
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> uniqueClause: UniqueRules [ 
	^ UniqueRules
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> whereClause: whereRules [ 
	^ whereRules
]

{ #category : #'express semantic actions' }
PlatypusExpressParser >> whereRule: anExpression head: anIdentOrNil [ 
	| rule |
	rule := self new: PltWhereRule.
	rule setLabel: anIdentOrNil.
	rule setWhereValue: anExpression.
	rule setOwner: self currentWhereRuleContainer.
	^ rule
]
