Extension { #name : #PltParameterDefinition }

{ #category : #'*xtra-platypus-accessing' }
PltParameterDefinition >> errorQualifier [
	^ super errorQualifier , ' ''' , self name, ''''
]

{ #category : #'*xtra-platypus-type-infering' }
PltParameterDefinition >> staticDomain [
	^ self domain computedDomain

]
