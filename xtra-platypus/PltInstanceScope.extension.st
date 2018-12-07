Extension { #name : #PltInstanceScope }

{ #category : #'*xtra-platypus-data-management' }
PltInstanceScope >> updatePersistentLabelIndex: index [ 
	^ self owned do: [ :o | o updatePersistentLabelIndex: index]
]
