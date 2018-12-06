Class {
	#name : #TamListItemMorphEmphasisModel,
	#superclass : #Object,
	#instVars : [
		'key',
		'font',
		'emphasis',
		'backgroundColor',
		'textColor'
	],
	#classVars : [
		'RedStandard',
		'Standard'
	],
	#category : #'Tamaris-Event-Rules'
}

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> blueStandard [
	^ self
		key: #blueStandardEmphasis
		textColor: Color blue darker
		font: StandardFonts listFont
		emphasis: TextEmphasis normal
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> boldBlueOnLightBlueStandard [
	^ self
		key: #boldBlueOnLightBlueStandardEmphasis
		textColor: Color blue
		backgroundColor: Color blue veryMuchLighter
		font: StandardFonts listFont
		emphasis: TextEmphasis bold
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> boldBlueStandard [
	^ self
		key: #boldBlueStantardEmphasis
		textColor: Color blue
		font: StandardFonts listFont
		emphasis: TextEmphasis bold
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> boldGreenOnLightGreenStandard [
	^ self
		key: #boldGreenOnLightGreenStandardEmphasis
		textColor: Color green
		backgroundColor: Color green veryMuchLighter
		font: StandardFonts listFont
		emphasis: TextEmphasis bold
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> boldGreenStandard [
	^ self
		key: #boldGreenStandardEmphasis
		textColor: Color green darker
		font: StandardFonts listFont
		emphasis: TextEmphasis bold
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> boldRedStandard [
	^ self
		key: #boldRedStantardEmphasis
		textColor: Color red
		font: StandardFonts listFont
		emphasis: TextEmphasis bold
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> boldStandard [
	^ self
		key: #boldStantardEmphasis
		textColor: Color black
		font: StandardFonts listFont
		emphasis: TextEmphasis bold
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> greenStandard [
	^ self
		key: #greenStandardEmphasis
		textColor: Color green muchDarker
		font: StandardFonts listFont
		emphasis: TextEmphasis normal
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> italicBlueStandard [
	^ self
		key: #italicBlueStandardEmphasis
		textColor: Color blue darker
		font: StandardFonts listFont
		emphasis: TextEmphasis italic
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> italicGreenStandard [
	^ self
		key: #italicGreenStandardEmphasis
		textColor: Color green darker
		font: StandardFonts listFont
		emphasis: TextEmphasis italic
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> italicRedStandard [
	^ self
		key: #italicRedStandardEmphasis
		textColor: Color red darker
		font: StandardFonts listFont
		emphasis: TextEmphasis italic
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> italicStandard [
	^ self
		key: #italicStantardEmphasis
		textColor: Color black
		font: StandardFonts listFont
		emphasis: TextEmphasis italic
]

{ #category : #'instance creation' }
TamListItemMorphEmphasisModel class >> key: aSymbol textColor: aColor backgroundColor: anotherColor font: aFont emphasis: anTextEmphasis [ 
	^ self new
		key: aSymbol
		textColor:  aColor
		backgroundColor: anotherColor
		font: aFont
		emphasis: anTextEmphasis
]

{ #category : #'instance creation' }
TamListItemMorphEmphasisModel class >> key: aSymbol textColor: aColor font: aFont emphasis: anTextEmphasis [ 
	^ self new
		key: aSymbol
		textColor: aColor
		font: aFont
		emphasis: anTextEmphasis
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> redStandard [
	^ RedStandard 
		ifNil: [
			RedStandard :=
		 		self
					key: #redStandardEmphasis
					textColor: Color red darker
					font: StandardFonts listFont
					emphasis: TextEmphasis normal]
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> standard [
	^ Standard
		ifNil: [Standard := self
						key: #stantardEmphasis
						textColor: Color black
						font: StandardFonts listFont
						emphasis: TextEmphasis normal]
]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> standardEmphasisSet [
	^ {#standard. #boldStandard. #boldBlueStandard. #boldBlueOnLightBlueStandard. #boldRedStandard. #italicStandard. #underlinedStandard} asSet

]

{ #category : #accessing }
TamListItemMorphEmphasisModel class >> underlinedStandard [
	^ self
		key: #underlinedStantardEmphasis
		textColor: Color black
		font: StandardFonts listFont
		emphasis: TextEmphasis underlined
]

{ #category : #equality }
TamListItemMorphEmphasisModel >> = anObject [ 
	(anObject isKindOf: self class)
		ifFalse: [^ false].
	^ anObject key = key
		
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> backgroundColor [
	^backgroundColor ifNil: [backgroundColor := Color transparent]
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> backgroundColor: anObject [
	backgroundColor := anObject
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> emphasis [
	^emphasis
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> emphasis: anObject [
	emphasis := anObject
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> emphasisCode [
	 ^ self emphasis emphasisCode
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> font [
	^font
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> font: anObject [
	font := anObject
]

{ #category : #equality }
TamListItemMorphEmphasisModel >> hash [
	"Hash is re-implemented because #= is re-implemented"
	^ key hash
		
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> key [
	^key
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> key: anObject [
	key := anObject
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> key: aSymbol color: aColor backgroundColor: anotherColorOrNil font: aFont emphasis: anTextEmphasis [ 
	self key: aSymbol.
	self color: aColor.
	self font: aFont.
	self backgroundColor: anotherColorOrNil.
	self emphasis: anTextEmphasis
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> key: aSymbol textColor: aColor backgroundColor: anotherColorOrNil font: aFont emphasis: anTextEmphasis [ 
	self key: aSymbol.
	self textColor: aColor.
	self font: aFont.
	self backgroundColor: anotherColorOrNil.
	self emphasis: anTextEmphasis
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> key: aSymbol textColor: aColor font: aFont emphasis: anTextEmphasis [ 
	self
		key: aSymbol
		textColor: aColor
		backgroundColor: nil
		font: aFont
		emphasis: anTextEmphasis
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> textColor [
	^textColor
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> textColor: anObject [
	textColor := anObject
]

{ #category : #accessing }
TamListItemMorphEmphasisModel >> xor: anotherListItemEmphasis [ 
	^ self class
		key: (self key , 'And' , anotherListItemEmphasis key capitalized) asSymbol
		textColor: self textColor
		font: self font
		emphasis: (TextEmphasis new
				emphasisCode: (self emphasisCode bitXor: anotherListItemEmphasis emphasisCode))
]
