Class {
	#name : #TamListItemSoftLinkReference,
	#superclass : #TamListItemAbstractLinkReference,
	#instVars : [
		'linkedPath'
	],
	#category : #'Tamaris-Taxonomies'
}

{ #category : #accessing }
TamListItemSoftLinkReference class >> linkedFrom: aLinkReference [ 
	| rootTaxonShortName managerItem |
	rootTaxonShortName := aLinkReference linkedPath first.
	managerItem := TamManager taxonomies
				detect: [:cls | cls taxonomy shortName = rootTaxonShortName]
				ifNone: [^ nil].
	^ managerItem taxonomy findChildReferenceFromPath: aLinkReference linkedPath allButFirst forLink: aLinkReference
]

{ #category : #accessing }
TamListItemSoftLinkReference >> asStringOrText [
	^ self linkPrefix , self linkedPath last
]

{ #category : #accessing }
TamListItemSoftLinkReference >> balloonText [
	^self longName
]

{ #category : #accessing }
TamListItemSoftLinkReference >> linkPrefix [
	^ '-> '
]

{ #category : #accessing }
TamListItemSoftLinkReference >> linked [
	| |
	^ self class linkedFrom: self
]

{ #category : #accessing }
TamListItemSoftLinkReference >> linked: anItem [ 
	linkedPath := anItem fullPathStrings.
	
]

{ #category : #accessing }
TamListItemSoftLinkReference >> linkedPath [
	^ linkedPath
]

{ #category : #accessing }
TamListItemSoftLinkReference >> longNameOn: aStream [
	| |
	aStream nextPutAll: self linkedPath first.
	aStream nextPutAll: self longNameFirstSep.
	self linkedPath allButFirst
		do: [:p | aStream nextPutAll: p]
		separatedBy: [aStream nextPutAll: self longNameSep].

]

{ #category : #'tam taxonomy browser' }
TamListItemSoftLinkReference >> selectingFrom: aTaxonomyBrowser [ 
	| lnk |
	^ (lnk := self linked)
		ifNotNil: [lnk selectingFrom: aTaxonomyBrowser]

]

{ #category : #accessing }
TamListItemSoftLinkReference >> shortName [
	^ self linkedPath last
]
