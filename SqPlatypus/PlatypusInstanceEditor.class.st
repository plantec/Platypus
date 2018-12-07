Class {
	#name : #PlatypusInstanceEditor,
	#superclass : #PlatypusCodeHolder,
	#category : #'SqPlatypus-HW-CodeHolder'
}

{ #category : #'ui building' }
PlatypusInstanceEditor >> addButtonsinAlignment: aButtonsAlignment [ 
	| btn |
	super addButtonsinAlignment: aButtonsAlignment.
	{{'32x32/actions/run'. self. #evaluate. 'evaluate it'. #showEvaluateButton}. {'16x16/actions/p21_syntax'. self. #menuSwitchP21Syntax. 'switch between p21 and alternative syntax'. #showSwitchP21SyntaxButton}. {'16x16/actions/blue_ok'. self. #verify. 'compile current code'. #showChecksButton}. {'16x16/actions/ok'. self. #accept. 'accept current source'. #showAcceptButton}. {'16x16/actions/file_save'. self. #saveAs. 'save contents into a step file'. #showSaveButton}. {'16x16/actions/file_read'. self. #openFile. 'read a file'}}
		do: [:arr | arr == #spacer
				ifTrue: [aButtonsAlignment addSpacer]
				ifFalse: [
					| label |
					label := ImageMorph withForm: (TamIcons icon: arr first).
					btn := (UITheme current
							newButtonIn: World
							for: arr second
							getState: nil 
							action: arr third
							arguments: { }
							getEnabled: (arr size >= 5 ifTrue: [arr fifth])
							getLabel: nil
							help: arr fourth translated)
								label: label;
									yourself.
					aButtonsAlignment addMorph: btn]]
]

{ #category : #accessing }
PlatypusInstanceEditor >> codeTextFromInstance: anInstance [
	^ String streamContents: [:strm |
		PlatypusModelContentsStepWriter new
			stream: strm 
			modelContents: self modelContents 
			instance: anInstance 
			p21Syntax: self useP21Syntax
			annote: true]
]

{ #category : #menu }
PlatypusInstanceEditor >> contentsMenu: aMenu shifted: shifted [ 
	| m |
	m := super contentsMenu: aMenu shifted: shifted.
	m addList: {#-. {'New instance (q)' translated.	#querySymbol} }.
	^ m

]

{ #category : #evaluation }
PlatypusInstanceEditor >> doItContext [
	^ self sourceHandler
]

{ #category : #evaluation }
PlatypusInstanceEditor >> doItReceiver [
	^ self 
]

{ #category : #evaluating }
PlatypusInstanceEditor >> evaluate [
	^ self sourceHandler evaluate
]

{ #category : #'code accessing' }
PlatypusInstanceEditor >> highlight: aText [
	| h hcls |
	hcls := (Smalltalk at: #PPTextHighlighter ifAbsent: [ ^ aText ]).
	h := hcls new parser: ((PPStepGrammar new) perform: self sourceHandler elementTag).
	aText size < 100000
		ifTrue: [
			h
				color: 'typeAnnotation' with: Color gray muchDarker;
				color: 'entityName' with: Color magenta muchDarker;
				color: 'string' with: Color blue twiceDarker;
				color: 'boolean' with: Color blue muchDarker;
				color: 'enum' with: Color blue muchDarker;
				color: 'instRef' with: Color blue muchDarker;
				color: 'null' with: Color blue muchDarker;
				color: 'redefined' with: Color blue muchDarker].
	^ [h highlight: aText asText] on: Error do: [aText]

]

{ #category : #menu }
PlatypusInstanceEditor >> menuStepWrite [
	| stream result fullFilename |
	(self sourceHandler isKindOf: PlatypusModelContentsReference)
		ifTrue: [self sourceHandler menuStepWrite]
		ifFalse: [fullFilename := UITheme current
						fileSaveIn: World
						title: 'File name'
						extensions: #('step' ) 
						path: ''.
			fullFilename
				ifNotNil: [[stream := (Filename named: fullFilename) writeStream.
					stream
						nextPutAll: (String
								readFrom: (ReadStream on: self contentsMorph getText asString))]
						ensure: [stream
								ifNotNil: [stream close]]]]
]

{ #category : #menu }
PlatypusInstanceEditor >> menuSwitchP21Syntax [
	self swithP21Syntax.
	self acceptContents: self codeText.
	self changed: #contents
]

{ #category : #accessing }
PlatypusInstanceEditor >> modelContents [  
	^ self sourceHandler modelContents  
]

{ #category : #menu }
PlatypusInstanceEditor >> openFile [
	| result |
	result := Tamaris
			chooseFilePathMatching:  #('*.step' '*.p21' '*.STEP' '*.P21')
			label: 'Choose a STEP file to read' translated.
	result
		ifNotNil: [ | strm |
			[contents := (strm := StandardFileStream oldFileNamed: result) contentsOfEntireFile ]
				ensure: [strm close].
			self acceptContents: contents.
			self changed: #contents.
			"self hasUnacceptedEdits: true"]
]

{ #category : #accessing }
PlatypusInstanceEditor >> possibleReplacementsFromPrefix: aPrefix [
	"returns the value of labels from a selector prefix"
	| names schemata entities key |
	schemata := self schemaInstance schemata.
	key := aPrefix asLowercase.
	entities := schemata 
		inject: Set new
		into: [:c :e | c addAll: e entities; yourself].
	names := entities collect: [:e | e name].
	^ (aPrefix
		ifEmpty: [names]
		ifNotEmpty: [(names select: [:n | n asLowercase beginsWith: key])
			ifEmpty: [names]]) asArray sort.
]

{ #category : #accessing }
PlatypusInstanceEditor >> replacementFor: aString [
	^ (self schemaInstance lookUpEntityDefinitionBN: aString)
		ifNotNil: [:ent | | inst |
			inst := ent emptyInternalRepresentation.
			inst persistentLabel: self sourceHandler modelContentsReference newPersistentLabel.
			String streamContents: [:strm |
				PlatypusModelContentsStepWriter new
					stream: strm 
					modelContents: self modelContents 
					instance: inst 
					p21Syntax: false
					annote: true.
				strm cr ] ]
]

{ #category : #menu }
PlatypusInstanceEditor >> saveAs [
	^ self menuStepWrite
]

{ #category : #accessing }
PlatypusInstanceEditor >> schemaInstance [ 
	^ self sourceHandler schemaInstance 
]

{ #category : #'ui building' }
PlatypusInstanceEditor >> showAcceptButton [
	^ self sourceHandler notNil
				and: [self sourceHandler modelContents notNil
						and: [self hasUnacceptedEdits]]
]

{ #category : #'ui building' }
PlatypusInstanceEditor >> showChecksButton [
	^ self sourceHandler notNil
		and: [self showAcceptButton not 
			and: [self sourceHandler notNil	
				and: [self sourceHandler knownAsInvalid]]]
]

{ #category : #'ui building' }
PlatypusInstanceEditor >> showEvaluateButton [
	^( ((self sourceHandler notNil and: [self sourceHandler canEvaluate]) and: [self sourceHandler knownAsInvalid not]))
		and: [self showAcceptButton not]
]

{ #category : #'ui building' }
PlatypusInstanceEditor >> showSaveButton [
	^ (self sourceHandler isKindOf: PlatypusModelContentsReference)
]

{ #category : #'ui building' }
PlatypusInstanceEditor >> showSwitchP21SyntaxButton [
	^ self sourceHandler notNil
		"and: [self sourceHandler value isValue not]"
]

{ #category : #menu }
PlatypusInstanceEditor >> swithP21Syntax [
	self useP21Syntax: self useP21Syntax not
]

{ #category : #'code updating' }
PlatypusInstanceEditor >> update: aSymbol [ 
	| doUpdate |
	doUpdate := false.
	self hasUnacceptedEdits
		ifFalse:  [(aSymbol isKindOf: PlatypusListItemReference)
				ifTrue: [self sourceHandler notNil
						ifTrue: [(self sourceHandler isReleased
									or: [(aSymbol includes: self sourceHandler)
											or: [self sourceHandler includes: aSymbol]])
								ifTrue: [doUpdate := true]]].
			aSymbol == #PlatypusDictionary
				ifTrue: [doUpdate := true].
			doUpdate
				ifTrue: [self sourceHandler isReleased
						ifTrue: [sourceHandler := nil].
					self acceptContents: self codeText.
					self changed: #contents].
			super update: aSymbol].
	self updateMessagesBrowser
]

{ #category : #accessing }
PlatypusInstanceEditor >> useP21Syntax [
	^ self sourceHandler useP21Syntax
]

{ #category : #accessing }
PlatypusInstanceEditor >> useP21Syntax: aBoolean [ 
	self sourceHandler useP21Syntax: aBoolean
]
