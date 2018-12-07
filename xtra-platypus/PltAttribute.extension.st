Extension { #name : #PltAttribute }

{ #category : #'*xtra-platypus-accessing' }
PltAttribute >> annotation [
	^ self domain annotation
]

{ #category : #'*xtra-platypus-accessing' }
PltAttribute >> errorQualifier [
	^ super errorQualifier , ' ''' , self name, ''''
]

{ #category : #'*xtra-platypus-accessing' }
PltAttribute >> fullyQualifiedName [
	| qualName own |
	qualName := self name.
	own := self owner.
	[own isNil] whileFalse: 
			[qualName := own name , '.' , qualName.
			(own := own owner) isPltSchemaInstance ifTrue: [^qualName asUppercase]].
	^qualName asUppercase
]

{ #category : #'*xtra-platypus-code-generating' }
PltAttribute >> generatedClassName [
	^ self owner generatedClassName
]

{ #category : #'*xtra-platypus-code-generating' }
PltAttribute >> generatedClassNameFromNamesBuilder: aNamesBuilder [ 
	^ self owner generatedClassNameFromNamesBuilder: aNamesBuilder 

]

{ #category : #'*xtra-platypus-code-generating' }
PltAttribute >> getSelectorFromNamesBuilder: aNamesBuilder [ 
	^ aNamesBuilder
		normalizedGetSelectorFrom: self name
		prefix: nil
		suffix: ''
]

{ #category : #'*xtra-platypus-code-generating' }
PltAttribute >> getSelectorWithArgFromNamesBuilder: aNamesBuilder suffix: aSuffix [ 
	^ aNamesBuilder
		normalizedGetSelectorWithArgFrom: self name
		prefix: nil
		suffix: aSuffix
]

{ #category : #'*xtra-platypus-code-generating' }
PltAttribute >> getSelectorWithContextArgFromNamesBuilder: aNamesBuilder [ 
	^ self getSelectorWithArgFromNamesBuilder: aNamesBuilder suffix: 'UsingContext'
]

{ #category : #'*xtra-platypus-type-infering' }
PltAttribute >> staticDomain [
	^ self domain computedDomain

]

{ #category : #'*xtra-platypus-code-generating' }
PltAttribute >> variableHolders [
	^ OrderedCollection with: self 
]
