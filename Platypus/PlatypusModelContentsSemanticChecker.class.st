Class {
	#name : #PlatypusModelContentsSemanticChecker,
	#superclass : #PlatypusModelContentsChecker,
	#instVars : [
		'currInstance',
		'domainStack'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'platypus-generated-visitingPlatypusDictionarySchema' }
PlatypusModelContentsSemanticChecker >> acceptEntityInstance: e [
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsSemanticChecker >> acceptExpression: e [ 
	| valueDomain declaredDomain |
	e computedDomain
		ifNil: [
			self
				registerError: (PlatypusModelContentsSemanticCheckerError metaData: e message: 'invalid value')]
		ifNotNil: [((valueDomain := e computedDomain) isAssignableTo: (declaredDomain := domainStack top key computedDomain))
				ifFalse: [
					declaredDomain 
						ifNil: [
							self registerError: (PlatypusModelContentsSemanticCheckerError metaData: e  message: 'invalid value, ' , domainStack top value , ': unresolved domain')]
						ifNotNil: [
							self registerError: (PlatypusModelContentsSemanticCheckerError metaData: e  message: 'incompatible value, ' , domainStack top value , ': declared domain: ' , declaredDomain errorQualifier , '; found domain: ' , valueDomain errorQualifier)]]]
]

{ #category : #'visit population schema' }
PlatypusModelContentsSemanticChecker >> acceptExternalRepresentation: e [ 
	e records acceptTry: self
]

{ #category : #'visit population schema' }
PlatypusModelContentsSemanticChecker >> acceptInternalRepresentation: e [ 
	| entityDef |
	currInstance := e.
	(entityDef := e definition referenced)
		ifNotNil: [e definition referenced instantiable
				ifFalse: [self
						registerError: (PlatypusModelContentsSemanticCheckerError metaData: e message: 'entity ''' , e definition name , ''' is not instanciable (abstract entity)')]].
	self
		checksValues: e parameters
		attributesAccessor: #inheritedExplicitAttributesDo:
		numberOfAttributes: entityDef numberOfInheritedExplicitAttributes
]

{ #category : #'visit population schema' }
PlatypusModelContentsSemanticChecker >> acceptModelContents: e [ 
	super acceptModelContents: e
]

{ #category : #'visit population schema' }
PlatypusModelContentsSemanticChecker >> acceptSimpleRecord: e [ 
	| entityDef |
	currInstance := e.
	entityDef := e definition referenced.
	self
		checksValues: e parameters
		attributesAccessor: #explicitAttributesDo:
		numberOfAttributes: entityDef numberOfExplicitAttributes
]

{ #category : #'visit population schema' }
PlatypusModelContentsSemanticChecker >> acceptUserDefinedApplicationInstance: e [ 

]

{ #category : #'visit population schema' }
PlatypusModelContentsSemanticChecker >> acceptUserDefinedHeaderInstance: e [ 

]

{ #category : #'visit generic' }
PlatypusModelContentsSemanticChecker >> checksValues: aListOfExpressions attributesAccessor: accessorSymbol numberOfAttributes: numberOfAttributes [ 
	| pos value esize |
	(esize := aListOfExpressions size) ~= numberOfAttributes
		ifTrue: [self
				registerError: (PlatypusModelContentsSemanticCheckerError
					metaData: visitPath top
					message: 'entity ''' , currInstance definition name , ''' have ' , esize printString , ' values and must have ' , numberOfAttributes printString)]
		ifFalse: [pos := 1.
			currInstance definition ref
				perform: accessorSymbol
				with: [:attr | 
					(value := aListOfExpressions at: pos) isPltMissingValue
						ifTrue: [value isPltRedefinedAttributeValue
								ifFalse: [attr optionalFlag
										ifFalse: [self
												registerError: (PlatypusModelContentsSemanticCheckerError 
													metaData: visitPath top
													message: 'entity ''' , currInstance definition name , ''' mandatory attribute with missing value')]]]
						ifFalse: [domainStack push: attr domain -> ('attribute ''' , attr name , '''').
							[self acceptTry: value]
								ensure: [domainStack pop]].
					pos := pos + 1]]
]

{ #category : #'initialize/release' }
PlatypusModelContentsSemanticChecker >> initialize [
	domainStack := PlatypusStack new.
	super initialize
]

{ #category : #'visit generic' }
PlatypusModelContentsSemanticChecker >> lookUpAndCacheAcceptSelectorOfClass: aClass [ 
	| currClass selector str |
	currClass := aClass.
	str := WriteStream on: (String new: 50).
	[currClass ~~ Object]
		whileTrue: [str nextPutAll: 'accept'.
			str
				next: currClass name size - 3
				putAll: currClass name
				startingAt: 4.
			str nextPut: $:.
			selector := str contents asSymbol.
			(self class includesSelector: selector)
				ifTrue: [self acceptSelectorsMap at: aClass put: selector.
					^ selector].
			str reset.
			currClass := currClass superclass].
	^ self error: 'unimplemented accept method for class ''' , aClass name , ''''
]
