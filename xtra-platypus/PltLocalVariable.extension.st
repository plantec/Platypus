Extension { #name : #PltLocalVariable }

{ #category : #'*xtra-platypus-evaluating' }
PltLocalVariable >> defaultValue [
	^ self domain defaultValue
]

{ #category : #'*xtra-platypus-accessing' }
PltLocalVariable >> errorQualifier [
	^ super errorQualifier , ' ''' , self name, ''''
]

{ #category : #'*xtra-platypus-type-infering' }
PltLocalVariable >> staticDomain [
	^ self domain computedDomain

]
