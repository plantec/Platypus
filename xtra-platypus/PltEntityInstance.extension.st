Extension { #name : #PltEntityInstance }

{ #category : #'*xtra-platypus-checking' }
PltEntityInstance >> addError: anError [
	(self errors anySatisfy: [:e | e message = anError message and: [e path = anError path]])
		ifTrue: [^self].
	self schemaInstance ifNotNil: [:schi | schi addError: anError for: self]
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> asClearText [
	^ self printableCode

]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityInstance >> assignableValue [ 
	^ self
]

{ #category : #'*xtra-platypus-type-infering' }
PltEntityInstance >> computedDomain [
	^ nil

]

{ #category : #'*xtra-platypus-copying' }
PltEntityInstance >> deepCopy [
	^ super copy.

]

{ #category : #'*xtra-platypus-releasing' }
PltEntityInstance >> deepDestroy [
	PlatypusMetaDataDestroyer new acceptTry: self
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityInstance >> equal: other [ 
	^ PltLogicalLiteral val: (self == other)
]

{ #category : #'*xtra-platypus-checking' }
PltEntityInstance >> errors [
	^ self schemaInstance ifNil: [#()] ifNotNil: [:schi | schi errorsFor: self]
]

{ #category : #'*xtra-platypus-code-generating' }
PltEntityInstance >> generatedClassName [
	^ self  namesBuilder normalizedClassNameFrom: self name suffix: self generatedClassNameSuffix
]

{ #category : #'*xtra-platypus-code-generating' }
PltEntityInstance >> generatedClassNameFromNamesBuilder: aNamesBuilder [
	^ aNamesBuilder normalizedClassNameFrom: self name suffix: self generatedClassNameSuffix
]

{ #category : #'*xtra-platypus-code-generating' }
PltEntityInstance >> generatedClassNameSuffix [
	^ ''
]

{ #category : #'*xtra-platypus-code-generating' }
PltEntityInstance >> generatedNamespaceName [
	^ self namesBuilder systemCategoryPrefix
]

{ #category : #'*xtra-platypus-code-generating' }
PltEntityInstance >> generatedQualifiedClassName [

	^ self generatedNamespaceName , '.', self generatedClassName
]

{ #category : #'*xtra-platypus-code-generating' }
PltEntityInstance >> generatedSystemCategory [
	^ self systemCategoryFromNamesBuilder: self namesBuilder 
]

{ #category : #'*xtra-platypus-code-generating' }
PltEntityInstance >> generatedSystemCategoryPrefix [
	^ self namesBuilder systemCategoryPrefix
]

{ #category : #'*xtra-platypus-code-generating' }
PltEntityInstance >> generatedSystemCategorySuffix [
	^ ''
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> groupClass [
	^ nil
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityInstance >> hash [
	^ super hash
]

{ #category : #'*xtra-platypus-controlling' }
PltEntityInstance >> ifMissing: missingBlock [ 
	^ nil
]

{ #category : #'*xtra-platypus-controlling' }
PltEntityInstance >> ifMissing: missingBlock ifNotMissing: notMissingBlock [ 
	^ notMissingBlock value
]

{ #category : #'*xtra-platypus-controlling' }
PltEntityInstance >> ifNotMissing: notMissingBlock [ 
	^ notMissingBlock value
]

{ #category : #'*xtra-platypus-controlling' }
PltEntityInstance >> ifNotMissing: notMissingBlock ifMissing: missingBlock [ 
	^ notMissingBlock value
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityInstance >> includesVal: other [ 
	^ self instEqual: other
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> inclusiveOwnerPath [
	| p t |
	p := OrderedCollection new.
	t := self.
	[t notNil] whileTrue: [
	p size > 100 ifTrue: [self halt].
		(p includes: t) 
			ifTrue: [t := nil]
			ifFalse: [
				p addFirst: t. 
				t := t owner]].
	^ p
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> initializedValue [
	^ PltMissingValue new
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityInstance >> instEqual: other [ 
	^ (self equal: other)
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityInstance >> instNotEqual: other [ 
	^ (self instEqual: other) not
]

{ #category : #'*xtra-platypus-testing' }
PltEntityInstance >> isLink [
	^ false
]

{ #category : #'*xtra-platypus-classification' }
PltEntityInstance >> isPltAggregateCompatibleType [
	^ false
]

{ #category : #'*xtra-platypus-classification' }
PltEntityInstance >> isPltAggregateOrStringType [
	^ self isPltAggregateCompatibleType
		or: [self isPltStringType]
]

{ #category : #'*xtra-platypus-classification' }
PltEntityInstance >> isPltNumberOrStringType [
	^ false
]

{ #category : #'*xtra-platypus-classification' }
PltEntityInstance >> isPltOrderedLiteral [
	^ false
]

{ #category : #'*xtra-platypus-classification' }
PltEntityInstance >> isPltValue [
	^ false
]

{ #category : #'*xtra-platypus-testing' }
PltEntityInstance >> linked [
	^ self
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> linkedMetaData [
	^ self
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> lookUpIdentifierBN: aName [ 
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> lookUpNamedTypeBN: aName [ 
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> lookUpSchemaInstanceBN: aName [ 
	| key ref |
	key := aName asUppercase.
	ref := PlatypusSchemaInstanceReference allSchemaInstancesReferences 
				detect: [:schi | schi schemaInstance name asUppercase = key]
				ifNone: [].
	^ ref ifNotNil: [ref schemaInstance]
]

{ #category : #'*xtra-platypus-code-generating' }
PltEntityInstance >> namesBuilder [
	^ self schemaInstance namesBuilder
]

{ #category : #'*xtra-platypus-instance-creation' }
PltEntityInstance class >> new [
	^ super new stepInitialize
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityInstance >> notEqual: other [ 
	^ (self equal: other) not
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> ownerPath [ 
	^ self inclusiveOwnerPath allButLast

]

{ #category : #'*xtra-platypus-tamaris' }
PltEntityInstance >> ownerTamarisItemRef [
	| ref curr |
	ref := self tamarisItemRef.
	curr := self.
	[ref isNil] whileTrue: [
		ref := curr tamarisItemRef.
		curr := curr owner. curr ifNil: [^curr]].
	^ ref

]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityInstance >> pushContextInInterpretor: anInterpretor [ 
	anInterpretor
		pushContext: (self interpretorContextClass contextInstance: self)
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> referenced [
	^ self
]

{ #category : #'*xtra-platypus-type-infering' }
PltEntityInstance >> removeCachedDomain [
]

{ #category : #'*xtra-platypus-tamaris' }
PltEntityInstance >> removeTamarisItemRef [
	| schi |
	(schi := self schemaInstance)
		ifNotNil: [schi removeTamarisItemRefFor: self]
]

{ #category : #'*xtra-platypus-code-generating' }
PltEntityInstance >> rootClassSystemCategory [
	^ self namesBuilder rootClassSystemCategory
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> schemaDefinition [
	^ self owner schemaDefinition
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> schemaInstance [
	^ self owner ifNotNil: [:o | o schemaInstance]
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance >> selectionString [
	^ self printableCode
]

{ #category : #'*xtra-platypus-code-generating' }
PltEntityInstance >> systemCategoryFromNamesBuilder: aNameBuilder [ 
	^ self schemaDefinition  systemCategoryFromNamesBuilder: aNameBuilder
]

{ #category : #'*xtra-platypus-tamaris' }
PltEntityInstance >> tamarisChildrenIntoOwner: aReference [ 
	^ OrderedCollection new
]

{ #category : #'*xtra-platypus-tamaris' }
PltEntityInstance >> tamarisItemRef [
	^ self schemaInstance 
		ifNotNil: [:schi | schi tamarisItemRefOf: self]
]

{ #category : #'*xtra-platypus-tamaris' }
PltEntityInstance >> tamarisItemRef: new [ 
	(self schemaInstance)
		ifNotNil: [:schi | schi tamarisItemRef: new for: self]
]

{ #category : #'*xtra-platypus-evaluating' }
PltEntityInstance >> val [
	^ self
]

{ #category : #'*xtra-platypus-code-generating' }
PltEntityInstance >> variableHolders [
	^ OrderedCollection new
]

{ #category : #'*xtra-platypus-visiting' }
PltEntityInstance >> visitedBy: aVisitor [ 
	^ self
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstance class >> visualworksName [
	^ self vwNamespaceName , '.' , self name
]
