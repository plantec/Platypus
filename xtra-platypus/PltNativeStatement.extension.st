Extension { #name : #PltNativeStatement }

{ #category : #'*xtra-platypus-testing' }
PltNativeStatement >> alwaysReturn [
	^ self source havePlatypusInterpreterCode
]

{ #category : #'*xtra-platypus-testing' }
PltNativeStatement >> isDebugged [
	^ false
]
