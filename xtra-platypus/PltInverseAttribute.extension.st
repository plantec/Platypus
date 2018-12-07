Extension { #name : #PltInverseAttribute }

{ #category : #'*xtra-platypus-type-infering' }
PltInverseAttribute >> staticDomain [
	| stdom |
	self minCardinality
		ifNil: [^ self domain computedDomain]
		ifNotNil: [self duplicates
				ifTrue: [stdom := PltBagType new]
				ifFalse: [stdom := PltSetType new].
			stdom elementType: self domain computedDomain.
			stdom isGeneralType: false.
			stdom lowerBound: self minCardinality.
			stdom upperBound: self maxCardinality.
			^ stdom]

]

{ #category : #'*xtra-platypus-accessing' }
PltInverseAttribute >> tamarisStepValueReferenceClass [
	^ PlatypusStepReference
]
