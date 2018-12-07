Class {
	#name : #PlatypusSourceLine,
	#superclass : #Object,
	#instVars : [
		'tokens',
		'width',
		'font',
		'maxWidth',
		'startLevel'
	],
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #accessing }
PlatypusSourceLine class >> cutableTokens [
	^ Array with: (#( ';' ':=' '|' 'and' 'andor' 'or' 'xor' 'oneof' ',' '||') collect: [:e | e asSymbol]) with: (#('in' 'like' '<>' '=' '>=' '<=' '>' '<' ':=:' ':<>:' '+' '-' '*' '/' 'div' 'mod' ) collect: [:e | e asSymbol]) 
]

{ #category : #'instance creation' }
PlatypusSourceLine class >> font: aFont maxWidth: aSize [
^ self font: aFont maxWidth: aSize level: 0 

]

{ #category : #'instance creation' }
PlatypusSourceLine class >> font: aFont maxWidth: aSize level: anInteger [
	| line |
	line := self new.
	line font: aFont.
	line maxWidth: aSize.
	line reachLevel: anInteger.
	^ line
]

{ #category : #'instance creation' }
PlatypusSourceLine class >> new [
	^super new initialize
]

{ #category : #adding }
PlatypusSourceLine >> add: aToken [ 
	tokens add: aToken copy.
	width := width
				+ (aToken widthOfStringForFont: font)
]

{ #category : #adding }
PlatypusSourceLine >> add: aToken level: anInteger [ 
	| added |
	added := aToken copy.
	tokens isEmpty
		ifTrue: [self reachLevel: anInteger].
	tokens add: added.
	width := width
				+ (aToken widthOfStringForFont: font)
]

{ #category : #adding }
PlatypusSourceLine >> addAll: aCollection [
	aCollection do: [:e | self add: e] 

]

{ #category : #copying }
PlatypusSourceLine >> copyEmpty [
	^self class font: font maxWidth: maxWidth
]

{ #category : #formatting }
PlatypusSourceLine >> cutFor: cutArray level: level [ 
	| lines currLine nextLevel currLevel expressLine |
	nextLevel := currLevel := startLevel.
	lines := OrderedCollection new.
	currLine := OrderedCollection new.

	tokens
		do: [:token | 
			(token isOpenKeyword
					or: [token isOpenDelim])
				ifTrue: [nextLevel := nextLevel + 1]
				ifFalse: [(token isCloseKeyword
							or: [token isCloseDelim])
						ifTrue: [nextLevel := nextLevel - 1]].
			token isIndent
				ifFalse: [currLine add: token].
			(cutArray
					identityIndexOf: token lexicalElement
					ifAbsent: []) notNil
				ifTrue: [currLevel <= level
						ifTrue: [expressLine := self copyEmpty.
							expressLine reachLevel: currLevel.
							expressLine addAll: currLine.
							lines add: expressLine.
							currLine := currLine copyEmpty.
							currLevel := nextLevel]]].
	currLine isEmpty
		ifFalse: [expressLine := self copyEmpty.
			expressLine reachLevel: currLevel.
			expressLine addAll: currLine.
			lines add: expressLine].
	^ lines
]

{ #category : #accessing }
PlatypusSourceLine >> cutableTokens [
	^self class cutableTokens
]

{ #category : #printing }
PlatypusSourceLine >> dump: line on: aTokenList [ 
	line
		do: [:token | aTokenList add: token].
	aTokenList add: PlatypusEolToken new
]

{ #category : #printing }
PlatypusSourceLine >> dumpOn: aTokenList [ 
	self dumpOn: aTokenList cutables: self cutableTokens
]

{ #category : #printing }
PlatypusSourceLine >> dumpOn: aTokenList cutables: anArray [ 
	(maxWidth isNil
			or: [width < maxWidth
					or: [anArray size == 0]])
		ifTrue: [self dump: tokens on: aTokenList]
		ifFalse: [anArray notEmpty
				ifTrue: [(self formatLine: anArray first)
						do: [:l | l dumpOn: aTokenList cutables: anArray allButFirst]]]
]

{ #category : #accessing }
PlatypusSourceLine >> font [
	^font
]

{ #category : #accessing }
PlatypusSourceLine >> font: anObject [
	font := anObject
]

{ #category : #formatting }
PlatypusSourceLine >> formatLine: cutablesArray [ 
	| maxlevel lines nextLines |
	lines := OrderedCollection with: self.
	maxlevel := self maxLevel.
	0
		to: maxlevel
		do: [:lvl | 
			nextLines := OrderedCollection new.
			lines
				do: [:ln | nextLines
						addAll: (ln cutFor: cutablesArray level: lvl)].
			lines := nextLines].
	^ lines
]

{ #category : #initializing }
PlatypusSourceLine >> initialize [
	super initialize.
	self reset
]

{ #category : #testing }
PlatypusSourceLine >> isEmpty [
	^tokens isEmpty
]

{ #category : #formatting }
PlatypusSourceLine >> levelIndent [
	^ (1 to: startLevel)
		collect: [:i | PlatypusIndentToken new]
]

{ #category : #formatting }
PlatypusSourceLine >> levelIndentString [
	| indent |
	indent := String new writeStream.
	self levelIndent
		do: [:i |  indent nextPutAll: i lexicalElement asString].
	^ indent contents
]

{ #category : #accessing }
PlatypusSourceLine >> maxLevel [
	^ startLevel + (tokens
		count: [:t | t isOpenKeyword
				or: [t isOpenDelim]])
]

{ #category : #accessing }
PlatypusSourceLine >> maxWidth: anObject [
	maxWidth := anObject
]

{ #category : #initializing }
PlatypusSourceLine >> reachLevel: level [ 
	startLevel := level.
		(self levelIndent)
		do: [:i | self add: i].

]

{ #category : #reset }
PlatypusSourceLine >> reset [
	tokens := OrderedCollection new.
	width := 0.
	startLevel := 0.
]

{ #category : #accessing }
PlatypusSourceLine >> tokens [
	^tokens
]
