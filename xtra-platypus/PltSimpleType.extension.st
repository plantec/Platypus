Extension { #name : #PltSimpleType }

{ #category : #'*xtra-platypus-accessing' }
PltSimpleType >> errorQualifier [
	^ super errorQualifier
]

{ #category : #'*xtra-platypus-accessing' }
PltSimpleType class >> expressTypeForTypeOf [
	^ self expressTypeName
]

{ #category : #'*xtra-platypus-type-infering' }
PltSimpleType >> staticDomain [
	^ self class asDomain
]
