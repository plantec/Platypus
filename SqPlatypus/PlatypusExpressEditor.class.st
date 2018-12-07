Class {
	#name : #PlatypusExpressEditor,
	#superclass : #PlatypusCodeHolder,
	#category : #'SqPlatypus-HW-CodeHolder'
}

{ #category : #updating }
PlatypusExpressEditor class >> changed: anObject [ 
	super changed: anObject
]

{ #category : #accessing }
PlatypusExpressEditor class >> evaluatorClass [
	^ PlatypusExpressInterpretor
]

{ #category : #'ui building' }
PlatypusExpressEditor >> addButtonsinAlignment: aButtonsAlignment [ 
	| btn |
	super addButtonsinAlignment: aButtonsAlignment.
	{{'32x32/actions/run'. self. #evaluate. 'evaluate it'. #showEvaluateButton}.{'16x16/actions/blue_ok'. self. #verify. 'compile current code'. #showChecksButton}. {'16x16/actions/ok'. self. #accept. 'accept current source'. #showAcceptButton}. {'16x16/actions/smiley'. self. #prettyPrintCode. 'pretty print'. #showPrettyPrintCodeButton}. {'16x16/actions/file_save'. self. #saveAs. 'fileout contents'}. {'16x16/actions/file_read'. self. #openFile. 'filein an Express file'}}
		do: [:arr | arr == #spacer 
				ifTrue: [aButtonsAlignment addSpacer]
				ifFalse: [
					| label |
					label := ImageMorph withForm: (TamIcons icon: arr first).
					btn := (UITheme current
							newButtonIn: World
							for: self
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

{ #category : #'ui building' }
PlatypusExpressEditor >> contentsMorphLayoutFrame [
	^ LayoutFrame identity
		
]

{ #category : #evaluation }
PlatypusExpressEditor >> debugIt [
	| debugger |
	debugger := PlatypusExpressDebugger  sourceHandler: self sourceHandler.
	debugger buildMainWindow openInWorld.
	debugger
		evaluate: (ReadStream on: (self codeText copyFrom: self selectionInterval first to: self selectionInterval last) asString)
]

{ #category : #evaluation }
PlatypusExpressEditor >> doItContext [
	^ self sourceHandler metaData
]

{ #category : #evaluation }
PlatypusExpressEditor >> doItReceiver [
	^ self 
]

{ #category : #'code evaluating' }
PlatypusExpressEditor >> evaluate [
	^ self sourceHandler evaluate
]

{ #category : #'code evaluating' }
PlatypusExpressEditor >> evaluateAndExplore [
	^ self sourceHandler evaluateAndExplore 
]

{ #category : #'code accessing' }
PlatypusExpressEditor >> highlight: aText [
	| h |
	aText size > 0
		ifTrue: [ ^ aText ].
	self sourceHandler ifNil: [ ^ aText ].
	h := (Smalltalk at: #PPTextHighlighter ifAbsent: [ ^ aText ]) new
		parser: (PPExpressGrammar new perform: self sourceHandler elementTag).
	h
		color: 'slotName' with: Color blue twiceDarker twiceDarker;
		color: 'localKW' with: Color blue muchDarker;
		color: 'endLocalKW' with: Color blue muchDarker;
		color: 'schemaKW' with: Color blue muchDarker;
		color: 'endSchemaKW' with: Color blue muchDarker;
		color: 'constantKW' with: Color blue muchDarker;
		color: 'endConstantKW' with: Color blue muchDarker;
		color: 'typeKW' with: Color blue muchDarker;
		color: 'endTypeKW' with: Color blue muchDarker;
		color: 'entityKW' with: Color blue muchDarker;
		color: 'endEntityKW' with: Color blue muchDarker;
		color: 'functionKW' with: Color blue muchDarker;
		color: 'endFunctionKW' with: Color blue muchDarker;
		color: 'procedureKW' with: Color blue muchDarker;
		color: 'endProcedureKW' with: Color blue muchDarker;
		color: 'ruleKW' with: Color blue muchDarker;
		color: 'endRuleKW' with: Color blue muchDarker;
		color: 'literal' with: Color gray darker darker;
		color: 'unresolvedIdentifier' with: Color magenta muchDarker;
		color: 'toKW' with: Color blue muchDarker;
		color: 'thenKW' with: Color blue muchDarker;
		color: 'elseKW' with: Color blue muchDarker;
		color: 'forKW' with: Color blue muchDarker.
	^ [ h highlight: aText asText ]
		on: Error
		do: [ aText ]
]

{ #category : #accessing }
PlatypusExpressEditor >> possibleReplacementsFromPrefix: aPrefix [
	"returns the value of labels from a selector prefix"
	| key elements |
	elements := self sourceHandler bindings asSet.
	key := aPrefix asLowercase.
	^ (aPrefix
		ifEmpty: [elements collect: [:e | e name]]
		ifNotEmpty: [(elements collect: [:e | e name]) select: [:n | n asLowercase beginsWith: key]]) asArray sort.

]

{ #category : #'pretty printing' }
PlatypusExpressEditor >> prettyPrint [
	self prettyPrintCode
]

{ #category : #'pretty printing' }
PlatypusExpressEditor >> prettyPrintCode [
	| ppTokenList |
	self sourceHandler notNil
		ifTrue: [Cursor wait
				showWhile: [ppTokenList := (PlatypusExpressScanner on: self contentsMorph text readStream ) buildTokenList.
					^ self prettyPrintTokenList: ppTokenList]].
	^ ''
]

{ #category : #'pretty printing' }
PlatypusExpressEditor >> prettyPrintTokenList: aTokenList [ 
	| code ppTokenList streamClass |
	Cursor wait
		showWhile: [streamClass := self sourceHandler
						codeStreamClassFor: aTokenList
						from: aTokenList first
						to: aTokenList last.
			ppTokenList := PlatypusStepTokenPrettyPrinter new
						prettyPrint: aTokenList
						from: aTokenList first
						to: aTokenList last
						startLevel: self sourceHandler startLevel
						font: self codeFont
						maxLineWidth: contentsMorph bounds width - 5.
			ppTokenList noEndingEol.
			code := ppTokenList textWithStreamClass: streamClass.
			self acceptContents: code.
			self changed: #contents.
			contentsMorph hasUnacceptedEdits: true.
			^ code]
]

{ #category : #'pretty printing' }
PlatypusExpressEditor >> prettyPrintWithColor [
	self prettyPrintCode
]

{ #category : #accessing }
PlatypusExpressEditor >> replacementFor: aString [
	^ aString
]

{ #category : #'pretty printing' }
PlatypusExpressEditor >> reversePrintCode [
	| ppTokenList |
	self sourceHandler notNil
		ifTrue: [Cursor wait
				showWhile: [ppTokenList := PlatypusSchemaInstanceTokenizer singleton tokenize: self sourceHandler metaData.
					^ self prettyPrintTokenList: ppTokenList]].
	^ ''
]

{ #category : #menu }
PlatypusExpressEditor >> saveAs [
	^ self sourceHandler menuSaveAs
]

{ #category : #accessing }
PlatypusExpressEditor >> schemaInstance [ 
	^ self sourceHandler schemaInstance
]

{ #category : #'ui building' }
PlatypusExpressEditor >> showAcceptButton [
	^ self sourceHandler notNil and: [self hasUnacceptedEdits]
]

{ #category : #'ui building' }
PlatypusExpressEditor >> showChecksButton [
	^ self sourceHandler notNil
		and: [self showAcceptButton not
				and: [self sourceHandler isEditable
						and: [self sourceHandler knownAsInvalid ]]]
]

{ #category : #'ui building' }
PlatypusExpressEditor >> showEvaluateButton [
	^ self sourceHandler notNil
		and: [self showAcceptButton not
			and: [self sourceHandler isEditable
				and: [self sourceHandler knownAsInvalid not
						and: [self sourceHandler metaData notNil 
							and: [self sourceHandler metaData isPltStatementsContainer]]]]]
]

{ #category : #'ui building' }
PlatypusExpressEditor >> showPrettyPrintCodeButton [
	^ self sourceHandler notNil
		and: [self sourceHandler isEditable]
]

{ #category : #'code accessing' }
PlatypusExpressEditor >> text [
	^ self codeText

]

{ #category : #evaluation }
PlatypusExpressEditor >> update: aSymbol [ 
	self hasUnacceptedEdits
		ifTrue: [^ false].
	(self sourceHandler isNil
			or: [self sourceHandler isReleased])
		ifTrue: [self acceptContents: ''.
			self changed: #contents. ^ false].
	((aSymbol isKindOf: PlatypusListItemReference)
			and: [(aSymbol isInSubTreeOf: self sourceHandler)
					or: [self sourceHandler isInSubTreeOf: aSymbol]])
		ifTrue: [self acceptContents: self codeText.
			self changed: #contents].
	super update: aSymbol.
	aSymbol = #messagesBrowser
		ifTrue: [self updateMessagesBrowser]
]
