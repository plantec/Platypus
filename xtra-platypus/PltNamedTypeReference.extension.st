Extension { #name : #PltNamedTypeReference }

{ #category : #'*xtra-platypus-accessing' }
PltNamedTypeReference >> errorQualifier [
	^ 'named type ''' , self name, ''''
]
