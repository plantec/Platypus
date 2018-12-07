Extension { #name : #PltAggregationType }

{ #category : #'*xtra-platypus-accessing' }
PltAggregationType class >> expressTypeForTypeOf [
	| en |
	^ ((en := self platypusMetaData name ) copyFrom: 1 to: en size - 5) asUppercase
]

{ #category : #'*xtra-platypus-testing' }
PltAggregationType >> isPltGeneralAggregateType [
	^ self isGeneralType
]

{ #category : #'*xtra-platypus-accessing' }
PltAggregationType class >> sexpressTypeForTypeOf [
	| en |
	^ ((en := self entityName) copyFrom: 1 to: en size - 5) asUppercase
]
