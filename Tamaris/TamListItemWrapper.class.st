Class {
	#name : #TamListItemWrapper,
	#superclass : #ListItemWrapper,
	#category : #'Tamaris-Taxonomies'
}

{ #category : #accessing }
TamListItemWrapper class >> interPathString [	^ '->'
]

{ #category : #'drag and drop' }
TamListItemWrapper >> acceptDroppingMorph: transferMorph copy: shouldCopy [	^ item acceptDroppingMorph: transferMorph copy: shouldCopy
]

{ #category : #accessing }
TamListItemWrapper >> balloonText [	^ item balloonText
]

{ #category : #accessing }
TamListItemWrapper >> children [	
	^ item notNil ifTrue: [item children] ifFalse: [#()]
]

{ #category : #accessing }
TamListItemWrapper >> contents [
	^item isReleased 
		ifTrue: 
			[#()]
		ifFalse: 
			[self children collect: [:each | each wrapperClass with: each model: nil]]
]

{ #category : #'initialize/release' }
TamListItemWrapper >> destroy [
	item := nil.
	model := nil.
	super destroy
]

{ #category : #testing }
TamListItemWrapper >> forceOkToChange [
	^ item isNil or: [item forceOkToChange]
]

{ #category : #accessing }
TamListItemWrapper >> fullPathAsString [	^ item fullPathAsString
]

{ #category : #accessing }
TamListItemWrapper >> fullPathStrings [	^ item fullPathStrings.
]

{ #category : #menu }
TamListItemWrapper >> genericMenu: aMenu selector: aSelector conditionBlock: aBlock fromTaxonomyBrowser: aBrowser recursive: aBoolean [ 
	^ self genericMenu: aMenu target: aBrowser selector: aSelector conditionBlock: aBlock fromTaxonomyBrowser: aBrowser recursive: aBoolean 

]

{ #category : #menu }
TamListItemWrapper >> genericMenu: aMenu target: aTarget selector: aSelector conditionBlock: aBlock fromTaxonomyBrowser: aBrowser recursive: aBoolean [ 
	| subM |
	aBoolean 
		ifTrue: 
			[subM := MenuMorph new.
			self contents do: 
					[:i | 
					i 
						genericMenu: subM
						target: aTarget
						selector: aSelector
						conditionBlock: aBlock
						fromTaxonomyBrowser: aBrowser
						recursive: false].
			subM submorphCount > 0 
				ifTrue: 
					[(aBlock value: item) 
						ifTrue: 
							[aMenu 
								add: self item shortName
								subMenu: subM
								target: aTarget
								selector: aSelector
								argumentList: { self }]
						ifFalse: [aMenu add: self item shortName subMenu: subM]]
				ifFalse: 
					[(aBlock value: item) 
						ifTrue: 
							[aMenu 
								add: self item shortName
								target: aTarget
								selector: aSelector
								argumentList: { self }]]].
	^aMenu
]

{ #category : #testing }
TamListItemWrapper >> hasContents [
	^ item hasContents
]

{ #category : #accessing }
TamListItemWrapper >> icon [	^ item icon
]

{ #category : #accessing }
TamListItemWrapper >> interPathString [	^ self class interPathString
]

{ #category : #testing }
TamListItemWrapper >> isReleased [
	^ item isNil
]

{ #category : #testing }
TamListItemWrapper >> isTaxon [	^ item isTaxon
]

{ #category : #accessing }
TamListItemWrapper >> item [
	^ item
]

{ #category : #accessing }
TamListItemWrapper >> maxSubLevelDescent [
	^ 6
]

{ #category : #menu }
TamListItemWrapper >> menu: aMenu shifted: b [ 	^ item		menu: aMenu		shifted: b
]

{ #category : #accessing }
TamListItemWrapper >> parentsChain [
	^ item parentsChain
]

{ #category : #accessing }
TamListItemWrapper >> preferredColor [
	item ifNotNil: [:i | ^ i preferredColor ].
	^ super preferredColor 
]

{ #category : #searching }
TamListItemWrapper >> selectDeeplySuchThat: aBlock [ 	^ self selectDeeplySuchThat: aBlock level: 0
]

{ #category : #searching }
TamListItemWrapper >> selectDeeplySuchThat: aBlock level: anInteger [ 	| res |	res  :=  OrderedCollection new.	anInteger < self maxSubLevelDescent		ifTrue: [			(aBlock value: self)				ifTrue: [res add: self].			self contents				do: [:sr | res  :=  res								, (sr selectDeeplySuchThat: aBlock level: anInteger + 1)]].	^ res
]

{ #category : #searching }
TamListItemWrapper >> selectItemsDeeplySuchThat: aBlock level: anInteger [ 
	| res |
	res  :=  OrderedCollection new.
	anInteger < self maxSubLevelDescent
		ifTrue: [(aBlock value: item)
				ifTrue: [res add: item].
			self contents
				do: [:sr | res  :=  res
								, (sr selectDeeplySuchThat: aBlock level: anInteger + 1)]].
	^ res
]

{ #category : #updating }
TamListItemWrapper >> selectingFrom: aHierarchicalList [ 
	^ item selectingFrom: aHierarchicalList
]

{ #category : #updating }
TamListItemWrapper >> unSelectingFrom: aHierarchicalList [
	^ item unSelectingFrom: aHierarchicalList
]
