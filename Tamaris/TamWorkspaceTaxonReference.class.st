Class {
	#name : #TamWorkspaceTaxonReference,
	#superclass : #TamTaxonReference,
	#instVars : [
		'workspace'
	],
	#category : #'Tamaris-Taxonomies'
}

{ #category : #accessing }
TamWorkspaceTaxonReference class >> canBeCreatedInteractively [
	^ true
]

{ #category : #accessing }
TamWorkspaceTaxonReference class >> externalLabel [
	^ 'a workspace taxon'
]

{ #category : #accessing }
TamWorkspaceTaxonReference >> contents: textOrString [ 
self workspace contents: textOrString 
]

{ #category : #accessing }
TamWorkspaceTaxonReference >> newEditor [
	^ self workspace embeddedInMorphicWindowLabeled: ''
]

{ #category : #updating }
TamWorkspaceTaxonReference >> reinitializeEditor [
]

{ #category : #accessing }
TamWorkspaceTaxonReference >> workspace [
	^ workspace
		ifNil: [workspace := TamStringHolder new]
]
