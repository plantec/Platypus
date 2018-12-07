Extension { #name : #PltEntityInstancesSet }

{ #category : #'*xtra-platypus-type-infering' }
PltEntityInstancesSet >> elementType [
	^ self entityRef computedDomain.

]

{ #category : #'*xtra-platypus-type-infering' }
PltEntityInstancesSet >> inferedDomain [
	| aSet |
	aSet := PltSetType new.
	aSet elementType: self elementType.
	^ aSet

]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstancesSet >> name [
	^ self entityRef name
]
