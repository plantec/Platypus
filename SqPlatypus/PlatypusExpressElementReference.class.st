Class {
	#name : #PlatypusExpressElementReference,
	#superclass : #PlatypusExpressReference,
	#instVars : [
		'startNode',
		'stopNode',
		'name',
		'metaData',
		'generatedClassRef'
	],
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #'initialize/release' }
PlatypusExpressElementReference >> destroy [
	metaData 
		ifNotNil: [
			metaData deepDestroy.
			metaData := nil].
	startNode := nil.
	stopNode := nil.
	super destroy
]

{ #category : #checking }
PlatypusExpressElementReference >> doInternalChecking [
	self knownAsInvalid
		ifFalse: [super doInternalChecking.
			self assert: self metaData owner = self owner metaData.
			self assert: self name asUppercase = self metaData name asUppercase]
]

{ #category : #accessing }
PlatypusExpressElementReference >> elementTag [ 
	^ self lexicalElement
]

{ #category : #accessing }
PlatypusExpressElementReference >> metaData [
	^ metaData
]

{ #category : #accessing }
PlatypusExpressElementReference >> metaData: aMetaData [
	metaData := aMetaData
]

{ #category : #accessing }
PlatypusExpressElementReference >> name [
	^ name
]

{ #category : #accessing }
PlatypusExpressElementReference >> name: aString [
	 name := aString
]

{ #category : #accessing }
PlatypusExpressElementReference >> nameNode [
	^ self tokenList nextNonBlankFrom: self subReferencesScanStart
]

{ #category : #'code updating' }
PlatypusExpressElementReference >> relabelWith: newName [ 
	| metaDataOwner code oldOwner parserResult oldName |
	metaDataOwner := self metaData owner.
	oldName := self name.
	self nameNode lexicalElement: newName.
	code := self codeString.
	oldOwner := self owner.
	parserResult := self expressParserClass
				parse: code
				startingAt: self smaCCStartingState
				owner: metaDataOwner
				onError: [:d :p | 
					self nameNode lexicalElement: oldName.
					nil].
	parserResult
		ifNotNil: [
			self replaceTokenListWithParserResult: parserResult.
			self name: newName.
			self treeHasChanged]
]

{ #category : #'code updating' }
PlatypusExpressElementReference >> removeSilently [
	self owner
		ifNotNil: [
			self tokenList
				ifNotNil: [	
					self logToChangesRemoving: self oldCodeText: self codeText.
					self tokenList 
						removeFrom: (self tokenList beginningOfLineFrom: self startNode)
						to: (self tokenList endOfLineFrom: self stopNode)]].
	super removeSilently
]

{ #category : #'code updating' }
PlatypusExpressElementReference >> replaceTokenListWithParserResult: aParserResult [ 
	aParserResult metaData name asUppercase = self name asUppercase
		ifTrue: [super replaceTokenListWithParserResult: aParserResult]
		ifFalse: [
			self owner addFromTokenList: aParserResult tokenList.
			TamBrowser reloadEditorFor: self].

]

{ #category : #accessing }
PlatypusExpressElementReference >> schemaInstanceReference [
	^ (self owner isKindOf: PlatypusExpressReference)
		ifTrue: [self owner schemaInstanceReference]
]

{ #category : #accessing }
PlatypusExpressElementReference >> shortName [
	^ self name 

]

{ #category : #accessing }
PlatypusExpressElementReference >> startNode [
	^ startNode
]

{ #category : #accessing }
PlatypusExpressElementReference >> startNode: aNode [
	startNode := aNode
]

{ #category : #accessing }
PlatypusExpressElementReference >> stopNode [
	^ stopNode 
]

{ #category : #accessing }
PlatypusExpressElementReference >> stopNode: aNode [
	stopNode := aNode
]
