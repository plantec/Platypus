Class {
	#name : #PlatypusCodeStream,
	#superclass : #TextStream,
	#instVars : [
		'tokensStyleMap'
	],
	#category : #'SqPlatypus-HW-GenericTokens'
}

{ #category : #'data get/put' }
PlatypusCodeStream >> nextPutAll: aCollection endingAt: aPosition [
	"Optimized access to get around Text at:Put: overhead"
	| n |
	n := aCollection size min: aPosition.
	position + n > writeLimit
		ifTrue: [self growTo: position + n + 10].
	collection
		replaceFrom: position + 1
		to: position + n
		with: aCollection
		startingAt: 1.
	position := position + n
]

{ #category : #'color/style' }
PlatypusCodeStream >> tokensStyleMap [
	"Answer the map to use to determine colors and styles"
	| colorAndEmphasis |
	^ tokensStyleMap
		ifNil: [tokensStyleMap := Dictionary new.
			#(#(#PlatypusIdentifierToken #()) #(#PlatypusPrimaryElementIdentifierToken #(#(#blue) #(#bold))) #(#PlatypusExpressNativeAlgorithmToken #(#red #(#bold))) #(#PlatypusLiteralToken #()) #(#PlatypusNumberToken #()) #(#PlatypusRemarkToken #(#brown #())) #(#PlatypusBuiltinProcedureToken #()) #(#PlatypusKeywordToken #()) #(#PlatypusBuiltinFunctionToken #()) #(#PlatypusOpenDelimToken #()) #(#PlatypusSemicolonToken #()) #(#PlatypusAssignToken #()) #(#PlatypusEolToken #()) #(#PlatypusWhiteSpaceToken #()) #(#PlatypusOperatorToken #()) #(#PlatypusLogicalToken #()) #(#PlatypusOneWhiteSpaceToken #()) #(#PlatypusStringToken #(#(#black) #(#bold))) #(#PlatypusIndentToken #()) #(#PlatypusCloseKeywordToken #()) #(#PlatypusCloseDelimToken #()) #(#PlatypusTailRemarkToken #(#brown #())) #(#PlatypusGroupKeywordToken #()) #(#PlatypusBuiltinDomainToken #()) #(#PlatypusEmbeddedRemarkToken #(#brown #())) #(#PlatypusDelimToken #()) #(#PlatypusOpenKeywordToken #()) #(#PlatypusPrimaryElementOpenKeywordToken #(#(#blue #muchDarker ) #(#bold))) #(#PlatypusPrimaryElementCloseKeywordToken #(#(#blue  #muchDarker) #(#bold))) #(#PlatypusUnresolvedReferenceToken #(#(#red) #(#bold))) )
				do: [:couple | | cls | (cls := Smalltalk
								at: (couple at: 1)
								ifAbsent: [])
						ifNotNil: [(couple at: 2)
								ifNotEmpty: [:colorSymbolAndEmphasis | 
									colorAndEmphasis := WriteStream
												on: (Array new: 3).
									colorAndEmphasis
										nextPut: (TextColor
												color: (Color colorFrom: colorSymbolAndEmphasis first)).
									colorAndEmphasis
										nextPutAll: (colorSymbolAndEmphasis second
												collect: [:emph | TextEmphasis perform: emph]).
									tokensStyleMap at: cls put: colorAndEmphasis contents]]].
			tokensStyleMap]
]

{ #category : #'color/style' }
PlatypusCodeStream >> withColor: color emphasis: emphasisSymbol do: aBlock [ 
	"Evaluate the given block with the given color and style text 
	attribute"
	| attributes |
	attributes := WriteStream
				on: (Array new: 3).
	attributes
		nextPut: (TextColor
				color: color).
	emphasisSymbol
		do: [:e | attributes
				nextPut: (TextEmphasis perform: e)].
	^ self withAttributes: attributes contents do: aBlock
]

{ #category : #'color/style' }
PlatypusCodeStream >> withStyleFor: aClass do: aBlock [ 
	"Evaluate aBlock with appropriate emphasis and color for the 
	given element"
	| colorsAndStylesMap |
	(colorsAndStylesMap := self tokensStyleMap)
		ifNil: [^ aBlock value].
	^ self
		withStyleInfo: (colorsAndStylesMap
				at: aClass
				ifAbsent: [#()])
		do: aBlock
]

{ #category : #'color/style' }
PlatypusCodeStream >> withStyleInfo: colorAndStyle do: aBlock [ 
	"Evaluate aBlock with appropriate emphasis and color for the given
	element"
	^ colorAndStyle
		ifNotEmpty: [:cas | self withAttributes: cas do: aBlock]
		ifEmpty: [aBlock value].
]
