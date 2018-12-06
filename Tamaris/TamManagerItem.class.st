Class {
	#name : #TamManagerItem,
	#superclass : #ListItemWrapper,
	#instVars : [
		'listId',
		'currentSelection',
		'currentlyExpanded',
		'listLabel'
	],
	#classVars : [
		'Default'
	],
	#category : #'Tamaris-UI'
}

{ #category : #'instance creation' }
TamManagerItem class >> default [
	^ Default
		ifNil: [Default := self rootNamed: self platypusMetaModelsItemName]

]

{ #category : #'instance creation' }
TamManagerItem class >> defaultTaxonNamed: aName taxonClass: aTaxonSubClass [
	| taxon |
	taxon := self default taxonomy children
				detect: [:it | it listLabel = aName]
				ifNone: [].
	taxon
		ifNil: [taxon := aTaxonSubClass taxonLabel: aName.
			self default taxonomy insertReference: taxon].
	^ taxon
]

{ #category : #'instance creation' }
TamManagerItem class >> fromFileListTaxonName [
	^ ' *** from file fist *** '
]

{ #category : #'instance creation' }
TamManagerItem class >> linkTo: anotherItem [ 
	| newTaxonomy rootLink |
	newTaxonomy := self new .
	rootLink := TamRootTaxonLinkReference from: anotherItem taxonomy linked.
	rootLink managerItem: newTaxonomy.
	newTaxonomy taxonomy: rootLink.
	newTaxonomy listId: ''.
	^newTaxonomy
]

{ #category : #'instance creation' }
TamManagerItem class >> platypusMetaModelsItemName [
	^ 'platypus-meta-models'
]

{ #category : #'instance creation' }
TamManagerItem class >> resetDefault [
	 Default := nil
		

]

{ #category : #'instance creation' }
TamManagerItem class >> rootNamed: anIdent [ 
	| newTaxonomy rootTaxon |
	newTaxonomy := self new.
	rootTaxon := TamRootTaxonReference taxonLabel: anIdent.
	rootTaxon managerItem: newTaxonomy.
	newTaxonomy taxonomy: rootTaxon.
	newTaxonomy listId: ''.
	^newTaxonomy
]

{ #category : #'drag and drop' }
TamManagerItem >> acceptDroppingMorph: transferMorph event: evt inMorph: dstListMorph [ 
	"Here we are fetching informations from the dropped transferMorph	and 
	performing the correct action for this drop."
	| shouldCopy |
	shouldCopy := (transferMorph respondsTo: #shouldCopy)
		ifTrue: [transferMorph shouldCopy]
		ifFalse: [true].
	^ self taxonomy acceptDroppingMorph: transferMorph copy: shouldCopy
]

{ #category : #converting }
TamManagerItem >> asStringOrText [
	^ String streamContents: [:strm |
		strm nextPutAll: self taxonomy listLabel.
		self listId ifNotEmpty: [ :id | 
			strm nextPutAll:  ' - '.
			strm nextPutAll: id]]
]

{ #category : #accessing }
TamManagerItem >> currentSelection [	
	^currentSelection
]

{ #category : #accessing }
TamManagerItem >> currentSelection: anObject [ 
	currentSelection := anObject
]

{ #category : #accessing }
TamManagerItem >> currentlyExpanded [	
	^currentlyExpanded
]

{ #category : #accessing }
TamManagerItem >> currentlyExpanded: anObject [
	currentlyExpanded := anObject
]

{ #category : #'initialize/release' }
TamManagerItem >> destroy [
	currentSelection := nil.
	currentlyExpanded := nil.
	item
		ifNotNil: [
			item destroy.
			item := nil].
	super destroy
]

{ #category : #menu }
TamManagerItem >> genericMenu: aMenu selector: aSelector fromTaxonomyManager: aManager [		aMenu				add: self asString				target: aManager				selector: aSelector				argumentList: {self}.		^ aMenu
]

{ #category : #'initialize/release' }
TamManagerItem >> initialize [
	super initialize.
	currentlyExpanded := #().

]

{ #category : #testing }
TamManagerItem >> isDefault [
	^ self == self class default

]

{ #category : #testing }
TamManagerItem >> isMoveable [
	^ false
]

{ #category : #testing }
TamManagerItem >> isReleased [
	^ item isNil
]

{ #category : #testing }
TamManagerItem >> isRootTaxonLink [
	^item isRootTaxonLink
]

{ #category : #menu }
TamManagerItem >> keyStroke: aCharacter from: tamuggableListMorph [ 		^ self taxonomy keyStroke: aCharacter from: tamuggableListMorph 
]

{ #category : #accessing }
TamManagerItem >> listId [
	^listId
]

{ #category : #accessing }
TamManagerItem >> listId: aString [ 
	listId := aString
]

{ #category : #accessing }
TamManagerItem >> listLabel [	
	^ listLabel
]

{ #category : #accessing }
TamManagerItem >> listLabel: aString [	
	listLabel := aString
]

{ #category : #menu }
TamManagerItem >> menu: menu shifted: aBoolean [ 
		^self taxonomy menu: menu shifted: aBoolean
]

{ #category : #'ui building' }
TamManagerItem >> selectingFrom: aTaxonomiesManager [ 
	| brw |
	(brw := aTaxonomiesManager taxonomyBrowser)
		rootWrapper: (self taxonomy wrapperClass with: self taxonomy model: nil).
	(self currentSelection notNil
			and: [self currentSelection isReleased])
		ifTrue: [self currentSelection: nil].
	brw noteNewSelection: self currentSelection currentlyExpanded: self currentlyExpanded.

]

{ #category : #accessing }
TamManagerItem >> taxonomy [	
	^ item
]

{ #category : #accessing }
TamManagerItem >> taxonomy: anObject [ 
	item := anObject
]

{ #category : #accessing }
TamManagerItem >> taxonomyWrapper [	
	^ item ifNotNil: [item wrapperClass with: item model: nil]
]

{ #category : #'ui building' }
TamManagerItem >> unSelectingFrom: aTaxonomiesManager [ 
	| brw |
	(brw := aTaxonomiesManager taxonomyBrowser) rootWrapper ifNotNil: 
			["brw restoreLayoutFramesFrom: self layoutFramesIndex."

			brw noteNewSelection: nil.
			brw rootWrapper destroy.
			brw rootWrapper: nil]
]

{ #category : #'system changes handling' }
TamManagerItem >> updateBrowsers: aBlockOrASelector [ 
	TamBrowser allSubInstances copy
		do: [:brw | brw isReleased
			ifFalse: [brw rootTaxon = item
				ifTrue: [
					aBlockOrASelector isSymbol 
						ifTrue: [brw perform: aBlockOrASelector] 
						ifFalse: [aBlockOrASelector value: brw]]]]
]
