Class {
	#name : #PlatypusSmartNamer,
	#superclass : #PlatypusStepAbstractVisitor,
	#instVars : [
		'query',
		'namesBuilder'
	],
	#category : #'Platypus-HW-translater-private'
}

{ #category : #'instance creation' }
PlatypusSmartNamer class >> query: aQuerySymbol namesBuilder: aNameBuilder [
	^ self new query: aQuerySymbol namesBuilder: aNameBuilder
]

{ #category : #accessing }
PlatypusSmartNamer class >> querySymbols [
	^ #(#argName #smalltalkType #smalltalkInitializingExpression)
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptAggregationType: e [ 
	| suffix |
	query = #smalltalkType ifTrue: [^ 'OrderedCollection'].
	query = #smalltalkInitializingExpression 
		ifTrue: [^ 'OrderedCollection new'].
	query = #argName 
		ifTrue: 
			[suffix := self  
						argNameSuffixFor: e elementType.
			^ 'aCollectionOf' , suffix].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptArrayType: e [ 
	| suffix |
	query = #smalltalkType ifTrue: [^ 'OrderedCollection'].
	query = #smalltalkInitializingExpression 
		ifTrue: [^ 'OrderedCollection new'].
	query = #argName 
		ifTrue: 
			[suffix := self  
						argNameSuffixFor: e elementType.
			^ 'anArrayOf' , suffix].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptBagType: e [ 
	| suffix |
	query = #smalltalkType ifTrue: [^ 'Bag'].
	query = #smalltalkInitializingExpression ifTrue: [^ 'Bag new'].
	query = #argName 
		ifTrue: 
			[suffix := self
						argNameSuffixFor: e elementType.
			^ 'aBagOf' , suffix].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptBinaryType: e [ 
	query = #smalltalkType
		ifTrue: [^ 'ByteArray'].
	query = #smalltalkInitializingExpression
		ifTrue: [^ 'nil'].
	query = #argName
		ifTrue: [^ 'aBinary'].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptBooleanType: e [ 
	query = #smalltalkType
		ifTrue: [^ 'Boolean'].
	query = #smalltalkInitializingExpression
		ifTrue: [^ 'false'].
	query = #argName
		ifTrue: [^ 'aBoolean'].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptDefinedType: e [
	^ e domain acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptEntityDefinition: e [ 
	query = #smalltalkType 
		ifTrue: [^ e generatedClassNameFromNamesBuilder: namesBuilder].
	query = #smalltalkInitializingExpression ifTrue: [^ 'nil'].
	query = #argName 
		ifTrue: [^ 'a' , (e generatedClassNameFromNamesBuilder: namesBuilder)].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptEntityDefinitionReference: e [ 
	^ self acceptEntityDefinition: e referenced
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptEntityInstance: e [ 
	query = #smalltalkType
		ifTrue: [^ 'Object'].
	query = #smalltalkInitializingExpression
		ifTrue: [^ 'nil'].
	query = #argName
		ifTrue: [^ 'anObject'].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptEnumerationType: e [ 
	query = #smalltalkType ifTrue: [^ 'Symbol'].
	query = #smalltalkInitializingExpression ifTrue: [^ 'nil'].
	query = #argName 
		ifTrue: 
			[^ 'a' , (e owner generatedClassNameFromNamesBuilder: namesBuilder) , 'Symbol'].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptGeneralAggregateType: e [ 
	| suffix |
	query = #smalltalkType ifTrue: [^ 'OrderedCollection'].
	query = #smalltalkInitializingExpression 
		ifTrue: [^ 'OrderedCollection new'].
	query = #argName 
		ifTrue: 
			[suffix := self 
						argNameSuffixFor: e elementType.
			^ 'aCollectionOf' , suffix].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptGenericType: e [ 
	^ self acceptEntityInstance: e 

]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptIntegerType: e [ 
	query = #smalltalkType
		ifTrue: [^ 'Integer'].
	query = #smalltalkInitializingExpression
		ifTrue: [^ '0'].
	query = #argName
		ifTrue: [^ 'anInteger'].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptListType: e [ 
	| suffix |
	query = #smalltalkType ifTrue: [^ 'OrderedCollection'].
	query = #smalltalkInitializingExpression 
		ifTrue: [^ 'OrderedCollection new'].
	query = #argName 
		ifTrue: 
			[suffix := self 
						argNameSuffixFor: e elementType.
			^ 'aListOf' , suffix].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptLogicalType: e [ 
	query = #smalltalkType
		ifTrue: [^ 'Boolean'].
	query = #smalltalkInitializingExpression
		ifTrue: [^ 'false'].
	query = #argName
		ifTrue: [^ 'aLogical'].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptNamedTypeReference: e [ 
	"query = #smalltalkType 
	ifTrue: [^ self translater classNameFromNamedType: e]. 
	query = #smalltalkInitializingExpression 
	ifTrue: [^ 'nil']. 
	query = #argName 
	ifTrue: [^ 'a' 
	, (self translater classNameFromNamedType: e)]. 
	^ self signal error: 'invalid query'"
	^ e referenced acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptNumberType: e [ 
	query = #smalltalkType
		ifTrue: [^ 'Number'].
	query = #smalltalkInitializingExpression
		ifTrue: [^ '0.0'].
	query = #argName
		ifTrue: [^ 'aNumber'].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptRealType: e [ 
	query = #smalltalkType
		ifTrue: [^ 'Float'].
	query = #smalltalkInitializingExpression
		ifTrue: [^ '0.0'].
	query = #argName
		ifTrue: [^ 'aReal'].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptSelectType: e [ 
	query = #smalltalkType ifTrue: [^ 'Object'].
	query = #smalltalkInitializingExpression ifTrue: [^ 'nil'].
	query = #argName 
		ifTrue: [^ 'a' , (e owner generatedClassNameFromNamesBuilder: namesBuilder)].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptSetType: e [ 
	| suffix |
	query = #smalltalkType ifTrue: [^ 'Set'].
	query = #smalltalkInitializingExpression ifTrue: [^ 'Set new'].
	query = #argName 
		ifTrue: 
			[suffix :=  self 
						argNameSuffixFor: e elementType.
			^ 'aSetOf' , suffix].
	^ self signal error: 'invalid query'
]

{ #category : #'visit dictionary schema' }
PlatypusSmartNamer >> acceptStringType: e [ 
	query = #smalltalkType
		ifTrue: [^ 'String'].
	query = #smalltalkInitializingExpression
		ifTrue: [^ ''''''].
	query = #argName
		ifTrue: [^ 'aString'].
	^ self signal error: 'invalid query'
]

{ #category : #querying }
PlatypusSmartNamer >> argNameSuffixFor: aMetaData [ 
	| argname |
	argname := namesBuilder argNameFor: aMetaData.
	argname size = 1 ifTrue: [^ argname].
	argname first = $a 
		ifTrue: [argname := argname copyFrom: 2 to: argname size].
	argname size = 1 ifTrue: [^ argname].
	argname first = $n 
		ifTrue: [argname := argname copyFrom: 2 to: argname size].
	^ argname
]

{ #category : #accessing }
PlatypusSmartNamer >> query: anObject namesBuilder: aNameBuilder [ 
	query := anObject.
	namesBuilder := aNameBuilder
]
