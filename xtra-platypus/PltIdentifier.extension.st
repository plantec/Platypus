Extension { #name : #PltIdentifier }

{ #category : #'*xtra-platypus-converting' }
PltIdentifier >> asAttributeIdentifier [
	^ PltAttributeIdentifier name: name ref: ref
]

{ #category : #'*xtra-platypus-evaluating' }
PltIdentifier >> contextsStack [
	^ contextsStack
]

{ #category : #'*xtra-platypus-evaluating' }
PltIdentifier >> contextsStack: aStack [ 
	contextsStack := aStack
]

{ #category : #'*xtra-platypus-accessing' }
PltIdentifier >> errorQualifier [
	^ 'identifier ''' , self name , ''''
]

{ #category : #'*xtra-platypus-type-infering' }
PltIdentifier >> inferedDomain [
	^ self ref ifNil: [PltGenericType asDomain] ifNotNil: [ self ref computedDomain]
]

{ #category : #'*xtra-platypus-testing' }
PltIdentifier >> isDebugged [
	^ true
]

{ #category : #'*xtra-platypus-accessing' }
PltIdentifier >> name: anIdent ref: aDictionaryInstance [ 
	self name: anIdent.
	self ref: aDictionaryInstance 
]

{ #category : #'*xtra-platypus-instance-creation' }
PltIdentifier class >> name: anIdent ref: aDictionaryInstance [ 
	^ self new name: anIdent ref: aDictionaryInstance
]

{ #category : #'*xtra-platypus-accessing' }
PltIdentifier >> parametersSize [
	^ parameters ifNil: [0] ifNotNil: [parameters size]
]

{ #category : #'*xtra-platypus-printing' }
PltIdentifier >> printOn: aStream [ 
	super printOn: aStream.
	aStream nextPut: $(.
	name printOn: aStream .
	aStream nextPut: $)
]

{ #category : #'*xtra-platypus-instance-creation' }
PltIdentifier class >> ref: aDictionaryInstance [
	^ self new ref: aDictionaryInstance
]

{ #category : #'*xtra-platypus-accessing' }
PltIdentifier >> referenced [
	^ self ref
]
