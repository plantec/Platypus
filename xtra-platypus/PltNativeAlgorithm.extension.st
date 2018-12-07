Extension { #name : #PltNativeAlgorithm }

{ #category : #'*xtra-platypus-testing' }
PltNativeAlgorithm >> alwaysReturn [
	^ self havePlatypusInterpreterCode
]

{ #category : #'*xtra-platypus-data-management' }
PltNativeAlgorithm >> buildNativeCodesFromString: aString [ 
	| code pos size withSignature curr s |
	code := PltNativeCode new.
	pos := 1.
	size := aString size.
	withSignature := nil.
	[pos < size
		and: [withSignature isNil]]
		whileTrue: [(Character separators includes: (curr := aString at: pos))
				ifFalse: [withSignature := curr = $<].
			pos := pos + 1].
	s := ReadStream on: aString.
	(withSignature notNil and: [withSignature])
		ifTrue: [s upTo: $<.
			code
				languageSignature: (s upTo: $>).
			code code: s upToEnd]
		ifFalse: [code code: s upToEnd].
	self implementations add: code
]

{ #category : #'*xtra-platypus-testing' }
PltNativeAlgorithm >> havePlatypusInterpreterCode [
	^ self platypusInterpreterCode notNil
]

{ #category : #'*xtra-platypus-testing' }
PltNativeAlgorithm >> isDebugged [
	^ false
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeAlgorithm >> pharoCode [
	^ self implementations
		detect: [:nc | nc isPharoCode]
		ifNone: []
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeAlgorithm >> platypusInterpreterCode [
	^ self implementations
		detect: [:nc | nc isPlatypusInterpreterCode]
		ifNone: []
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeAlgorithm >> visualWorksCode [
	^ self implementations
		detect: [:nc | nc isVisualWorksCode]
		ifNone: []
]
