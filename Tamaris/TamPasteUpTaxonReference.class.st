Class {
	#name : #TamPasteUpTaxonReference,
	#superclass : #TamTaxonReference,
	#instVars : [
		'pasteUp'
	],
	#category : #'Tamaris-Taxonomies'
}

{ #category : #accessing }
TamPasteUpTaxonReference class >> canBeCreatedInteractively [
	^ true
]

{ #category : #accessing }
TamPasteUpTaxonReference class >> externalLabel [
	^ 'a paste up taxon'
]

{ #category : #accessing }
TamPasteUpTaxonReference >> newEditor [
	^ self pasteUp embeddedInMorphicWindowLabeled: ''
]

{ #category : #accessing }
TamPasteUpTaxonReference >> pasteUp [
	^ pasteUp ifNil: [pasteUp := PasteUpMorph new]
]

{ #category : #updating }
TamPasteUpTaxonReference >> reinitializeEditor [
]
