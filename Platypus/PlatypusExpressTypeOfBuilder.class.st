Class {
	#name : #PlatypusExpressTypeOfBuilder,
	#superclass : #PlatypusStepOnePassAbstractVisitor,
	#instVars : [
		'resultSet',
		'startElement'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #'instance creation' }
PlatypusExpressTypeOfBuilder class >> typeOfSetFor: anElement [ 
	^ self new typeOfSetFor: anElement 
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptAggregateInitializerDomain: e [ 
	resultSet
		add: (PltStringLiteral val: 'LIST')
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptAggregationType: e [ 
	resultSet
		add: (PltStringLiteral val: e expressTypeForTypeOf)
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptAnonymousVariable: e [ 
	e domain acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptBinarySupertypeExpression: e [ 
	"e leftExpr acceptTry: self.
	e rightExpr acceptTry: self"
	^ nil
]

{ #category : #'visit native ' }
PlatypusExpressTypeOfBuilder >> acceptCollection: e [ 
	resultSet
		add: (PltStringLiteral val: 'AGGREGATE')
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptConstantDefinition: e [ 
	e domain acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptDefinedType: e [ 
	self acceptNamedType: e.
	e domain acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptDictionaryInstanceReference: e [ 
	e ref
		ifNotNil: [self acceptTry: e ref]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptEntityDefinition: e [ 
	self acceptNamedType: e.
	e supertypes acceptTry: self.
	e supertypeConstraint acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptEnumerationType: e [ 
	^ e owner acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptGenericType: e [ 
	^ self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptLocalVariable: e [ 
	e domain acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptNamedType: e [ 
	resultSet
		add: (PltStringLiteral val: e expressTypeForTypeOf)
]

{ #category : #'visit native ' }
PlatypusExpressTypeOfBuilder >> acceptObject: e [ 
	^ self acceptTry: e class platypusMetaData 
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptOneofSupertypeExpression: e [ 
	"self acceptAll: e exprList"
	^ nil
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptSelectType: e [ 
	e selections acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptSimpleType: e [ 
	resultSet
		add: (PltStringLiteral val: e expressTypeForTypeOf)
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptSubEntityRefExpression: e [ 
	^ nil
]

{ #category : #'visit dictionary schema' }
PlatypusExpressTypeOfBuilder >> acceptSupertypeConstraint: e [ 
	"e expr
		ifNotNil: [e expr acceptTry: self]"
		^ nil
]

{ #category : #'initialize/release' }
PlatypusExpressTypeOfBuilder >> initialize [
	super initialize.
	resultSet := Set new
]

{ #category : #'visit generic' }
PlatypusExpressTypeOfBuilder >> lookUpAndCacheAcceptSelectorOfClass: aClass [ 
	| currClass selector |
	currClass := aClass.
	[currClass ~~ nil]
		whileTrue: [(currClass class canUnderstand: #platypusMetaData)
				ifTrue: [selector := (#accept
								, (PlatypusNamesBuilder capitalize: currClass platypusMetaData name first: true) , ':') asSymbol]
				ifFalse: [selector := (#accept , currClass name , ':') asSymbol].
			(self class includesSelector: selector)
				ifTrue: [self acceptSelectorsMap at: aClass put: selector.
					^ selector].
			currClass := currClass superclass].
	^ self error: 'unimplemented accept method for class ''' , aClass name , ''''
]

{ #category : #'visit generic' }
PlatypusExpressTypeOfBuilder >> typeOfSetFor: anElement [ 
	startElement := anElement.
	anElement acceptTry: self.
	^ resultSet
]
