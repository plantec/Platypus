Extension { #name : #PltVariableSizeAggregationInstance }

{ #category : #'*xtra-platypus-converting' }
PltVariableSizeAggregationInstance >> asListInstance [
	^ PltListInstance new contents: self contentsList
	
]
