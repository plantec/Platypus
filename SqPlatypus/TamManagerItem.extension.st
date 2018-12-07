Extension { #name : #TamManagerItem }

{ #category : #'*sqplatypus-hw-creation' }
TamManagerItem class >> platypusMetaDefaultTaxon [
	^ self defaultTaxonNamed: self platypusMetaDefaultTaxonName taxonClass: TamTaxonReference
]

{ #category : #'*SqPlatypus' }
TamManagerItem class >> platypusMetaDefaultTaxonName [
	^ 'platypus-meta' 
]
