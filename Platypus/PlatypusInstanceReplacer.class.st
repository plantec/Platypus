Class {
	#name : #PlatypusInstanceReplacer,
	#superclass : #PlatypusStepOnePassAbstractVisitor,
	#instVars : [
		'index',
		'modelContents'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'visit population schema' }
PlatypusInstanceReplacer >> acceptAggregateData: e [ 
	e contents 
		doWithIndex: [:v :p |
			index 
				at: v 
				ifPresent: [:found | e contents at: p put: found]
				ifAbsent: [self acceptTry: v]]
]

{ #category : #'visit population schema' }
PlatypusInstanceReplacer >> acceptExternalRepresentation: e [ 
	e records 
		doWithIndex: [:v :p |
			index 
				at: v 
				ifPresent: [:found | e records at: p put: found]
				ifAbsent: [self acceptTry: v]]
]

{ #category : #'visit population schema' }
PlatypusInstanceReplacer >> acceptInternalRepresentation: e [ 
	e parameters 
		doWithIndex: [:v :p |
			index 
				at: v 
				ifPresent: [:found | e parameters at: p put: found]
				ifAbsent: [self acceptTry: v]]
]

{ #category : #'visit population schema' }
PlatypusInstanceReplacer >> acceptSimpleRecord: e [ 
	e parameters 
		doWithIndex: [:v :p |
			index 
				at: v 
				ifPresent: [:found | e parameters at: p put: found]
				ifAbsent: [self acceptTry: v]]
]

{ #category : #accessing }
PlatypusInstanceReplacer >> modelContents: anObject [
	modelContents := anObject
]

{ #category : #accessing }
PlatypusInstanceReplacer >> remove: oldInst from: aModelContents [ 
	| idx |
	idx := IdentityDictionary new.
	idx at: oldInst put: PltMissingValue new.
	self removeIndex: idx from: aModelContents
]

{ #category : #accessing }
PlatypusInstanceReplacer >> removeIndex: aDictionary from: aModelContents [ 
	index := aDictionary.
	self modelContents: aModelContents.
	self acceptTry: aModelContents.
	aDictionary keysAndValuesDo: [:k :v |
		| pos newInst oldInst |
		oldInst := k.
		newInst := v.
		pos := aModelContents indexOf: oldInst.
		pos > 0 
			ifTrue: [
				aModelContents dataInstances remove: oldInst.
				aModelContents removeFromIndexes: oldInst]].
	
]

{ #category : #accessing }
PlatypusInstanceReplacer >> replace: oldInst with: newInst in: aModelContents [
	self modelContents: aModelContents.
	self replaceInIndexes: oldInst with: newInst.
	index := IdentityDictionary new.
	index at: oldInst put: newInst.
	self acceptTry: aModelContents.

]

{ #category : #accessing }
PlatypusInstanceReplacer >> replaceInIndexes: oldInst with: newInst [
	| pos |
	newInst persistentLabel: oldInst persistentLabel.
	newInst owningModel: modelContents.
	newInst computed: oldInst computed.
	pos := modelContents indexOf: newInst.
	pos > 0 
		ifTrue: [
			modelContents privateRemove: newInst.
			modelContents dataInstances at: pos put: nil].
	pos := modelContents indexOf: oldInst.
	pos > 0 
		ifTrue: [
			modelContents privateRemove: oldInst.
			modelContents dataInstances at: pos put: newInst].
	modelContents addToIndexes:  newInst withPosition: pos.

]

{ #category : #accessing }
PlatypusInstanceReplacer >> replaceIndex: aDictionary in: aModelContents [
	index := aDictionary.
	self modelContents: aModelContents.
	self acceptTry: aModelContents.
	aDictionary keysAndValuesDo: [:k :v | self replaceInIndexes: k with: v].

]
