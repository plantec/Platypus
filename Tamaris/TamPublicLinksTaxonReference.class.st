Class {
	#name : #TamPublicLinksTaxonReference,
	#superclass : #TamLinksTaxonReference,
	#category : #'Tamaris-Taxonomies'
}

{ #category : #menus }
TamPublicLinksTaxonReference class >> canBeCreatedInteractively [
	^ true
]

{ #category : #updating }
TamPublicLinksTaxonReference >> insertReference: aReference [ 
| result |
(result := super insertReference: aReference ) ifTrue: [TamManager changed: self].
	^ result
]
