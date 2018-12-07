Class {
	#name : #PlatypusExpressInterpretorStackAppInst,
	#superclass : #PlatypusExpressInterpretorStackElement,
	#instVars : [
		'instance',
		'interpreted'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #'instance creation' }
PlatypusExpressInterpretorStackAppInst class >> instance: anInstance interpretor: anInterpretor [ 
	^ self new instance: anInstance interpretor: anInterpretor
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackAppInst >> addRecordsToExternalRepresentation: externalRep [
	instance asExternalRepresentation records do: [:rec | rec copy addRecordsToExternalRepresentation: externalRep]
]

{ #category : #interpreting }
PlatypusExpressInterpretorStackAppInst >> assign: aValue [ 
	| varDomain assigned |
	self interpretor checkAssignmentOf: aValue to: self var.
	varDomain := self var computedDomain.
	assigned := self interpretor valueFromDomain: varDomain assignCompatibleWith: aValue.
	^ self fastAssign: assigned
]

{ #category : #copying }
PlatypusExpressInterpretorStackAppInst >> deepCopy [
	| n |
	n := super deepCopy.
	n instance: self instance deepCopy.
	^ n
]

{ #category : #accessing }
PlatypusExpressInterpretorStackAppInst >> domain [
	^ self instance computedDomain

]

{ #category : #interpreting }
PlatypusExpressInterpretorStackAppInst >> fastAssign: aValue [ 
	instance := aValue.
	^ instance
]

{ #category : #accessing }
PlatypusExpressInterpretorStackAppInst >> instance [
	^instance
]

{ #category : #accessing }
PlatypusExpressInterpretorStackAppInst >> instance: anExternalRep [
	instance := anExternalRep
]

{ #category : #accessing }
PlatypusExpressInterpretorStackAppInst >> instance: anInstance interpretor: anInterpretor [ 
	self instance: anInstance.
	super
		var: (PltAnonymousVariable domain: self domain)
		interpretor: anInterpretor
]

{ #category : #accessing }
PlatypusExpressInterpretorStackAppInst >> val [
	| value attrDomain valueDomain  |
	interpreted ifNil: 
			[interpreted := instance.
			self interpretor asValOfSelf: instance
				while: 
					[self instance records do: 
							[:rec | 
							rec definition referenced explicitAttributesWithIndexDo: 
									[:attr :pos | 
									pos > rec parameters size 
										ifTrue: [rec parameters add: PltMissingValue new].
									value := rec parameters at: pos.
									value isPltValue 
										ifFalse: 
											[value isPltIdentifier 
												ifTrue: 
													[self interpretor asContextsStack: value contextsStack
														while: [value acceptTry: self interpretor]]
												ifFalse: [value acceptTry: self interpretor].
											value := self interpretor popVal].
									attrDomain := attr domain.
									valueDomain := value computedDomain.
									(self interpretor value: value isAssignableTo: attr) 
										ifFalse: 
											[^ PlatypusExpressIncompatibleDomainInAssignmentException 
												signal: 'entity ''' , attr owner name , ''' attribute ''' , attr name 
														, ''' domain : ' , attrDomain prettyPrintedExpressCode 
														, ';  value domain : ' , valueDomain prettyPrintedExpressCode].
									self interpretor asValOfSelf: instance
										while: 
											[value := self interpretor valueFromDomain: attrDomain
														assignCompatibleWith: value].
									rec parameters at: pos put: value]]]].
	^ interpreted
]

{ #category : #copying }
PlatypusExpressInterpretorStackAppInst >> veryDeepCopy [
	| n |
	n := super veryDeepCopy.
	n instance: self instance veryDeepCopy.
	^ n
]
