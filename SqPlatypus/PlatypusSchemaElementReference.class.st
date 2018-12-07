Class {
	#name : #PlatypusSchemaElementReference,
	#superclass : #PlatypusExpressElementReference,
	#instVars : [
		'subContents'
	],
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #copying }
PlatypusSchemaElementReference >> copy [
	| cpy |
	cpy := super copy.
	cpy subContents: nil.
	^ cpy
]

{ #category : #'initialize/release' }
PlatypusSchemaElementReference >> destroy [
	self reinitialize.
	super destroy
]

{ #category : #evaluating }
PlatypusSchemaElementReference >> evaluate [
	| result value position |
	self canEvaluate 
		ifFalse: [^ false ].
	result := false.
	self  knownAsInvalid
		ifTrue: [self inform: 'Express model must checked']
		ifFalse: [(result := self metaData evaluate)
				ifNotNil: [(result isKindOf: PlatypusExpressInterpretor)
						ifFalse: [position := self subContents size + 1.
							value := result val.
							(value isPltAggregateInstance
									and: [value size = 1])
								ifTrue: [self subContents
										add: ((value at: 1) tamarisStepValueReferenceClass
												owner: self
												position: position
												value: (value at: 1))]
								ifFalse: [self subContents
										add: (value tamarisStepValueReferenceClass
												owner: self
												position: position
												value: value)].
							TamManager changed: self]]].
	^ result
]

{ #category : #evaluating }
PlatypusSchemaElementReference >> evaluateAndExplore [ 
	^ self metaData evaluateAndExplore 
]

{ #category : #testing }
PlatypusSchemaElementReference >> isSchemaElement [
	^ true
]

{ #category : #menus }
PlatypusSchemaElementReference >> keyStroke: aCharacter from: aListMorph [ 
	super keyStroke: aCharacter from: aListMorph.

]

{ #category : #accessing }
PlatypusSchemaElementReference >> lexicalElement [
	^ self class lexicalElement
]

{ #category : #menus }
PlatypusSchemaElementReference >> menuTranslationParameters [	
]

{ #category : #accessing }
PlatypusSchemaElementReference >> modelContentsReference [
	^ self schemaInstanceReference 
		ifNotNil: [:schir | schir modelContentsReferences 
			ifNotNil: [:mcrs | mcrs ifNotEmpty: [mcrs first]]]
]

{ #category : #'initialize/release' }
PlatypusSchemaElementReference >> reinitialize [
	self reinitializeEvaluatedContents.
	super reinitialize
]

{ #category : #updating }
PlatypusSchemaElementReference >> reinitializeEditor [
	self reinitialize.
	^ super reinitializeEditor
]

{ #category : #'initialize/release' }
PlatypusSchemaElementReference >> reinitializeEvaluatedContents [
	subContents ifNotNil: [subContents do: [:s | s destroy]].
	subContents := nil.
	super reinitializeEvaluatedContents
]

{ #category : #updating }
PlatypusSchemaElementReference >> removeAt: aPosition [ 
	| sr |
	(self subContents removeAt: aPosition) destroy.
	aPosition to: self subContents size
		do: [:p | (sr := self subContents at: p) pos: sr pos - 1]
]

{ #category : #accessing }
PlatypusSchemaElementReference >> smaCCStartingState [
	| openkw |
	openkw := self lexicalElement.
	^ self expressParserClass perform: ('startingStateFor' , openkw
	capitalized , 'Entry') asSymbol

]

{ #category : #menus }
PlatypusSchemaElementReference >> specificMenu: menu shifted: b [ 
	"Set up the menu to apply to the receiver's, honoring 
	the #shifted boolean"
	| menuExpress |
	super specificMenu: menu shifted: b.
	menu addLine.
	menuExpress := MenuMorph new.
	#(#- #('save as... (S)' #menuSaveAs) #- #('code pane (p)' #menuCodePane) #('clean all evaluation results' #menuCleanAllEvaluations ) #- #('translate here (t)' #menuTranslate2Pharo) #('translate to VisualWorks' #menuTranslate2VisualWorks) )
		do: [:item | item == #-
				ifTrue: [menuExpress addLine]
				ifFalse: [menuExpress
						add: item first
						target: self
						selector: item second]].
	menu
		add: 'express ...'
		target: self
		selector: nil
		argumentList: #().
	menu lastItem subMenu: menuExpress.
	self metaData isPltStatementsContainer
		ifTrue: [menu addLine.
			menu
				add: 'evaluate'
				target: self
				selector: #evaluate.
			menu
				add: 'evaluate and explore'
				target: self
				selector: #evaluateAndExplore.
			menu addLine].
	^ menu
]

{ #category : #accessing }
PlatypusSchemaElementReference >> startLevel [
	^1
]

{ #category : #accessing }
PlatypusSchemaElementReference >> subContents [
	^ subContents
		ifNil: [subContents := OrderedCollection new].

]

{ #category : #accessing }
PlatypusSchemaElementReference >> subContents: aCollectionOrNil [ 
	subContents := aCollectionOrNil
]

{ #category : #menus }
PlatypusSchemaElementReference >> translateWithTranslator: aTranslator [ 
	^ aTranslator localTranslate: self metaData 
]
