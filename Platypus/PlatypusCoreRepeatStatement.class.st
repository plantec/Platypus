Class {
	#name : #PlatypusCoreRepeatStatement,
	#superclass : #PlatypusCoreStatement,
	#instVars : [
		'incrControlBlock',
		'untilControlBlock',
		'whileControlBlock'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #'instance creation' }
PlatypusCoreRepeatStatement class >> repeat: aBlock [ 
	^ (self new )
		repeat: aBlock
]

{ #category : #'instance creation' }
PlatypusCoreRepeatStatement class >> repeat: aBlock from: start to: stop [ 
	^ (self new )
		repeat: aBlock
		from: start
		to: stop
]

{ #category : #'instance creation' }
PlatypusCoreRepeatStatement class >> untilControlBlock: untilBlock repeat: aBlock [ 
	^ (self new untilControlBlock: untilBlock)
		repeat: aBlock
]

{ #category : #'instance creation' }
PlatypusCoreRepeatStatement class >> untilControlBlock: untilBlock repeat: aBlock from: start to: stop [ 
	^ (self new untilControlBlock: untilBlock)
		repeat: aBlock
		from: start
		to: stop
]

{ #category : #'instance creation' }
PlatypusCoreRepeatStatement class >> whileControlBlock: whileBlock repeat: aBlock [ 
	^ (self new whileControlBlock: whileBlock )
		repeat: aBlock
]

{ #category : #'instance creation' }
PlatypusCoreRepeatStatement class >> whileControlBlock: whileBlock repeat: aBlock from: start to: stop [ 
	^ (self new whileControlBlock: whileBlock )
		repeat: aBlock
		from: start
		to: stop
]

{ #category : #'instance creation' }
PlatypusCoreRepeatStatement class >> whileControlBlock: whileBlock untilControlBlock: untilBlock repeat: aBlock [
	^(self new whileControlBlock: whileBlock untilControlBlock: untilBlock) repeat: aBlock
]

{ #category : #'instance creation' }
PlatypusCoreRepeatStatement class >> whileControlBlock: whileBlock untilControlBlock: untilBlock repeat: aBlock from: start to: stop [
	^(self new whileControlBlock: whileBlock untilControlBlock: untilBlock) 
		repeat: aBlock from: start to: stop
]

{ #category : #evaluating }
PlatypusCoreRepeatStatement >> repeat: aBlock [ 
	| done skip |
	done := false.
	[done not
		and: [self whileControlBlock value: nil]]
		whileTrue: [skip := false.
			[aBlock
				on: PlatypusExpressSkipStatementException
				do: [skip := true].
			skip
				ifFalse: [done := (self untilControlBlock value: nil)]]
				on: PlatypusExpressEscapeStatementException
				do: [done := true]]
]

{ #category : #evaluating }
PlatypusCoreRepeatStatement >> repeat: aBlock from: start to: stop [ 
	| skip |
	start
		to: stop
		do: [:p | 
			self whileControlBlock ifNotNil: [(self whileControlBlock value: p)
				ifFalse: [^ nil]].
			[skip := false.
			[aBlock value: p]
				on: PlatypusExpressSkipStatementException
				do: [skip := true].
			skip
				ifFalse: [(self untilControlBlock value: p)
						ifTrue: [^ nil]]]
				on: PlatypusExpressEscapeStatementException
				do: [^ nil]]
]

{ #category : #accessing }
PlatypusCoreRepeatStatement >> untilControlBlock [
	^ untilControlBlock
		ifNil: [[:p | false]]
]

{ #category : #accessing }
PlatypusCoreRepeatStatement >> untilControlBlock: untilBlock [ 
	untilControlBlock := untilBlock.

]

{ #category : #accessing }
PlatypusCoreRepeatStatement >> whileControlBlock [
	^ whileControlBlock
		ifNil: [[:p |true]]
]

{ #category : #accessing }
PlatypusCoreRepeatStatement >> whileControlBlock: whileBlock [ 
	whileControlBlock := whileBlock
]

{ #category : #accessing }
PlatypusCoreRepeatStatement >> whileControlBlock: whileBlock untilControlBlock: untilBlock [ 
	untilControlBlock := untilBlock.
	whileControlBlock := whileBlock
]
