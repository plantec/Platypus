Extension { #name : #String }

{ #category : #'*Platypus-utilities' }
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

{ #category : #'*Platypus-accessing' }
String >> updateDictionaryInstanceName: aDictionaryInstance [ 
	aDictionaryInstance name: self 

]

{ #category : #'*Platypus-utilities' }
String >> withoutCr [
	^ self species streamContents: [:strm |
		self do: [:c | 
			(c = Character cr or: [c = Character lf])
				ifTrue: [strm nextPut: Character space]
				ifFalse: [strm nextPut: c]]]
]
