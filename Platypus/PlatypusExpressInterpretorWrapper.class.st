Class {
	#name : #PlatypusExpressInterpretorWrapper,
	#superclass : #Object,
	#instVars : [
		'myInterpreter'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #'instance creation' }
PlatypusExpressInterpretorWrapper class >> interpreter: anExpressInterpreter [ 
	^ self new myInterpreter: anExpressInterpreter
]

{ #category : #'platypus interpreting' }
PlatypusExpressInterpretorWrapper >> EvaluatePlatypusInterpreterNativeCode [ [	| fref |
	fref := self filename val asFileReference.
	fref parent parent ensureCreateDirectory.
	fref parent ensureCreateDirectory.
	fref ensureDelete.
	fref ensureCreateFile.
	fref writeStreamDo: [:fileStream | 
		fileStream nextPutAll: self contents asClearText. 
		fileStream flush].
	] value
]

{ #category : #'error handling' }
PlatypusExpressInterpretorWrapper >> doesNotUnderstand: message [ 
	| v |
	message arguments isEmpty
		ifTrue: [(v := myInterpreter valueOf: message selector)
				ifNotNil: [^ v]]
		ifFalse: [message arguments size = 1
				ifTrue: [(myInterpreter
							dataNamed: (message selector copyFrom: 1 to: message selector size - 1)
							value: (PlatypusExpressInterpretorStackVar val: message arguments first interpretor: myInterpreter))
						ifTrue: [^ self]
						ifFalse: [^myInterpreter  perform: message selector withArguments: message arguments]]].
	^ myInterpreter  perform: message selector withArguments: message arguments
]

{ #category : #accessing }
PlatypusExpressInterpretorWrapper >> myContext [
	^ myInterpreter
]

{ #category : #accessing }
PlatypusExpressInterpretorWrapper >> myInterpreter: aPlatypusExpressInterpreter [ 
	myInterpreter := aPlatypusExpressInterpreter
]
