Extension { #name : #PltUsedSchema }

{ #category : #'*xtra-platypus-accessing' }
PltUsedSchema >> selectionString [
	^ 'USE ' , super selectionString
]
