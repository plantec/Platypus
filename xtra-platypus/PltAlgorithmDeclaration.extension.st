Extension { #name : #PltAlgorithmDeclaration }

{ #category : #'*xtra-platypus-accessing' }
PltAlgorithmDeclaration >> bindings [
	^ super bindings , self locals , self formalParameters 
]

{ #category : #'*xtra-platypus-evaluating' }
PltAlgorithmDeclaration >> canHaveArguments [
	^ true
]

{ #category : #'*xtra-platypus-evaluating' }
PltAlgorithmDeclaration >> initializeContextInInterpretor: anInterpretor [ 
	| args stackVal |
	anInterpretor argsStackSize > 0
		ifTrue: [stackVal := anInterpretor argsStackTop.
			stackVal arguments size ~= self formalParameters size
				ifTrue: [PlatypusExpressArgumentNumberException signal: 'invalid number of argument'].
			args := stackVal arguments.
			self formalParameters
				do: [:fp | anInterpretor localData: fp value: args removeFirst deepCopy]].
	super initializeContextInInterpretor: anInterpretor
]

{ #category : #'*xtra-platypus-data-management' }
PltAlgorithmDeclaration >> moveInto: aContextDefinition [ 
	aContextDefinition algorithmes add: self.
	self owner: aContextDefinition
]

{ #category : #'*xtra-platypus-data-management' }
PltAlgorithmDeclaration >> rebuildLocalCaches [
	super rebuildLocalCaches.
	self formalParameters do: [:par | self insertIntoCache: par]
]

{ #category : #'*xtra-platypus-data-management' }
PltAlgorithmDeclaration >> removeFrom: aContextDefinition [ 
	aContextDefinition removeAlgorithmDeclaration: self.

]

{ #category : #'*xtra-platypus-data-management' }
PltAlgorithmDeclaration >> renameWith: aString [ 
	self owner renameAlgorithmDeclaration: self with: aString
]
