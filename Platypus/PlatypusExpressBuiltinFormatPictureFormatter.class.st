Class {
	#name : #PlatypusExpressBuiltinFormatPictureFormatter,
	#superclass : #PlatypusExpressBuiltinFormatFormatter,
	#instVars : [
		'negation',
		'sign',
		'groupingChar',
		'decimalChar',
		'width',
		'decimals'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #accessing }
PlatypusExpressBuiltinFormatPictureFormatter >> decimalChar [
	^decimalChar
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatPictureFormatter >> decimalChar: anObject [
	decimalChar := anObject
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatPictureFormatter >> decimals [
	^decimals
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatPictureFormatter >> decimals: anObject [
	decimals := anObject
]

{ #category : #formatting }
PlatypusExpressBuiltinFormatPictureFormatter >> format: aNumber [ 
	| symbolicFormatter source symbolicResult decIdx groupingPositions result dstPos |
	source := OrderedCollection new.
	source add: (sign).
	source add: (negation
				ifTrue: [((aNumber < 0
							and: [aNumber isFloat])
						ifTrue: [width + 2]
						ifFalse: [aNumber isFloat
								ifTrue: [width + 1]
								ifFalse: [width]]) asString]
				ifFalse: [(sign = $+
							or: [aNumber < 0])
						ifTrue: [(width + 2) asString]
						ifFalse: [width asString]]).
	source add: decimals.
	source add: (decimals
				ifNil: [$I]
				ifNotNil: [$F]).
	symbolicFormatter := PlatypusExpressBuiltinFormatSymbolicFormatter new.
	symbolicFormatter initializeFromSourceFormat: source.
	symbolicResult := symbolicFormatter format: aNumber.
	negation
		ifTrue: [aNumber < 0.0
				ifTrue: [symbolicResult := '('
								, (symbolicResult copyFrom: 2 to: symbolicResult size) , ')'.
					symbolicResult replaceAll: $- with: $ ]].
	(symbolicResult indexOf: $e)
			> 0
		ifTrue: [^ symbolicResult].
	(decimalChar notNil
			and: [decimalChar ~= $.])
		ifTrue: [symbolicResult replaceAll: $. with: decimalChar].
	groupingChar notNil
		ifTrue: [decIdx := symbolicResult indexOf: decimalChar.
			groupingPositions := OrderedCollection new.
			decIdx := decIdx - 3.
			[decIdx > 0
				and: [(symbolicResult at: decIdx) isDigit]]
				whileTrue: [groupingPositions addFirst: decIdx.
					decIdx := decIdx - 3].
			result := String new: symbolicResult size + groupingPositions size.
			dstPos := 1.
			1
				to: symbolicResult size
				do: [:srcPos | 
					(groupingPositions notEmpty
							and: [groupingPositions first = srcPos])
						ifTrue: [result at: dstPos put: groupingChar.
							dstPos := dstPos + 1.
							groupingPositions removeFirst].
					result
						at: dstPos
						put: (symbolicResult at: srcPos).
					dstPos := dstPos + 1].
			^ result].
	^ symbolicResult
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatPictureFormatter >> groupingChar [
	^groupingChar
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatPictureFormatter >> groupingChar: anObject [
	groupingChar := anObject
]

{ #category : #initializing }
PlatypusExpressBuiltinFormatPictureFormatter >> initializeFromSourceFormat: anArray [ 
	| picture |
	anArray first = $(
		ifTrue: [negation := true]
		ifFalse: [negation := false.
			anArray first = $+
				ifTrue: [sign := $+]
				ifFalse: [sign := $-]].
	picture := anArray second.
	picture size = 1
		ifTrue: [self width: picture first]
		ifFalse: [picture size = 3
				ifTrue: [self width: picture first + picture last.
					self decimals: picture last.
					self decimalChar: picture second]
				ifFalse: [self width: picture first + picture third + picture last.
					self
						decimalChar: (picture at: picture size - 1).
					self decimals: picture last.
					self groupingChar: picture second]]
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatPictureFormatter >> negation [
	^negation
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatPictureFormatter >> negation: anObject [
	negation := anObject
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatPictureFormatter >> sign [
	^sign
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatPictureFormatter >> sign: anObject [
	sign := anObject
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatPictureFormatter >> width [
	^width
]

{ #category : #accessing }
PlatypusExpressBuiltinFormatPictureFormatter >> width: anObject [
	width := anObject
]
