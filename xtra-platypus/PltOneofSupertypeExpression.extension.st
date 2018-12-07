Extension { #name : #PltOneofSupertypeExpression }

{ #category : #'*xtra-platypus-checking' }
PltOneofSupertypeExpression >> checksSubtypesInheritance: mySuper [
	| result |
	result := OrderedCollection new.
	self exprList do: [ :e | result addAll: (e checksSubtypesInheritance: mySuper)].
	^ result
]

{ #category : #'*xtra-platypus-accessing' }
PltOneofSupertypeExpression >> operatorSymbol [
	^#oneof
]
