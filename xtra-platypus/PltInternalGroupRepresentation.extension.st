Extension { #name : #PltInternalGroupRepresentation }

{ #category : #'*xtra-platypus-accessing' }
PltInternalGroupRepresentation >> detectInstanceAttributeIdentification: aBlock [ 
	(self definition selectInheritedExplicitAttributeIdentifications: aBlock)
		ifNotEmpty: [:founds | ^ founds first].
	^ nil
]

{ #category : #'*xtra-platypus-evaluating' }
PltInternalGroupRepresentation >> equal: other [ 
^ self equalInternal: other
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalGroupRepresentation >> groupClass [
	^ PltInternalGroupRepresentation
]

{ #category : #'*xtra-platypus-type-infering' }
PltInternalGroupRepresentation >> inferedDomain [
	^ self definition computedDomain

]

{ #category : #'*xtra-platypus-evaluating' }
PltInternalGroupRepresentation >> instEqual: other [ 
	| myParam otherParam res |
	self == other
		ifTrue: [^ PltTrueConstant new].
	self groupClass == other groupClass
		ifFalse: [^ PltFalseConstant new].
	self definition == other definition
		ifFalse: [^ PltFalseConstant new].
	self wrappedParameters size == other wrappedParameters size
		ifFalse: [^ PltFalseConstant new].
	1
		to: self wrappedParameters size
		do: [:pos | 
			myParam := self wrappedParameters at: pos.
			otherParam := other wrappedParameters at: pos.
			res := myParam instEqual: otherParam.
			res
				ifFalseOrUnknownConstant: [^ res]].
	^ PltTrueConstant new
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalGroupRepresentation >> isInsideGroup: anEntityDef [ 
	^ self definition == anEntityDef
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalGroupRepresentation >> numberOfAttributesUntilGroup: groupEntityDef [ 
	^ (self definition numberOfAttributesUntilGroup: groupEntityDef)
		+ (self instref numberOfAttributesUntilGroup: self definition)
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalGroupRepresentation >> parameters [
	^ self unwrappedParameters 
]

{ #category : #'*xtra-platypus-enumerating' }
PltInternalGroupRepresentation >> privateExplicitAttributesAndValuesDo: aBlock [ 
	^ self privateInternalExplicitAttributesAndValuesDo: aBlock 
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalGroupRepresentation >> records [
	^ Array with: self
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalGroupRepresentation >> startAttributePrevPosition [
	^ self instref numberOfAttributesUntilGroup: self definition
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalGroupRepresentation >> unwrappedParameters [
	^ self instRef unwrappedParameters
]

{ #category : #'*xtra-platypus-accessing' }
PltInternalGroupRepresentation >> wrappedParameters [
	| startPrevPos |
	startPrevPos := self startAttributePrevPosition.
	^ self unwrappedParameters copyFrom: startPrevPos + 1 to: self definition numberOfInheritedExplicitAttributes + startPrevPos
]
