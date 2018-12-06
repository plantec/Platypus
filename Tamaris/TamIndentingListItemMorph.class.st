Class {
	#name : #TamIndentingListItemMorph,
	#superclass : #IndentingListItemMorph,
	#category : #'Tamaris-UI'
}

{ #category : #preferences }
TamIndentingListItemMorph class >> showItemsIcon [
	^ true
]

{ #category : #preferences }
TamIndentingListItemMorph class >> useStandardToggleIcons [
	^ false
]

{ #category : #deleting }
TamIndentingListItemMorph >> delete [
	super delete.
	self destroy
]

{ #category : #deleting }
TamIndentingListItemMorph >> destroy [
	super destroy.
	complexContents := nil
]

{ #category : #initialization }
TamIndentingListItemMorph >> fontToUse [
	(container emphasisOf: complexContents withoutListWrapper)
		ifNotNil: [:emph | emphasis ~= emph emphasis emphasisCode
			ifTrue: [
				emphasis := emph emphasis emphasisCode.
				self extent: self minWidth @ self minHeight]].
	^ super fontToUse
]

{ #category : #deleting }
TamIndentingListItemMorph >> hasToggle [
	^ complexContents notNil and: [super hasToggle]
]

{ #category : #accessing }
TamIndentingListItemMorph >> icon [
	^ self class showItemsIcon 
		ifTrue: 
			[complexContents ifNotNil: 
					[complexContents withoutListWrapper 
						ifNotNil: [complexContents withoutListWrapper icon]]]
]

{ #category : #initialization }
TamIndentingListItemMorph >> initWithContents: anObject prior: priorMorph forList: hostList indentLevel: newLevel [ 
	| emph |
	container := hostList.
	complexContents := anObject.
	indentLevel := 0.
	
	emph := hostList emphasisOf: anObject withoutListWrapper.
	emphasis := emph emphasis.
	color := emph textColor.
	self 
		initWithContents: anObject asString
		font: StandardFonts listFont
		emphasis: emphasis emphasisCode.
	isExpanded := false.
	nextSibling := firstChild := nil.
	priorMorph ifNotNil: [priorMorph nextSibling: self].
	indentLevel := newLevel.
	icon := anObject icon.
	self extent: self minWidth @ self minHeight
]

{ #category : #accessing }
TamIndentingListItemMorph >> isFirstItem [
	^ owner  notNil
		and: [super isFirstItem]
]

{ #category : #initialization }
TamIndentingListItemMorph >> measureContents [
	"Round up in case fractional."
	
	^ super measureContents
]

{ #category : #drawing }
TamIndentingListItemMorph >> unhighlight [
	complexContents ifNotNil: [super unhighlight]
]
