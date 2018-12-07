Extension { #name : #PltNativeExpression }

{ #category : #'*xtra-platypus-testing' }
PltNativeExpression >> alwaysReturn [
	^ self havePlatypusInterpreterCode
]

{ #category : #'*xtra-platypus-testing' }
PltNativeExpression >> havePlatypusInterpreterCode [
	^ self platypusInterpreterCode notNil
]

{ #category : #'*xtra-platypus-testing' }
PltNativeExpression >> isDebugged [
	^ false
]
