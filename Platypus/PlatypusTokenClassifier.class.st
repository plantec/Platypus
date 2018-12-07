Class {
	#name : #PlatypusTokenClassifier,
	#superclass : #Object,
	#instVars : [
		'stringEvaluatedConditionsList',
		'characterEvaluatedConditionsList',
		'tokensClassByTokenValueMap',
		'tokensClassByTokenSymbolMap'
	],
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #adding }
PlatypusTokenClassifier >> classifyCharacter: aClass block: aBlock [ 
	characterEvaluatedConditionsList
		add: (Association key: aBlock value: aClass)
]

{ #category : #adding }
PlatypusTokenClassifier >> classifyString: aClass block: aBlock [ 
	stringEvaluatedConditionsList
		add: (Association key: aBlock value: aClass)
]

{ #category : #'initialize-release' }
PlatypusTokenClassifier >> initialize [
	super initialize.
	stringEvaluatedConditionsList := OrderedCollection new.
	characterEvaluatedConditionsList := OrderedCollection new.
	tokensClassByTokenValueMap := Dictionary new.
	tokensClassByTokenSymbolMap := IdentityDictionary new.

]

{ #category : #accessing }
PlatypusTokenClassifier >> tokenClassFromCharacter: aValue ifAbsent: aBlock [ 
	| foundConditionAssoc |
	foundConditionAssoc := characterEvaluatedConditionsList
				detect: [:assoc | assoc key value: aValue]
				ifNone: [].
	foundConditionAssoc notNil
		ifTrue: [^ foundConditionAssoc value].
	^ tokensClassByTokenValueMap
		at: aValue
		ifAbsent: [aBlock value]
]

{ #category : #accessing }
PlatypusTokenClassifier >> tokenClassFromString: aValue ifAbsent: aBlock [ 
	| foundConditionAssoc |
	foundConditionAssoc := stringEvaluatedConditionsList
				detect: [:assoc | assoc key value: aValue]
				ifNone: [].
	foundConditionAssoc notNil
		ifTrue: [^ foundConditionAssoc value].
	^ tokensClassByTokenSymbolMap
				at: aValue asLowercase asSymbol
				ifAbsent: [tokensClassByTokenValueMap
		at: aValue ifAbsent: [aBlock value]]
]
