Class {
	#name : #PlatypusListItemReference,
	#superclass : #TamListItemReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #menu }
PlatypusListItemReference class >> subMenuLabel [
	^nil
]

{ #category : #testing }
PlatypusListItemReference >> canEvaluate [
	^ false
]

{ #category : #testing }
PlatypusListItemReference >> canHaveCachedEditor [
	"if true, my editor will be cached by the browser so that next editing  
	will reuse cached editor"
	^ false
]

{ #category : #updating }
PlatypusListItemReference >> cleanAllEvaluations [
	self children do: [:c | c cleanAllEvaluations ].
	self reinitializeEvaluatedContents.
	self treeHasChanged 
]

{ #category : #accessing }
PlatypusListItemReference >> codeText [
	^ self codeString
]

{ #category : #accessing }
PlatypusListItemReference >> emphasisModel [
	self metaData ifNil: [^ TamListItemMorphEmphasisModel boldRedStandard].
	 ^ self metaData  errors
		ifEmpty: [TamListItemMorphEmphasisModel standard]
		ifNotEmpty: [TamListItemMorphEmphasisModel redStandard]

]

{ #category : #accessing }
PlatypusListItemReference >> errors [
	^ self metaData ifNil: [#()] ifNotNil: [:md | md errors]
]

{ #category : #accessing }
PlatypusListItemReference >> expressParserClass [
	^ SmalltalkImage  current classNamed: self expressParserClassName asSymbol
]

{ #category : #accessing }
PlatypusListItemReference >> expressParserClassName [
	^ self rootDictionaryReference expressParserClassName
]

{ #category : #updating }
PlatypusListItemReference >> isInSubTreeOf: anotherReference [
	self = anotherReference ifTrue: [^ true].(self owner isKindOf: PlatypusListItemReference) ifFalse: [^ false].
	^ self owner  isInSubTreeOf: anotherReference.

]

{ #category : #menus }
PlatypusListItemReference >> keyStroke: aCharacter from: aListMorph [ 
	super keyStroke: aCharacter from: aListMorph.
	aCharacter = $p
		ifTrue: [^ self menuCodePane].

]

{ #category : #testing }
PlatypusListItemReference >> knownAsInvalid [
	^ self metaData isNil or: [self metaData errors notEmpty]
]

{ #category : #menus }
PlatypusListItemReference >> menuCleanAllEvaluations [
	self cleanAllEvaluations.

]

{ #category : #menus }
PlatypusListItemReference >> menuCodePane [
	| codePane |
	codePane := self editorClass new sourceHandler: self.
	codePane buildMainWindow.
	^ codePane openAsMorph
]

{ #category : #enumerating }
PlatypusListItemReference >> recursivelyDo: aBlock [
	aBlock value: self.
	self subReferences 
		do: [:sr | sr ifNotNil: [sr recursivelyDo: aBlock]].

]

{ #category : #'initialize/release' }
PlatypusListItemReference >> reinitialize [

]

{ #category : #updating }
PlatypusListItemReference >> reinitializeEvaluatedContents [

]

{ #category : #updating }
PlatypusListItemReference >> reinitializeLabelSilently [
]

{ #category : #accessing }
PlatypusListItemReference >> rootDictionaryReference [
	^ self schemaInstanceReference
]

{ #category : #accessing }
PlatypusListItemReference >> schemaInstanceReference [ 
	^ self owner schemaInstanceReference 
]

{ #category : #checking }
PlatypusListItemReference >> verify [
	self verifySilently.
	self treeHasChanged 
	
]

{ #category : #checking }
PlatypusListItemReference >> verifySilently [
	
]

{ #category : #checking }
PlatypusListItemReference >> verifyUsedModelsBeforeChecking [
	^ self schemaInstanceReference verifyUsedModelsBeforeChecking
]
