Class {
	#name : #PlatypusExpressInterpretorStackElement,
	#superclass : #PlatypusExpressInterpretorStackValue,
	#instVars : [
		'var'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #interpreting }
PlatypusExpressInterpretorStackElement >> addRecordsToExternalRepresentation: externalRep [
	self val addRecordsToExternalRepresentation: externalRep

]

{ #category : #accessing }
PlatypusExpressInterpretorStackElement >> aggr: anAggr positionFromIndex: anInteger [ 
	anAggr isPltArrayInstance
		ifTrue: [^ anInteger - self aggr lowerBound val + 1]
		ifFalse: [^ anInteger]
]

{ #category : #accessing }
PlatypusExpressInterpretorStackElement >> asString [
	^ self val printableCode
]

{ #category : #accessing }
PlatypusExpressInterpretorStackElement >> computedDomain [
	^ self val computedDomain

]

{ #category : #interpreting }
PlatypusExpressInterpretorStackElement >> fastAssign: aValue [ 
	self subclassResponsibility

]

{ #category : #accessing }
PlatypusExpressInterpretorStackElement >> instance [
	^ self val
]

{ #category : #accessing }
PlatypusExpressInterpretorStackElement >> printString [
	^ self asString
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackElement >> pushAttribute: anIdent [ 
	| v key allAttrIdentif |
	(v := self val)
		ifMissing: [self interpretor pushVal: v]
		ifNotMissing: [key := anIdent asUppercase.
			allAttrIdentif := v getInstanceAttributeIdentification: [:a | a name asUppercase = key].
			allAttrIdentif isNil
				ifTrue: [PlatypusExpressInvalidAttributeException signal: 'invalid attribute name: ''' , anIdent , ''''].
				
			self pushAttribute: allAttrIdentif definition entityInstance: v]
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackElement >> pushAttribute: attrDef entityInstance: entityInst [ 
	self interpretor asValOfSelf: entityInst
		while: 
			[
			attrDef acceptTry: self interpretor]
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackElement >> pushIndex: anInteger [ 
	| elementDomain anonymousVar |
	elementDomain := self var staticDomain elementType.
	anonymousVar := PltAnonymousVariable domain: elementDomain.
	self
		pushVar: anonymousVar
		aggr: self val
		index: anInteger
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackElement >> pushRange: anInterval [ 
	| anonymousVar |
	anonymousVar := PltAnonymousVariable domain: self val computedDomain.
	self
		pushVar: anonymousVar
		aggr: self val
		range: anInterval

]

{ #category : #interpreting }
PlatypusExpressInterpretorStackElement >> pushVar: anObject aggr: anAgregateData index: anInteger [ 
	| stackElement |
	stackElement := PlatypusExpressInterpretorStackIndexedElement
				var: anObject
				aggr: anAgregateData
				idx: anInteger
				interpretor: interpretor.
	interpretor push: stackElement
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackElement >> pushVar: anObject aggr: anAgregateData range: anInterval [ 
	| stackElement |
	stackElement := PlatypusExpressInterpretorStackRangeElement
				var: anObject
				aggr: anAgregateData
				range: anInterval
				interpretor: interpretor.
	interpretor push: stackElement
]

{ #category : #accessing }
PlatypusExpressInterpretorStackElement >> val [
	^ self subclassResponsibility 
]

{ #category : #accessing }
PlatypusExpressInterpretorStackElement >> var [
	^var
]

{ #category : #accessing }
PlatypusExpressInterpretorStackElement >> var: anObject [ 
	var := anObject.

]

{ #category : #accessing }
PlatypusExpressInterpretorStackElement >> var: anObject interpretor: anInterpretor [
	self var: anObject.
	self interpretor: anInterpretor
]
