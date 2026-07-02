"
SmaCCItemSet represents a LALR(1) or a LR(1) item set.

Instance Variables:
	type	<Symbol>	#LALR1 or #LR1


"
Class {
	#name : #SmaCCItemSet,
	#superclass : #Set,
	#type : #variable,
	#instVars : [
		'type'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #comparing }
SmaCCItemSet >> = aSmaCCItemSet [ 
	self class = aSmaCCItemSet class 
		ifTrue: 
			[type == #LALR1
				ifTrue: [^self isLALREqualTo: aSmaCCItemSet]
				ifFalse: [^self isLREqualTo: aSmaCCItemSet]].
	^false
]

{ #category : #accessing }
SmaCCItemSet >> action: aSmaCCSymbol prefer: aClass [ 
	| action actionItem eachAction |
	action := SmaCCRejectAction new.
	self do: 
			[:each | 
			eachAction := each action: aSmaCCSymbol.
			action class = SmaCCRejectAction 
				ifTrue: 
					[action := eachAction.
					actionItem := each]
				ifFalse: 
					[(eachAction = action or: [eachAction class = SmaCCRejectAction]) 
						ifFalse: 
							[eachAction class = SmaCCShiftAction | (action class = SmaCCShiftAction) 
								ifTrue: 
									["Shift/Reduce conflict -- check precedence"

									(aSmaCCSymbol precedence isNil 
										or: [each precedence isNil or: [actionItem precedence isNil]]) 
											ifTrue: 
												["No precedence, choose shift"

												eachAction class = SmaCCShiftAction 
													ifTrue: 
														[self 
															raiseXReduceNotification: each
															with: actionItem
															type: 'Shift/Reduce Conflict'.
														action := eachAction.
														actionItem := each]
													ifFalse: 
														[self 
															raiseXReduceNotification: actionItem
															with: each
															type: 'Shift/Reduce Conflict']]
											ifFalse: 
												[(each precedence > actionItem precedence 
													or: [each precedence = actionItem precedence and: [eachAction class = aClass]]) 
														ifTrue: 
															[self 
																raiseXReduceNotification: each
																with: actionItem
																type: 'Shift/Reduce Conflict (handled by precedence rules)'.
															action := eachAction.
															actionItem := each]
														ifFalse: 
															[(each precedence = actionItem precedence and: [SmaCCRejectAction = aClass]) 
																ifTrue: 
																	[self 
																		raiseXReduceNotificationWithNoPreferredItem: actionItem
																		with: each
																		type: 'Shift/Reduce Conflict (handled by precedence rules)'.
																	^aClass new]
																ifFalse: 
																	[self 
																		raiseXReduceNotification: actionItem
																		with: each
																		type: 'Shift/Reduce Conflict (handled by precedence rules)']]]]
								ifFalse: 
									["Reduce/Reduce conflict -- just pick one and proceed"

									self 
										raiseXReduceNotification: actionItem
										with: each
										type: 'Reduce/Reduce Conflict']]]].
	^action
]

{ #category : #adding }
SmaCCItemSet >> add: aSmaCCLR1Item [ 
	| index item |
	aSmaCCLR1Item == nil ifTrue: [^aSmaCCLR1Item].
	index := self findElementOrNil: aSmaCCLR1Item.
	item := array at: index.
	item == nil 
		ifTrue: 
			[self atNewIndex: index put: aSmaCCLR1Item.
			self performClosureOn: aSmaCCLR1Item]
		ifFalse: [item mergeWith: aSmaCCLR1Item].
	^aSmaCCLR1Item
]

{ #category : #copying }
SmaCCItemSet >> copyEmpty: anInteger [ 
	^ (Set new: anInteger)
		type: type;
		yourself
]

{ #category : #comparing }
SmaCCItemSet >> hash [
	^self inject: self class hash into: [:sum :each | sum bitXor: each hash]
]

{ #category : #'initialize-release' }
SmaCCItemSet >> initialize [
	super initialize.
	type := #LALR1
]

{ #category : #testing }
SmaCCItemSet >> isLALREqualTo: aSmaCCItemSet [ 
	^aSmaCCItemSet size = self size 
		and: [self allSatisfy: [:each | aSmaCCItemSet includes: each]]
]

{ #category : #testing }
SmaCCItemSet >> isLREqualTo: anItemSet [ 
	^anItemSet size = self size and: 
			[self allSatisfy: 
					[:each | 
					| item |
					(item := anItemSet itemFor: each) notNil and: [each isLR1EqualTo: item]]]
]

{ #category : #private }
SmaCCItemSet >> itemFor: anObject [ 
	^array at: (self findElementOrNil: anObject)
]

{ #category : #accessing }
SmaCCItemSet >> mergeWith: aSmaCCItemSet [ 
	self == aSmaCCItemSet ifTrue: [^self].
	aSmaCCItemSet do: [:each | self add: each]
]

{ #category : #accessing }
SmaCCItemSet >> moveOn: aSmaCCSymbol [ 
	| anItemSet |
	anItemSet := self class new.
	anItemSet type: type.
	self 
		do: [:each | each nextSymbol == aSmaCCSymbol ifTrue: [anItemSet add: each moveNext]].
	^anItemSet
]

{ #category : #private }
SmaCCItemSet >> performClosureOn: aSmaCCLR1Item [ 
	| nextSymbol rest first followers |
	nextSymbol := aSmaCCLR1Item nextSymbol.
	nextSymbol isTerminal ifTrue: [^self].
	rest := aSmaCCLR1Item rest.
	first := rest firstTerminals.
	followers := SmaCCSymbolSet new.
	(first includes: SmaCCSymbol empty) 
		ifTrue: 
			[first remove: SmaCCSymbol empty.
			followers baseOn: aSmaCCLR1Item followers].
	followers addAll: first.
	nextSymbol productionsDo: 
			[:each | 
			self add: (SmaCCLR1Item 
						symbol: nextSymbol
						rhs: each
						follow: followers)]
]

{ #category : #printing }
SmaCCItemSet >> printOn: aStream [ 
	self do: 
			[:each | 
			aStream
				tab;
				nextPutAll: each printString;
				cr]
]

{ #category : #accessing }
SmaCCItemSet >> raiseXReduceNotification: preferredSmaCCLR1Item with: otherSmaCCLR1Item type: aString [ 
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: preferredSmaCCLR1Item printString;
		nextPutAll: '	*****';
		cr;
		nextPutAll: otherSmaCCLR1Item printString.
	SmaCCCompilationNotification new
		tag: stream contents;
		signal: aString
]

{ #category : #accessing }
SmaCCItemSet >> raiseXReduceNotificationWithNoPreferredItem: firstSmaCCLR1Item with: secondSmaCCLR1Item type: aString [ 
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: firstSmaCCLR1Item printString;
		cr;
		nextPutAll: secondSmaCCLR1Item printString.
	SmaCCCompilationNotification new
		tag: stream contents;
		signal: aString
]

{ #category : #'initialize-release' }
SmaCCItemSet >> type: aSmaCCSymbol [ 
	type := aSmaCCSymbol
]
