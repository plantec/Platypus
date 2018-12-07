Extension { #name : #PltExpression }

{ #category : #'*xtra-platypus-checking' }
PltExpression >> alwaysReturn [
	^ false
]

{ #category : #'*xtra-platypus-converting' }
PltExpression >> asAggregateInitializerElement [
	^ PltAggregateInitializerElement val: self
]

{ #category : #'*xtra-platypus-parsing' }
PltExpression >> asBound [
	| bound |
	bound := PltPopulationDependentBound new.
	bound setBoundValue: self.
	^ bound
]

{ #category : #'*xtra-platypus-evaluating' }
PltExpression >> assignValue: anObject [ 
	^ false
]

{ #category : #'*xtra-platypus-accessing' }
PltExpression >> cachedDomain [
	^ cachedDomain
]

{ #category : #'*xtra-platypus-accessing' }
PltExpression >> cachedDomain: aDomain [ 
	cachedDomain := aDomain
]

{ #category : #'*xtra-platypus-type-infering' }
PltExpression >> computedDomain [
	| sd |
	(sd := self cachedDomain)
			ifNil: [sd := self inferedDomain.
					sd ~~ self
						ifTrue: [self cachedDomain: sd]].
			^ sd
]

{ #category : #'*xtra-platypus-accessing' }
PltExpression >> errorQualifier [
	self isPltValue
		ifTrue: [^ super errorQualifier , ' ' , self printableCode].
	^ super errorQualifier , ' ''' , self prettyPrintedExpressCode , ''''
]

{ #category : #'*xtra-platypus-type-infering' }
PltExpression >> inferedDomain [
	^ PltGenericType asDomain
]

{ #category : #'*xtra-platypus-accessing' }
PltExpression >> printableCode [
	self isPltValue
		ifTrue: [| writer | 
			writer := PlatypusModelContentsStepWriter new.
			writer outStream: (WriteStream on: String new).
			writer acceptTry: self.
			^ writer outStream contents].
	^ super printableCode
]

{ #category : #'*xtra-platypus-accessing' }
PltExpression >> removeCachedDomain [
	self cachedDomain: nil
]

{ #category : #'*xtra-platypus-evaluating' }
PltExpression >> rolesOf: anInstanceReference in: aSetOfString [

]

{ #category : #'*xtra-platypus-evaluating' }
PltExpression >> rolesValue: anInstanceReference roleSchema: schemaKey roleEntity: entityKey roleAttribute: attributeKey in: resultSet [

]

{ #category : #'*xtra-platypus-accessing' }
PltExpression >> setParenthesis: aBoolean [ 
	"ignored here (see PltBinaryExpression)"
	^ self
]
