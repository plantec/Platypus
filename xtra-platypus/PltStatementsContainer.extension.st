Extension { #name : #PltStatementsContainer }

{ #category : #'*xtra-platypus-evaluating' }
PltStatementsContainer >> args: argsArray [ 
	| args |
	args := ''.
	argsArray
		do: [:a | args := args , a]
		separatedBy: [args := args , ','].
	^ self evaluate: '(' , args , ')'
]

{ #category : #'*xtra-platypus-evaluating' }
PltStatementsContainer >> arguments [ 
	| itemRef |
	^ (itemRef := self tamarisItemRef) ifNotNil: [itemRef interactiveCallArguments]
]

{ #category : #'*xtra-platypus-evaluating' }
PltStatementsContainer >> arguments: aString [ 
	| itemRef |
	^ (itemRef := self tamarisItemRef)
		ifNotNil: [itemRef interactiveCallArguments: aString]
]

{ #category : #'*xtra-platypus-accessing' }
PltStatementsContainer >> bindings [
	^ super bindings , self locals 
]

{ #category : #'*xtra-platypus-evaluating' }
PltStatementsContainer >> evaluate [
	| argsSql args |
	args := ''.
	self formalParameters isEmpty
		ifFalse: [argsSql := self arguments
						ifNil: [''].
			argsSql
				ifNotEmpty: [:a | argsSql := argsSql trimBoth ].
			argsSql
				ifEmpty: [self formalParameters
						do: [:fp | argsSql := argsSql , fp prettyPrintedExpressCode]
						separatedBy: [argsSql := argsSql , ' , ']].
			args := UIManager default request: 'give a value for each formal parameters' initialAnswer: argsSql.
			args isEmptyOrNil
				ifTrue: [^ nil]
				ifFalse: [args := '(' , args , ')']].
	^ self evaluate: args
]

{ #category : #'*xtra-platypus-evaluating' }
PltStatementsContainer >> evaluate: args [ 
	| call |
	Cursor wait
		showWhile: [args
				ifNotEmpty: [:a | self arguments: args trimBoth].
			call := self name , args , ';'.
			^ PlatypusExpressInterpretor new
				evaluate: call
				in: self owner
				to: nil
				notifying: nil
				ifFail: []
				logged: false]
]

{ #category : #'*xtra-platypus-evaluating' }
PltStatementsContainer >> evaluateAndExplore [
	^ self evaluateAndExplore: ''
]

{ #category : #'*xtra-platypus-evaluating' }
PltStatementsContainer >> evaluateAndExplore: args [
	^ (self evaluate: args) explore
]

{ #category : #'*xtra-platypus-evaluating' }
PltStatementsContainer >> initializeContextInInterpretor: anInterpretor [ 
	super initializeContextInInterpretor: anInterpretor.
	self locals
		do: [:lo | anInterpretor declareLocalVariable: lo].

]

{ #category : #'*xtra-platypus-data-management' }
PltStatementsContainer >> rebuildLocalCaches [
	super rebuildLocalCaches.
	self locals do: [:loc | self insertIntoCache: loc]
]
