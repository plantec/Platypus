Extension { #name : #PltMetaMappingRule }

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingRule >> haveError [
	^ haveError
		ifNil: [haveError := true]
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingRule >> haveError: aBoolean [ 
	haveError := aBoolean
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingRule >> metaCondition: anExpression [ 
	metaCondition := anExpression.
	self updateCondition
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingRule >> metaExpression: anExpression [ 
	metaExpression := anExpression.
	self updateExpression
]

{ #category : #'*xtra-platypus-instance-creation' }
PltMetaMappingRule class >> typeMapWhere: aCondition to: anExpression [ 
	^ (self new metaCondition: aCondition) metaExpression: anExpression
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingRule >> updateCondition [
	metaCondition
				isNil ifFalse: [condition := metaCondition prettyPrintedExpressCode]
				ifTrue: [condition := '']
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingRule >> updateExpression [
	metaExpression
				isNil ifFalse: [expression := metaExpression prettyPrintedExpressCode]
				ifTrue: [expression := '']
]
