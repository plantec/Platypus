Extension { #name : #PltAttributeReference }

{ #category : #'*xtra-platypus-instance-creation' }
PltAttributeReference class >> name: attrIndent entityRef: entityRef [ 
	^ self new name: attrIndent entityRef: entityRef 

]

{ #category : #'*xtra-platypus-accessing' }
PltAttributeReference >> name: attrIndent entityRef: anEntityRef [ 
	self name: attrIndent.
	self fastSetEntityRef: anEntityRef.

]

{ #category : #'*xtra-platypus-accessing' }
PltAttributeReference >> name: attrIndent entityRefName: anEntityRefName [ 
	| r |
	self
		name: attrIndent
		entityRef: (r := PltEntityDefinitionReference name: anEntityRefName).
	r owner: self owner.

]

{ #category : #'*xtra-platypus-instance-creation' }
PltAttributeReference class >> name: attrIndent entityRefName: entityIdent [ 
	^ self new name: attrIndent entityRefName: entityIdent
]

{ #category : #'*xtra-platypus-accessing' }
PltAttributeReference >> referenced [
	^ self ref
]
