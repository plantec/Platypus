Extension { #name : #PltWhereRule }

{ #category : #'*xtra-platypus-accessing' }
PltWhereRule >> fullyQualifiedName [
	| qualName own |
	own := self owner.
	qualName := self label 
				ifNil: ['#' , (own whereRules indexOf: self) printString].
	[own isNil] whileFalse: 
			[qualName := own name , '.' , qualName.
			(own := own owner) isPltSchemaInstance ifTrue: [^qualName asUppercase]].
	^qualName asUppercase
]

{ #category : #'*xtra-platypus-code-generating' }
PltWhereRule >> generatedClassName [
	^ self owner generatedClassName
]

{ #category : #'*xtra-platypus-code-generating' }
PltWhereRule >> generatedClassNameFromNamesBuilder: aNamesBuilder [ 
	^self owner generatedClassNameFromNamesBuilder: aNamesBuilder
]

{ #category : #'*xtra-platypus-code-generating' }
PltWhereRule >> getSelectorFromNamesBuilder: aNamesBuilder [ 
	^aNamesBuilder 
		normalizedGetSelectorFrom: self name
		prefix: nil
		suffix: ''
]

{ #category : #'*xtra-platypus-code-generating' }
PltWhereRule >> getSelectorWithArgFromNamesBuilder: aNamesBuilder suffix: aSuffix [ 
	^aNamesBuilder 
		normalizedGetSelectorWithArgFrom: self name
		prefix: nil
		suffix: aSuffix
]

{ #category : #'*xtra-platypus-code-generating' }
PltWhereRule >> getSelectorWithContextArgFromNamesBuilder: aNamesBuilder [ 
	^self getSelectorWithArgFromNamesBuilder: aNamesBuilder
		suffix: 'UsingContext'
]

{ #category : #'*xtra-platypus-accessing' }
PltWhereRule >> name [
	^ self label
		ifNil: ['wrl' , (self owner whereRules indexOf: self) printString]
]

{ #category : #'*xtra-platypus-accessing' }
PltWhereRule >> tamarisStepValueReferenceClass [
	^ PlatypusStepReference
]
