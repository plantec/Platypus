Class {
	#name : #PlatypusExpressBuiltinFormatSymbolicFormatter,
	#superclass : #PlatypusExpressBuiltinFormatFormatter,
	#instVars : [
		'sign',
		'precZero',
		'width',
		'decimals',
		'type'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #accessing }
PlatypusExpressBuiltinFormatSymbolicFormatter >> decimals [
	^decimals
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatSymbolicFormatter >> decimals: anObject [
	decimals := anObject
]

{ #category : #formatting }
PlatypusExpressBuiltinFormatSymbolicFormatter >> finalStringFrom: aStringEncodingANumber forNumber: aNumber [ 
	| result |
	result := aStringEncodingANumber.
	precZero = $0
		ifTrue: [result := result padLeftTo: width - 1 with: precZero].
	sign = $+
		ifTrue: [aNumber < 0
				ifFalse: [aNumber > 0
						ifTrue: [result := '+' , result]
						ifFalse: [result := ' ' , result]]]
		ifFalse: [aNumber < 0
				ifFalse: [result := '' , result]].
	precZero ~= $0
		ifTrue: [result := result padLeftTo: width with: precZero].
	^ result
]

{ #category : #formatting }
PlatypusExpressBuiltinFormatSymbolicFormatter >> format: aNumber [ 
	| resultStr dec intPart decPartStr intPartStr fracPartStr fracMax fracPartStrBuf fracPartStrStream startCopy |
	aNumber isInteger
		ifTrue: [type = $I
				ifTrue: [^ self stringFromInteger: aNumber]]
		ifFalse: [type = $I
				ifTrue: [^ self stringFromInteger: aNumber rounded]].
	type = $F
		ifTrue: [resultStr := aNumber printShowingDecimalPlaces: decimals.
			^ self finalStringFrom: resultStr forNumber: aNumber].
	decPartStr := decimals < 10
				ifTrue: ['0']
				ifFalse: [''].
	decPartStr := decPartStr , decimals asString.
	dec := decimals.
	intPart := aNumber asFloat integerPart.
	fracPartStrBuf := aNumber asFloat fractionPart asString.
	fracPartStr := ''.
	fracPartStrStream := WriteStream on: fracPartStr.
	startCopy := false.
	fracPartStrBuf
		do: [:d | startCopy
				ifTrue: [fracPartStrStream nextPut: d]
				ifFalse: [startCopy := d = $.]].
	fracPartStr := fracPartStrStream contents , '000000000000000000000000'.
	[dec > 0]
		whileTrue: [intPart := intPart / 10.0.
			dec := dec - 1].
	intPartStr := intPart asString.
	(intPartStr indexOf: $e) isZero
		ifFalse: [decimals := decimals - 1.
			^ self format: aNumber].
	sign = $+
		ifTrue: [aNumber < 0.0
				ifFalse: [aNumber > 0.0
						ifTrue: [intPartStr := '+' , intPartStr]]].
	(fracMax := width - (intPartStr size + decPartStr size + 2)) > 0
		ifTrue: [fracPartStr := fracPartStr copyFrom: 1 to: fracMax]
		ifFalse: [fracPartStr := ''].
	^ intPartStr , fracPartStr , 'E+' , decPartStr
]

{ #category : #initializing }
PlatypusExpressBuiltinFormatSymbolicFormatter >> initializeFromSourceFormat: aSourceString [ 
	| iwidth idecimals |
	type := aSourceString fourth.
	sign := aSourceString first.
	precZero := aSourceString second ifNil: [$ ] ifNotNil: [aSourceString second first = $0
				ifTrue: [$0]
				ifFalse: [$ ]].
	width := (iwidth := aSourceString second)
				ifNil: [type = $I
						ifTrue: [2]
						ifFalse: [type = $F
								ifTrue: [4]
								ifFalse: [7]]]
				ifNotNil: [iwidth asNumber].
	decimals := aSourceString third
				ifNil: [2]
				ifNotNil: [(idecimals := aSourceString third asNumber) < 1
						ifTrue: [1]
						ifFalse: [idecimals]]
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatSymbolicFormatter >> precZero [
	^precZero
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatSymbolicFormatter >> precZero: anObject [
	precZero := anObject
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatSymbolicFormatter >> sign [
	^sign
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatSymbolicFormatter >> sign: anObject [
	sign := anObject
]

{ #category : #formatting }
PlatypusExpressBuiltinFormatSymbolicFormatter >> stringFromInteger: aNumber [ 
	^ self finalStringFrom: aNumber asString forNumber: aNumber 

]

{ #category : #accessing }
PlatypusExpressBuiltinFormatSymbolicFormatter >> type [
	^type
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatSymbolicFormatter >> type: anObject [
	type := anObject
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatSymbolicFormatter >> width [
	^width
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatSymbolicFormatter >> width: anObject [
	width := anObject
]
