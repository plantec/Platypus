Extension { #name : #PltConstantDefinition }

{ #category : #'*xtra-platypus-accessing' }
PltConstantDefinition >> defaultValue [
	^ self domain defaultValue
]

{ #category : #'*xtra-platypus-accessing' }
PltConstantDefinition >> errorQualifier [
	^ super errorQualifier , ' ''' , self name , ''''
]

{ #category : #'*xtra-platypus-type-infering' }
PltConstantDefinition >> staticDomain [
	^ self domain computedDomain

]

{ #category : #'*xtra-platypus-code-generating' }
PltConstantDefinition >> variableHolders [
	^ OrderedCollection with: self
]
