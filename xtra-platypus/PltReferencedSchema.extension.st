Extension { #name : #PltReferencedSchema }

{ #category : #'*xtra-platypus-accessing' }
PltReferencedSchema >> selectionString [
	^ 'REFERENCE ' , super selectionString
]
