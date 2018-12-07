Class {
	#name : #PlatypusCoreCaseStatement,
	#superclass : #PlatypusCoreStatement,
	#instVars : [
		'caseActionBlocks',
		'otherwiseBlock'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #'instance creation' }
PlatypusCoreCaseStatement class >> caseActionBlocks: anArrayOfGuardBlocksWithActionBlockAssoc otherwiseBlock: anActionBlock case: anExpression [ 
	^(self new caseActionBlocks: anArrayOfGuardBlocksWithActionBlockAssoc
		otherwiseBlock: anActionBlock) case: anExpression
]

{ #category : #evaluating }
PlatypusCoreCaseStatement >> case: anExpression [ 
	(self caseActionBlocks detect: [:assoc | (assoc key anySatisfy: [ :blk | blk value = anExpression])]
		ifNone: [^self otherwiseBlock value value]) value 
		value
]

{ #category : #accessing }
PlatypusCoreCaseStatement >> caseActionBlocks [
	^ caseActionBlocks ifNil: [#()]
]

{ #category : #accessing }
PlatypusCoreCaseStatement >> caseActionBlocks: anArrayOfGuardBlocksWithActionBlockAssoc [ 
	caseActionBlocks := anArrayOfGuardBlocksWithActionBlockAssoc
]

{ #category : #accessing }
PlatypusCoreCaseStatement >> caseActionBlocks: anArrayOfGuardBlocksWithActionBlockAssoc otherwiseBlock: anActionBlock [ 
	self caseActionBlocks: anArrayOfGuardBlocksWithActionBlockAssoc.
	self otherwiseBlock: anActionBlock
]

{ #category : #accessing }
PlatypusCoreCaseStatement >> otherwiseBlock [
	^ otherwiseBlock ifNil: [[]]
]

{ #category : #accessing }
PlatypusCoreCaseStatement >> otherwiseBlock: anActionBlock [ 
	otherwiseBlock := anActionBlock
]
