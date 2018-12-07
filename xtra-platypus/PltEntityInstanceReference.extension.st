Extension { #name : #PltEntityInstanceReference }

{ #category : #'*xtra-platypus-type-infering' }
PltEntityInstanceReference >> inferedDomain [
	^ self ref computedDomain
]

{ #category : #'*xtra-platypus-classification' }
PltEntityInstanceReference >> isPltValue [
	^ true
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstanceReference >> owningModel [
	^ ref owningModel
]

{ #category : #'*xtra-platypus-instance-creation' }
PltEntityInstanceReference class >> ref: aGenericInstance [ 
	^ self new updateRef: aGenericInstance
]

{ #category : #'*xtra-platypus-accessing' }
PltEntityInstanceReference >> updateRef: aEntityInstance [ 
	self setRef: aEntityInstance.
	self persistentLabel: aEntityInstance persistentLabel
]
