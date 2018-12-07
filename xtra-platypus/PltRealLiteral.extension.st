Extension { #name : #PltRealLiteral }

{ #category : #'*xtra-platypus-evaluating' }
PltRealLiteral >> asIntegerLiteralCompatibleTo: anIntegerType interpretor: anInterpretor [
	^ PltIntegerLiteral val: (self val asInteger)
]

{ #category : #'*xtra-platypus-evaluating' }
PltRealLiteral >> asRealLiteral [
	^ self
]

{ #category : #'*xtra-platypus-type-infering' }
PltRealLiteral >> inferedDomain [
	^ PltRealType asDomain
]

{ #category : #'*xtra-platypus-classification' }
PltRealLiteral >> isRealLiteral [
	^ true
]
