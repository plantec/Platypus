Class {
	#name : #TamRootTaxonReference,
	#superclass : #TamTaxonReference,
	#instVars : [
		'managerItem',
		'announcer'
	],
	#classInstVars : [
		'repositoryName'
	],
	#category : #'Tamaris-Taxonomies'
}

{ #category : #'filein/fileout' }
TamRootTaxonReference class >> tamarisFileNameSuffix [
	^ 'tam'

]

{ #category : #'filein/fileout' }
TamRootTaxonReference class >> tamarisRepositoryName [
	^ repositoryName
		ifNil: [repositoryName  :=  'Tamaris-DB']

]

{ #category : #'filein/fileout' }
TamRootTaxonReference class >> tamarisRepositoryName: aDirName [
	repositoryName := aDirName

]

{ #category : #accessing }
TamRootTaxonReference >> announcer [
	^ announcer ifNil: [announcer := Announcer new]
]

{ #category : #copying }
TamRootTaxonReference >> copy [
	| copy |
	copy := super copy.
	copy managerItem: nil.
	^ copy

]

{ #category : #accessing }
TamRootTaxonReference >> icon [
	^TamIcons mimeIcon: '10x10/mimetypes/root_taxon'
]

{ #category : #testing }
TamRootTaxonReference >> isRootTaxon [
	^ true

]

{ #category : #accessing }
TamRootTaxonReference >> longNameOn: aStream [ 
	aStream nextPutAll: self shortName.
	aStream nextPutAll: self longNameFirstSep
]

{ #category : #accessing }
TamRootTaxonReference >> managerItem [
	^managerItem
]

{ #category : #accessing }
TamRootTaxonReference >> managerItem: anObject [
	managerItem := anObject
]
