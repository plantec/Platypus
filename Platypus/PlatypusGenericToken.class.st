Class {
	#name : #PlatypusGenericToken,
	#superclass : #PltDNode,
	#instVars : [
		'startPos'
	],
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #'instance creation' }
PlatypusGenericToken class >> token: anObject [ 

	^ self new lexicalElement: anObject 
]

{ #category : #visiting }
PlatypusGenericToken >> accept: aVisitor [
	^aVisitor acceptToken: self
]

{ #category : #converting }
PlatypusGenericToken >> asString [
	^ self lexicalElement isSymbol
		ifTrue: [self lexicalElement]
		ifFalse: [self lexicalElement asString]
]

{ #category : #testing }
PlatypusGenericToken >> is: aLexicalElement [ 
	(aLexicalElement isKindOf: Symbol)
		ifTrue: [^ self lexicalElement asString = aLexicalElement asString].
	^ (aLexicalElement
		detect: [:v | v == self lexicalElement]
		ifNone: []) notNil
]

{ #category : #classification }
PlatypusGenericToken >> isBlank [
	^ self isWhiteSpace
		or: [self isIndent or: [self isEol]]
]

{ #category : #classification }
PlatypusGenericToken >> isBuiltinFunction [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isBuiltinProcedure [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isCloseDelim [
^false
]

{ #category : #classification }
PlatypusGenericToken >> isCloseKeyword [
^false
]

{ #category : #classification }
PlatypusGenericToken >> isEmbeddedRemark [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isEol [
	^ false
]

{ #category : #testing }
PlatypusGenericToken >> isEquivalentTo: anotherToken [ 
	^ self = anotherToken
]

{ #category : #classification }
PlatypusGenericToken >> isGroupKeyword [
^false
]

{ #category : #classification }
PlatypusGenericToken >> isIdentifier [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isIndent [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isKeyword [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isLogical [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isNativeCode [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isNumber [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isOpenDelim [
	^ false

]

{ #category : #classification }
PlatypusGenericToken >> isOpenKeyword [
^false
]

{ #category : #classification }
PlatypusGenericToken >> isOperator [
	^false
]

{ #category : #classification }
PlatypusGenericToken >> isPrimaryElementCloseKeyword [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isPrimaryElementOpenKeyword [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isPrimaryElementOpenKeyword: anArrayOfSymbol [ 
	^ self isPrimaryElementOpenKeyword
		and: [anArrayOfSymbol
				anySatisfy: [:s | s = self lexicalElement]]
]

{ #category : #classification }
PlatypusGenericToken >> isRemark [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isSemicolon [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isStepLiteral [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isString [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isTailRemark [
	^ false
]

{ #category : #classification }
PlatypusGenericToken >> isWhiteSpace [
	^false
]

{ #category : #accessing }
PlatypusGenericToken >> lexicalElement [
	^ data
]

{ #category : #accessing }
PlatypusGenericToken >> lexicalElement: anObject [ 
	data := anObject
]

{ #category : #printing }
PlatypusGenericToken >> printOn: aStream [ 
	aStream nextPutAll: self class name.
			aStream nextPut: $(.
			aStream nextPutAll: self asString.
			aStream nextPut: $)
]

{ #category : #accessing }
PlatypusGenericToken >> startPos [
	^ startPos
]

{ #category : #accessing }
PlatypusGenericToken >> startPos: anInteger [
	 startPos := anInteger
]

{ #category : #accessing }
PlatypusGenericToken >> stopPos [
	^ startPos + self lexicalElement size
]

{ #category : #accessing }
PlatypusGenericToken >> stopPosWithStart: aPosition [
	startPos := aPosition.
	^ startPos + self asString size
]

{ #category : #accessing }
PlatypusGenericToken >> widthOfStringForFont: textFont [
	textFont notNil ifTrue: [
	^ textFont widthOfString: self asString].
	^self asString size
]
