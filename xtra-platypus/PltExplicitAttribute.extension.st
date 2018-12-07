Extension { #name : #PltExplicitAttribute }

{ #category : #'*xtra-platypus-accessing' }
PltExplicitAttribute >> annotation [
	^ String 
		streamContents: [:strm |
			self optionalFlag 
				ifTrue: [strm nextPutAll: 'optional '].
			strm nextPutAll: (self domain ifNil: ['?'] ifNotNil: [:d | d annotation])]
]

{ #category : #'*xtra-platypus-checking' }
PltExplicitAttribute >> checksValueFromInstance: anInstance oid: anInteger repository: aPlatypusRepository [ 
	| value selector entityDef |
	selector := (self getSelectorFromNamesBuilder: aPlatypusRepository namesBuilder) asSymbol.
	(value := anInstance perform: selector)
		ifNil: [self optionalFlag
				ifFalse: [entityDef := aPlatypusRepository metaDataSchemaInstance metaDataFor: anInstance class name asSymbol.
					(self isRedeclaredAsDerivedInEntityDefinition: entityDef)
						ifFalse: [^ Array
								with: (PlatypusDataChecker errorClass
										error: 'attribute: ' , self name , ' is mandatory but is missing'
										oid: anInteger
										repository: aPlatypusRepository)]]]
		ifNotNil: [^ PlatypusDataChecker
				checksValue: value
				attribute: self
				instanceOid: anInteger
				repository: aPlatypusRepository].
	^ #()
]

{ #category : #'*xtra-platypus-evaluating' }
PltExplicitAttribute >> defaultValue [
	^ self domain defaultValue
]

{ #category : #'*xtra-platypus-code-generating' }
PltExplicitAttribute >> fastSetSelectorFromNamesBuilder: aNamesBuilder [ 
	^ aNamesBuilder
		normalizedSetSelectorFrom: self name
		prefix: 'fastSet'
		suffix: ''
]

{ #category : #'*xtra-platypus-code-generating' }
PltExplicitAttribute >> getSelectorFromNamesBuilder: aNamesBuilder [ 
	^ aNamesBuilder
		normalizedGetSelectorFrom: self name
		prefix: nil
		suffix: ''
]

{ #category : #'*xtra-platypus-accessing' }
PltExplicitAttribute >> initializedValue [
	^ self domain initializedValue
]

{ #category : #'*xtra-platypus-code-generating' }
PltExplicitAttribute >> instVarNameFromNamesBuilder: aNamesBuilder [ 
	^ aNamesBuilder normalizedVarNameFrom: self name 
]

{ #category : #'*xtra-platypus-checking' }
PltExplicitAttribute >> isRedeclaredAsDerivedInEntityDefinition: entityDef [ 
	| canTest |
	canTest := false.
	entityDef inheritedAttributesDo: [:attr | (self == attr) ifTrue: [canTest := true]
			ifFalse: [canTest ifTrue: [(attr name asUppercase = self name asUppercase
				and: [attr isPltDerivedAttribute]) ifTrue: [^ true]]]].
	^ false

]

{ #category : #'*xtra-platypus-code-generating' }
PltExplicitAttribute >> lowSetSelectorFromNamesBuilder: aNamesBuilder [ 
	^ aNamesBuilder
		normalizedSetSelectorFrom: self name
		prefix: nil
		suffix: ''
]

{ #category : #'*xtra-platypus-code-generating' }
PltExplicitAttribute >> setSelectorFromNamesBuilder: aNamesBuilder [ 
	^ aNamesBuilder
		normalizedSetSelectorFrom: self name
		prefix: 'set'
		suffix: ''
]

{ #category : #'*xtra-platypus-accessing' }
PltExplicitAttribute >> tamarisStepValueReferenceClass [
	^ PlatypusStepReference
]
