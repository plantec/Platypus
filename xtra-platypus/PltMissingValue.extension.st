Extension { #name : #PltMissingValue }

{ #category : #'*xtra-platypus-parsing' }
PltMissingValue >> asBound [
	^ nil
]

{ #category : #'*xtra-platypus-evaluating' }
PltMissingValue >> equal: op [ 
	^ PltUnknownConstant new
]

{ #category : #'*xtra-platypus-controlling' }
PltMissingValue >> ifMissing: missingBlock [ 
	^ missingBlock value
]

{ #category : #'*xtra-platypus-controlling' }
PltMissingValue >> ifMissing: missingBlock ifNotMissing: notMissingBlock [
	^ missingBlock value
]

{ #category : #'*xtra-platypus-controlling' }
PltMissingValue >> ifNotMissing: notMissingBlock [ 
	^ nil
]

{ #category : #'*xtra-platypus-controlling' }
PltMissingValue >> ifNotMissing: notMissingBlock ifMissing: missingBlock [ 
	^ missingBlock value
]

{ #category : #'*xtra-platypus-type-infering' }
PltMissingValue >> inferedDomain [
	^ PltGenericType asDomain
]

{ #category : #'*xtra-platypus-evaluating' }
PltMissingValue >> instNotEqual: other [ 
	^ PltUnknownConstant new
]

{ #category : #'*xtra-platypus-evaluating' }
PltMissingValue >> interpretingContext [ 
	^ self
]

{ #category : #'*xtra-platypus-classification' }
PltMissingValue >> isPltValue [
	^ true
]

{ #category : #'*xtra-platypus-evaluating' }
PltMissingValue >> notEqual: op [ 
	^ PltUnknownConstant new
]

{ #category : #'*xtra-platypus-accessing' }
PltMissingValue >> pltNativeValue [
	^ nil
]

{ #category : #'*xtra-platypus-accessing' }
PltMissingValue >> tamarisStepValueReferenceClass [
	^ PlatypusStepReference
]
