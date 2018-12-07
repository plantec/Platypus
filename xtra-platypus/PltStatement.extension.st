Extension { #name : #PltStatement }

{ #category : #'*xtra-platypus-testing' }
PltStatement >> alwaysReturn [
	^ false
]

{ #category : #'*xtra-platypus-accessing' }
PltStatement >> errorQualifier [
	^ super errorQualifier , ' ''' , self prettyPrintedExpressCode, ''''
]

{ #category : #'*xtra-platypus-classification' }
PltStatement >> isStatement [
	^ true

]
