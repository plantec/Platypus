Class {
	#name : #PlatypusExpressInterpretorContext,
	#superclass : #PlatypusStepVisitorContext,
	#instVars : [
		'dataIndex'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #'data enumerating' }
PlatypusExpressInterpretorContext >> applicationInstanceDo: aBlock [ 
	| v |
	self
		dataDo: [:d | 
			(v := d val) isPltGenericInstance
				ifTrue: [aBlock value: v]]
]

{ #category : #'data enumerating' }
PlatypusExpressInterpretorContext >> applicationInstancesDetect: aSelectionBlock [ 
	| v |
	^ self
		dataDetect: [:d | 
			(v := d val) isPltGenericInstance
				and: [aSelectionBlock value: v]]
]

{ #category : #'data enumerating' }
PlatypusExpressInterpretorContext >> applicationInstancesSelect: aSelectionBlock in: selected [ 
	| v |
	self
		dataSelect: [:d | d notNil and: [(v := d val) isPltGenericInstance and: [aSelectionBlock value: v]]]
		in: selected
]

{ #category : #accessing }
PlatypusExpressInterpretorContext >> data: aData [
	^ dataIndex
		at: aData
		ifAbsent: []
]

{ #category : #accessing }
PlatypusExpressInterpretorContext >> data: aData value: aValue [ 
	^ dataIndex at: aData put: aValue
]

{ #category : #'data enumerating' }
PlatypusExpressInterpretorContext >> dataDo: aBlock [
	self dataIndex do: [:d | aBlock value: d val]
]

{ #category : #accessing }
PlatypusExpressInterpretorContext >> dataIndex [
	^ dataIndex
	
]

{ #category : #accessing }
PlatypusExpressInterpretorContext >> dataNamed: anIdent [
	| key |
	key := anIdent asUppercase.
	dataIndex keysAndValuesDo: [ :k :v | k name asUppercase = key ifTrue: [^ v]].
	^ nil
]

{ #category : #'data enumerating' }
PlatypusExpressInterpretorContext >> dataSelect: aSelectionBlock in: selected [ 
	self dataIndex
		do: [:d | | v |
			v := d val.
			(aSelectionBlock value: v)
				ifTrue: [selected add: v]]
]

{ #category : #'initialize/release' }
PlatypusExpressInterpretorContext >> destroy [
	dataIndex := nil.
	super destroy
]

{ #category : #accessing }
PlatypusExpressInterpretorContext >> includesData: aData [ 
	^ dataIndex includesKey: aData 
]

{ #category : #'initialize/release' }
PlatypusExpressInterpretorContext >> initialize [
	super initialize.
	dataIndex := IdentityDictionary new
]

{ #category : #'initialize/release' }
PlatypusExpressInterpretorContext >> initializeContextInInterpretor: anInterpretor [ 
	contextInstance initializeContextInInterpretor: anInterpretor
]

{ #category : #accessing }
PlatypusExpressInterpretorContext >> stackElementOfDataNamed: anIdent [ 
	| key |
	key := anIdent asUppercase.
	dataIndex
		keysAndValuesDo: [:k :v | k name asUppercase = key
				ifTrue: [^ k]].
	^ nil
]
