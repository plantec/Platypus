Extension { #name : #String }

{ #category : #'*xtra-platypus-tamaris' }
String >> asIdentifier: shouldBeCapitalized [
	"Return a legal identifier, with first character in upper case if shouldBeCapitalized is true, else lower case.  This will always return a legal identifier, even for an empty string"
	"
	'234Fred987' asIdentifier: false
	'235Fred987' asIdentifier: true
	'' asIdentifier: true
	'()87234' asIdentifier: false
	'())z>=PPve889  U >' asIdentifier: false

	"
	| aString firstChar firstLetterPosition |
	aString := self select: [:el | el isAlphaNumeric].
	firstLetterPosition := aString findFirst: [:ch | ch isLetter].
	aString := firstLetterPosition = 0
		ifFalse:
			[aString copyFrom: firstLetterPosition to: aString size]
		ifTrue:
			['a', aString].
	firstChar := shouldBeCapitalized ifTrue: [aString first asUppercase] ifFalse: [aString first asLowercase].

	^ firstChar asString, (aString copyFrom: 2 to: aString size)

]

{ #category : #'*xtra-platypus-express-compat' }
String >> pltAt: anIndex [ 
	^ self copyFrom:  anIndex to: anIndex
]

{ #category : #'*xtra-platypus-express-compat' }
String >> pltPlus: anotherString [ 
	^ self , anotherString
]

{ #category : #'*xtra-platypus-evaluating' }
String >> unformattedString [
	| resStream nbAntiSlash curr |
	resStream := WriteStream on: String new.
	nbAntiSlash := 0.
	1
		to: self size
		do: [:pos | (curr := self at: pos) = $\
				ifTrue: [nbAntiSlash := nbAntiSlash + 1.
					nbAntiSlash = 2
						ifTrue: [resStream nextPut: $\.
							nbAntiSlash := 0]]
				ifFalse: [(#($n $t ) includes: curr)
						ifTrue: [nbAntiSlash = 1
								ifTrue: [
									resStream nextPut: (curr = $n 
										ifTrue: [
											MultiByteFileStream lineEndDefault asLowercase = 'lf' 
												ifTrue: [Character lf] 
												ifFalse: [Character cr]] 
										ifFalse: [Character tab]).
									nbAntiSlash := 0]
								ifFalse: [resStream nextPut: curr]]
						ifFalse: [resStream nextPut: curr]]].
	^ resStream contents
]
