Extension { #name : #PltNativeCode }

{ #category : #'*xtra-platypus-accessing' }
PltNativeCode >> cachedMethod [
	^ cachedMethod
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeCode >> cachedMethod: aMethod [ 
	cachedMethod := aMethod
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeCode class >> cppSignature [
	^ 'C++'
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeCode class >> cppStlSignature [
	^ 'C++/STL'
]

{ #category : #'*xtra-platypus-testing' }
PltNativeCode >> doesNotUnderstand: message [ 
	| v |
	message arguments isEmpty
		ifTrue: [(v := interpreter valueOf: message selector)
				ifNotNil: [^ v]]
		ifFalse: [message arguments size = 1
				ifTrue: [(interpreter
							dataNamed: (message selector copyFrom: 1 to: message selector size - 1)
							value: (PlatypusExpressInterpretorStackVar val: message arguments first interpretor: interpreter))
						ifTrue: [^ self]
						ifFalse: [^interpreter  perform: message selector withArguments: message arguments]]].
	^ interpreter  perform: message selector withArguments: message arguments
]

{ #category : #'*xtra-platypus-testing' }
PltNativeCode >> isPharoCode [
	^ self languageSignature notNil and: [self languageSignature asUppercase = self class pharoSignature]
]

{ #category : #'*xtra-platypus-testing' }
PltNativeCode >> isPlatypusInterpreterCode [
	^ self languageSignature isNil or: [self languageSignature isEmpty
		or: [self languageSignature asUppercase = self class platypusSignature]]
]

{ #category : #'*xtra-platypus-testing' }
PltNativeCode >> isVisualWorksCode [
	^ self languageSignature notNil
		and: [self languageSignature asUppercase = self class visualWorksSignature]
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeCode class >> pharoSignature [
	^ 'PHARO'
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeCode class >> platypusSignature [
	^ 'PLATYPUS'
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeCode class >> visualWorksSignature [
	^ 'VISUALWORKS'
]
