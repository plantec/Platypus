Extension { #name : #PltFunctionDeclaration }

{ #category : #'*xtra-platypus-evaluating' }
PltFunctionDeclaration >> evaluateAndExplore [
	^ self evaluate explore
]

{ #category : #'*xtra-platypus-evaluating' }
PltFunctionDeclaration >> evaluateAndExplore: args [ 
	^ (self evaluate: args) val explore 
]

{ #category : #'*xtra-platypus-code-generating' }
PltFunctionDeclaration >> generatedClassNameSuffix [
	^ 'Function'
]

{ #category : #'*xtra-platypus-type-infering' }
PltFunctionDeclaration >> staticDomain [
	^ self returnType computedDomain

]
