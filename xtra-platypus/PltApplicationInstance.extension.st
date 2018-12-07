Extension { #name : #PltApplicationInstance }

{ #category : #'*xtra-platypus-type-infering' }
PltApplicationInstance >> computedDomain [
	^ self inferedDomain
]

{ #category : #'*xtra-platypus-evaluating' }
PltApplicationInstance >> instEqual: another [ 
	^ PltLogicalLiteral val: self == another
]

{ #category : #'*xtra-platypus-classification' }
PltApplicationInstance >> isPltValue [
	^ true
]

{ #category : #'*xtra-platypus-printing' }
PltApplicationInstance >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $[.
	self persistentLabel printOn: aStream.
	aStream nextPut: $].
		
]

{ #category : #'*xtra-platypus-accessing' }
PltApplicationInstance >> printableCode [
	| writer |
	writer := PlatypusModelContentsStepWriter new.
	writer outStream: (WriteStream on: String new).
	writer acceptTry: self.
	^ writer outStream contents
]

{ #category : #'*xtra-platypus-data-management' }
PltApplicationInstance >> updatePersistentLabelIndex: index [
	index at: self persistentLabel put: self
]

{ #category : #'*xtra-platypus-accessing' }
PltApplicationInstance >> valueOfExplicitAttributeNamed: aName [ 
	^ self subclassResponsibility
]
