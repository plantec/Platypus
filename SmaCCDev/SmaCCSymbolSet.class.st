"
SmaCCSymbolSet represents a set of follow symbols in the LALR(1) item sets.

Instance Variables:
	components	<Collection of: SmaCCSymbolSet>	other SmaCCSymbolSets that we depend on, we include all items in these sets also
	symbols	<Collection of: SmaCCTerminalSymbol>	our follow symbols
"
Class {
	#name : #SmaCCSymbolSet,
	#superclass : #Model,
	#instVars : [
		'symbols',
		'components'
	],
	#category : #'SmaCCDev-ParserGenerator'
}

{ #category : #'instance creation' }
SmaCCSymbolSet class >> basedOn: aSmaCCSymbolSet [ 
	^(self new)
		baseOn: aSmaCCSymbolSet;
		yourself
]

{ #category : #accessing }
SmaCCSymbolSet >> add: aSmaCCSymbol [ 
	(symbols includes: aSmaCCSymbol) ifTrue: [^self].
	symbols add: aSmaCCSymbol.
	self changed
]

{ #category : #accessing }
SmaCCSymbolSet >> addAll: aCollection [ 
	| oldSize |
	oldSize := symbols size.
	symbols addAll: aCollection.
	oldSize ~= symbols size ifTrue: [self changed]
]

{ #category : #private }
SmaCCSymbolSet >> addComponent: each [ 
	(each = self or: [components includes: each]) ifTrue: [^self].
	components add: each.
	each addDependent: self.
	self addAll: each symbols
]

{ #category : #private }
SmaCCSymbolSet >> addComponentsFrom: aSmaCCSymbolSet [ 
	aSmaCCSymbolSet components do: [:each | self addComponent: each]
]

{ #category : #testing }
SmaCCSymbolSet >> allSatisfy: aBlock [ 
	^symbols allSatisfy: aBlock
]

{ #category : #accessing }
SmaCCSymbolSet >> baseOn: aSmaCCSymbolSet [ 
	self addComponent: aSmaCCSymbolSet.
	self addAll: aSmaCCSymbolSet symbols
]

{ #category : #private }
SmaCCSymbolSet >> components [
	^components
]

{ #category : #testing }
SmaCCSymbolSet >> includes: aSmaCCSymbol [ 
	^symbols includes: aSmaCCSymbol
]

{ #category : #'initialize-release' }
SmaCCSymbolSet >> initialize [
	symbols := Set new.
	components := Set new
]

{ #category : #accessing }
SmaCCSymbolSet >> mergeWith: aSmaCCSymbolSet [ 
	self addAll: aSmaCCSymbolSet symbols.
	self addComponentsFrom: aSmaCCSymbolSet
]

{ #category : #printing }
SmaCCSymbolSet >> printOn: aStream [ 
	symbols do: [:each | aStream nextPutAll: each printString]
		separatedBy: [aStream space]
]

{ #category : #accessing }
SmaCCSymbolSet >> size [
	^symbols size
]

{ #category : #private }
SmaCCSymbolSet >> symbols [
	^symbols
]

{ #category : #updating }
SmaCCSymbolSet >> update: aSender [
	(components includes: aSender) ifTrue: [self addAll: aSender symbols]
]
