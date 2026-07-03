Class {
	#name : 'PlatypusNativeCodeInterpretor',
	#superclass : 'Object',
	#instVars : [
		'receiver',
		'requestor',
		'source',
		'preparsed',
		'replacementPositions',
		'announcer'
	],
	#category : 'Platypus-HW-interpreter',
	#package : 'Platypus',
	#tag : 'HW-interpreter'
}

{ #category : 'private' }
PlatypusNativeCodeInterpretor class >> methodFrom: aString class: aClass requestor: aRequestor ifFail: failBlock [ 
	| methodNode compiler |
	(compiler := Smalltalk compilerClass new)
		source: 'EvaluatePlatypusInterpreterNativeCode ', aString;
		class: aClass;
		requestor: aRequestor;
		noPattern: false;
		failBlock: [^ failBlock value].
	methodNode := compiler compile.
	^ methodNode
]

{ #category : 'accessing' }
PlatypusNativeCodeInterpretor >> announcer [ 

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'requestor error notification' }
PlatypusNativeCodeInterpretor >> correctFrom: begin to: end with: correctWord [ 
	| offset |
	offset := self notificationOffsetAt: begin.
	begin > source size
		ifTrue: [begin < offset 
					ifTrue: [requestor
					correctFrom: offset + 3
					to: end + (offset - begin) + 3
					with: correctWord]
					ifFalse: [requestor
					correctFrom: begin
					to: end 
					with: correctWord]]
		ifFalse: [requestor
				correctFrom: begin + offset + 1
				to: end + offset + 1
				with: correctWord]
]

{ #category : 'requestor error notification' }
PlatypusNativeCodeInterpretor >> deselect [
	^ requestor deselect
]

{ #category : 'interpreting' }
PlatypusNativeCodeInterpretor >> evaluate: e interpretor: anInterpretor requestor: aRequestor [ 
	| method |
	receiver := PlatypusExpressInterpretorWrapper interpreter: anInterpretor.
	(method := e cachedMethod)
		ifNil: [replacementPositions := OrderedCollection new.
			source := e code.
			self requestor: aRequestor.
			self preparse.
			method := self class
						methodFrom: preparsed contents
						class: receiver class
						requestor: aRequestor
						ifFail: [self halt].
			e cachedMethod: method].
	^ self evaluateMethod: method
]

{ #category : 'interpreting' }
PlatypusNativeCodeInterpretor >> evaluateMethod: aMethod [ 
	| selector |
	selector := #EvaluatePlatypusInterpreterNativeCode.
	receiver class addSelectorSilently: selector withMethod: aMethod.
	self class organization classify: selector under: #'platypus interpreting'.
	^ receiver EvaluatePlatypusInterpreterNativeCode
]

{ #category : 'accessing' }
PlatypusNativeCodeInterpretor >> getText [ 

	^ source copy
]

{ #category : 'private' }
PlatypusNativeCodeInterpretor >> methodFrom: aString class: aClass requestor: aRequestor ifFail: failBlock [ 
	| methodNode compiler |
	(compiler := Smalltalk compilerClass new)
		source: 'EvaluatePlatypusInterpreterNativeCode ', aString asString;
		class: aClass;
		requestor: aRequestor;
		noPattern: false;
		failBlock: [^ failBlock value].
	methodNode := compiler compile.
	^ methodNode
]

{ #category : 'requestor error notification' }
PlatypusNativeCodeInterpretor >> notificationOffsetAt: location [ 
	| offset |
	offset := (self text asString findString: source).
	replacementPositions
		do: [:triplet | 
			location < triplet first
				ifTrue: [^ offset].
			offset := offset - (triplet third - triplet second) + 3].
	^ offset
]

{ #category : 'requestor error notification' }
PlatypusNativeCodeInterpretor >> notify: error at: location in: stream [ 
	| window |
	window := (StandardWindow labelled: error)
				model: self.
	window
		addMorph: requestor
		frame: (0 @ 0 corner: 1 @ 1).
	requestor
		notify: error
		at: location
				+ (self notificationOffsetAt: location)
		in: stream.
	window openInWorld.
	PlatypusNativeCodeErrorException signal: 'error while evaluating ''' , stream contents , ''''
]

{ #category : 'private' }
PlatypusNativeCodeInterpretor >> preparse [
	| ori beginReplPos vname replString |
	preparsed := ReadWriteStream on: String new.
	preparsed nextPut: $[.
	ori := ReadStream on: source.
	[ori atEnd]
		whileFalse: [preparsed
				nextPutAll: (ori upTo: $").
			ori atEnd
				ifFalse: [ori peek == $$
						ifTrue: [beginReplPos := ori position.
							ori next.
							vname := ori upTo: $".
							replString := '(self valueOf: ''' , vname trimBoth , ''') '.
							preparsed nextPutAll: replString.
							replacementPositions
								add: (Array
										with: beginReplPos
										with: vname size
										with: replString size)]
						ifFalse: [preparsed nextPut: $"]]].
	preparsed nextPutAll: '] value'.
	preparsed reset.
	^ preparsed contents
]

{ #category : 'accessing' }
PlatypusNativeCodeInterpretor >> replacementPositions: aCollection [ 
	replacementPositions := aCollection
]

{ #category : 'accessing' }
PlatypusNativeCodeInterpretor >> requestor: aRequestor [ 
	requestor := TamTextMorph
				on: self
				text: nil
				accept: nil
				readSelection: nil
				menu: nil.
	requestor setText: source.
	requestor changed: #contents
]

{ #category : 'requestor error notification' }
PlatypusNativeCodeInterpretor >> select [
	^ requestor select
]

{ #category : 'requestor error notification' }
PlatypusNativeCodeInterpretor >> selectFrom: begin to: end [ 
	^ requestor selectFrom: begin  to: end 
]

{ #category : 'requestor error notification' }
PlatypusNativeCodeInterpretor >> selectInvisiblyFrom: begin to: end [ 
	^ requestor selectInvisiblyFrom: begin to: end 
]

{ #category : 'requestor error notification' }
PlatypusNativeCodeInterpretor >> selectionInterval [
	^ requestor selectionInterval
]

{ #category : 'accessing' }
PlatypusNativeCodeInterpretor >> tempNames [
	^ #()
]

{ #category : 'requestor error notification' }
PlatypusNativeCodeInterpretor >> text [
	^ requestor text
]
