Extension { #name : #String }

{ #category : #'*platypus-utilities' }
String >> capitalizeFirst: firstCapitalized [ 
	| instr outstr resString curr |
	instr := ReadStream on: self.
	outstr := WriteStream on: String new.
	[instr atEnd] whileFalse: 
			[(curr := instr next) == $_ 
				ifTrue: [(curr := instr next) ifNotNil: [outstr nextPut: curr asUppercase]]
				ifFalse: [outstr nextPut: curr asLowercase]].
	resString := outstr contents.
	firstCapitalized 
		ifTrue: [resString at: 1 put: resString first asUppercase]
		ifFalse: [resString at: 1 put: resString first asLowercase].
	^ resString
]

{ #category : #'*Platypus' }
String >> findAnySubStr: delimiters startingAt: start [ 
	"Answer the index of the character within the receiver, starting at start, that begins a substring matching one of the delimiters.  delimiters is an Array of Strings (Characters are permitted also).  If the receiver does not contain any of the delimiters, answer size + 1."

	^delimiters inject: 1 + self size into: [:min :delim |
		"delim may be a char, a string of length 1, or a substring"
		| ind |
		ind := delim isCharacter 
			ifTrue: [self indexOf: delim
						startingAt: start ifAbsent: [min]]
			ifFalse: [self indexOfSubCollection: delim 
						startingAt: start ifAbsent: [min]].
		min min: ind]
]

{ #category : #'*Platypus' }
String >> findBetweenSubStrs: delimiters [
	"Answer the collection of String tokens that result from parsing self.  Tokens are separated by 'delimiters', which can be a collection of Strings, or a collection of Characters.  Several delimiters in a row are considered as just one separation."

	| tokens keyStart keyStop |
	tokens := OrderedCollection new.
	keyStop := 1.
	[keyStop <= self size] whileTrue:
		[keyStart := self skipAnySubStr: delimiters startingAt: keyStop.
		keyStop := self findAnySubStr: delimiters startingAt: keyStart.
		keyStart < keyStop
			ifTrue: [tokens add: (self copyFrom: keyStart to: (keyStop - 1))]].
	^tokens
]

{ #category : #'*Platypus' }
String >> padded: leftOrRight to: length with: char [
	leftOrRight = #left ifTrue:
		[^ (String new: (length - self size max: 0) withAll: char) , self].
	leftOrRight = #right ifTrue:
		[^ self , (String new: (length - self size max: 0) withAll: char)].
]

{ #category : #'*Platypus' }
String >> skipAnySubStr: delimiters startingAt: start [ 
	"Answer the index of the last character within the receiver, starting at start, that does NOT match one of the delimiters. delimiters is a Array of substrings (Characters also allowed).  If the receiver is all delimiters, answer size + 1."

	| any this ind ii |
	ii := start-1.
	[(ii := ii + 1) <= self size] whileTrue: [ "look for char that does not match"
		any := false.
		delimiters do: [:delim |
			delim isCharacter 
				ifTrue: [(self at: ii) == delim ifTrue: [any := true]]
				ifFalse: ["a substring"
					delim size > (self size - ii + 1) ifFalse: "Here's where the one-off error was."
						[ind := 0.
						this := true.
						delim do: [:dd | 
							dd == (self at: ii+ind) ifFalse: [this := false].
							ind := ind + 1].
						this ifTrue: [ii := ii + delim size - 1.  any := true]]
							ifTrue: [any := false] "if the delim is too big, it can't match"]].
		any ifFalse: [^ ii]].
	^ self size + 1
]

{ #category : #'*platypus-accessing' }
String >> updateDictionaryInstanceName: aDictionaryInstance [ 
	aDictionaryInstance name: self 

]

{ #category : #'*platypus-utilities' }
String >> withoutCr [
	^ self species streamContents: [:strm |
		self do: [:c | 
			(c = Character cr or: [c = Character lf])
				ifTrue: [strm nextPut: Character space]
				ifFalse: [strm nextPut: c]]]
]
