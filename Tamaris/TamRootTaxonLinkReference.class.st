Class {
	#name : 'TamRootTaxonLinkReference',
	#superclass : 'TamListItemHardLinkReference',
	#instVars : [
		'managerItem'
	],
	#category : 'Tamaris-Taxonomies',
	#package : 'Tamaris',
	#tag : 'Taxonomies'
}

{ #category : 'testing' }
TamRootTaxonLinkReference >> isRootTaxonLink [
	^true
]

{ #category : 'accessing' }
TamRootTaxonLinkReference >> managerItem [
	^managerItem
]

{ #category : 'accessing' }
TamRootTaxonLinkReference >> managerItem: anObject [
	managerItem := anObject
]
