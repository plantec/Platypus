Class {
	#name : #PlatypusExpressLikeParser,
	#superclass : #SmaCCParser,
	#category : #'Platypus-HW-parsers'
}

{ #category : #'generated-comments' }
PlatypusExpressLikeParser class >> parserDefinitionComment [

	"Source
: Char* {'1' value }
;

Char
: ""@""  { '[a-zA-Z]' }
| ""^""   { '[A-Z]' }
| ""?""   { '[a-zA-Z0-9]' }
| <character> { '1' value asString }
| <anti>  { '1' value allButFirst}
;
"
]

{ #category : #'generated-accessing' }
PlatypusExpressLikeParser class >> scannerClass [
	^PlatypusExpressLikeScanner
]

{ #category : #'generated-starting states' }
PlatypusExpressLikeParser class >> startingStateForSource [
	^1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressLikeParser >> reduceActionForChar1: nodes [ 
	^'[a-zA-Z]'
]

{ #category : #'generated-reduction actions' }
PlatypusExpressLikeParser >> reduceActionForChar2: nodes [ 
	^'[A-Z]'
]

{ #category : #'generated-reduction actions' }
PlatypusExpressLikeParser >> reduceActionForChar3: nodes [ 
	^'[a-zA-Z0-9]'
]

{ #category : #'generated-reduction actions' }
PlatypusExpressLikeParser >> reduceActionForChar4: nodes [ 
	^(nodes at: 1) value asString
]

{ #category : #'generated-reduction actions' }
PlatypusExpressLikeParser >> reduceActionForChar5: nodes [ 
	^(nodes at: 1) value allButFirst
]

{ #category : #'generated-reduction actions' }
PlatypusExpressLikeParser >> reduceActionForRepeatXXChar1: nodes [ 
	^OrderedCollection new
]

{ #category : #'generated-reduction actions' }
PlatypusExpressLikeParser >> reduceActionForRepeatXXChar2: nodes [ 
	^(nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressLikeParser >> reduceActionForSource1: nodes [ 
	^(nodes at: 1) value
]

{ #category : #'generated-tables' }
PlatypusExpressLikeParser >> reduceTable [
	^#(
#(6 1 #reduceActionForSource1:)
#(7 1 #reduceFor:)
#(8 1 #reduceActionForChar1:)
#(8 1 #reduceActionForChar2:)
#(8 1 #reduceActionForChar3:)
#(8 1 #reduceActionForChar4:)
#(8 1 #reduceActionForChar5:)
#(9 0 #reduceActionForRepeatXXChar1:)
#(9 2 #reduceActionForRepeatXXChar2:)
)
]

{ #category : #'generated-tables' }
PlatypusExpressLikeParser >> transitionTable [
	^#(
#(3 34 1 34 2 34 3 34 4 34 5 9 6 13 9 34 10)
#(2 0 10)
#(3 17 1 21 2 25 3 29 4 33 5 37 8 6 10)
#(2 14 1 2 3 4 5 10)
#(2 18 1 2 3 4 5 10)
#(2 22 1 2 3 4 5 10)
#(2 26 1 2 3 4 5 10)
#(2 30 1 2 3 4 5 10)
#(2 38 1 2 3 4 5 10)
)
]
