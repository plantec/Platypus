Extension { #name : #PltLiteral }

{ #category : #'*xtra-platypus-evaluating' }
PltLiteral >> = other [ 
	(other class = self class) ifFalse: [^false].
	^ self val = other val
]

{ #category : #'*xtra-platypus-evaluating' }
PltLiteral >> equal: op [
	^ PltLogicalLiteral val: self val = op val
]

{ #category : #'*xtra-platypus-evaluating' }
PltLiteral >> hash [
	
	^ self val hash
]

{ #category : #'*xtra-platypus-classification' }
PltLiteral >> isPltOrderedLiteral [
	^ true
]

{ #category : #'*xtra-platypus-classification' }
PltLiteral >> isPltValue [
	^ true
]

{ #category : #'*xtra-platypus-evaluating' }
PltLiteral >> pltNativeValue [
	^ self val
]

{ #category : #'*xtra-platypus-accessing' }
PltLiteral >> tamarisStepValueReferenceClass [
	^ PlatypusStepReference
]

{ #category : #'*xtra-platypus-instance creation' }
PltLiteral class >> val: aValue [
	^ self new val: aValue
]
