Class {
	#name : #StParser,
	#superclass : #SmaCCParser,
	#category : #'SmaCCDev-Examples'
}

{ #category : #accessing }
StParser class >> parseExpression: aString [ 
	^self simplifyExpression: (self parse: aString
				startingAt: self startingStateForSequenceNode)
]

{ #category : #accessing }
StParser class >> parseExpression: aString onError: aBlock [ 
	^self simplifyExpression: (self 
				parse: aString
				startingAt: self startingStateForSequenceNode
				onError: aBlock)
]

{ #category : #accessing }
StParser class >> parseMethod: aString [ 
	^self parse: aString startingAt: self startingStateForMethod
]

{ #category : #accessing }
StParser class >> parseMethod: aString onError: aBlock [ 
	^self 
		parse: aString
		startingAt: self startingStateForMethod
		onError: aBlock
]

{ #category : #'generated-comments' }
StParser class >> parserDefinitionComment [

	"%id <number> <negativeNumber> <name> <binarySymbol>;
%start SequenceNode ;

Method:
	  <name> MethodSequenceNode {(RBMethodNode selector: '1' value asSymbol arguments: #() body: '2' last)}
	| BinaryMethodName MethodSequenceNode {(RBMethodNode selector: '1' first arguments: '1' last body: '2' last)}
	| KeywordMethodName MethodSequenceNode {(RBMethodNode selector: '1' first contents asSymbol arguments: '1' last body: '2' last)};

BinaryMethodName:
	<binarySymbol> Variable {Array with: '1' value asSymbol with: (Array with: '2')} ;

KeywordMethodName:
	<keyword> Variable {| stream | stream := WriteStream on: (String new: 30). stream nextPutAll: '1' value. Array with: stream with: (OrderedCollection with: '2')}
	| KeywordMethodName <keyword> Variable {'1' first nextPutAll: '2' value. '1' last add: '3'. '1'};

Primitives:
	{OrderedCollection new}
	| Primitives ""<"" PrimitiveMessageSend "">"" {'1' add: ('2' startPosition to: '4' startPosition); yourself};

PrimitiveMessageSend:
	| PrimitiveMessageSend <keyword> {nil}
	| PrimitiveMessageSend Literal {nil}
	| PrimitiveMessageSend ""("" {nil}
	| PrimitiveMessageSend "")"" {nil}
	| PrimitiveMessageSend ""{"" {nil}
	| PrimitiveMessageSend ""}"" {nil}
	| PrimitiveMessageSend "";"" {nil}
	| PrimitiveMessageSend ""."" {nil}
	| PrimitiveMessageSend <name> {nil}
	| PrimitiveMessageSend <binarySymbol> {nil};

MethodSequenceNode:
	Primitives ""|"" TemporaryVariables ""|"" Primitives Statements {Array with: ('1' addAll: '5'; yourself) with: (RBSequenceNode temporaries: '3' statements: '6')}
	| Primitives ""||"" Primitives Statements {Array with: ('1' addAll: '3'; yourself) with: (RBSequenceNode temporaries: #() statements: '4')}
	| Primitives Statements {Array with: '1' with: (RBSequenceNode temporaries: #() statements: '2')};

SequenceNode:
	Temporaries Statements {RBSequenceNode temporaries: '1' statements: '2'};

Temporaries:
	{#()}
	| ""||"" {#()}
	| ""|"" TemporaryVariables ""|"" {'2'};

TemporaryVariables:
	{OrderedCollection new}
	| TemporaryVariables Variable {'1' add: '2'; yourself};

Statements:
	{OrderedCollection new}
	| StatementList "".""? {#liftFirstValue:}
	| StatementList ""."" ""^"" Expression "".""? {'1' add: (RBReturnNode value: '4'); yourself}
	| ""^"" Expression "".""? {OrderedCollection with: (RBReturnNode value: '2')};

StatementList:
	Expression
	| StatementList ""."" Expression {'1' add: '3'; yourself};

Block:
	""["" BlockArgs ""|"" SequenceNode ""]"" {RBBlockNode arguments: '2' body: '4'}
	| ""["" SequenceNode ""]"" {RBBlockNode body: '2'}
	| ""["" BlockArgs ""]"" {RBBlockNode arguments: '2' body: (RBSequenceNode statements: #())}
	| ""["" BlockArgs ""||"" TemporaryVariables ""|"" Statements ""]"" {RBBlockNode arguments: '2' body: (RBSequenceNode temporaries: '4' statements: '6')};

BlockArgs:
	"":"" Variable {OrderedCollection with: '2'}
	| BlockArgs "":"" Variable {'1' add: '3'; yourself};


Expression:
	Variable "":="" Expression {RBAssignmentNode variable: '1' value: '3'}
|	Cascade {#liftFirstValue:};

Cascade:
	MessageSend CascadeList 
				{| messages |
				'2' isEmpty ifTrue: [^'1'].
				messages := OrderedCollection new: '2' size + 1.
				messages add: '1'.
				'2' do: [:each | messages add: (RBMessageNode receiver: '1' receiver selector: each first contents asSymbol arguments: each last)].
				RBCascadeNode messages: messages}
|	Primary {#liftFirstValue:};

MessageSend:
	KeywordMessageSend {#liftFirstValue:}
|	BinaryMessageSend {#liftFirstValue:}
|	UnaryMessageSend {#liftFirstValue:};

CascadeList:
	{OrderedCollection new}
|	CascadeList "";"" SimpleMessage {'1' add: '3'; yourself};

SimpleMessage:
	UnaryMessage {#liftFirstValue:}
|	BinaryMessage {#liftFirstValue:}
|	KeywordMessage {#liftFirstValue:};

KeywordMessageSend:
	BinaryMessageSend KeywordMessage {#createMessageNodeFrom:}
|	UnaryMessageSend KeywordMessage {#createMessageNodeFrom:}
|	Primary KeywordMessage {#createMessageNodeFrom:};

KeywordMessage:
	<keyword> KeywordArgument {| stream | stream := WriteStream on: (String new: 30). stream nextPutAll: '1' value. Array with: stream with: (OrderedCollection with: '2')}
|	KeywordMessage <keyword> KeywordArgument {'1' first nextPutAll: '2' value. '1' last add: '3'. '1'};

KeywordArgument:
	BinaryMessageSend {#liftFirstValue:}
|	UnaryMessageSend {#liftFirstValue:}
|	Primary {#liftFirstValue:};

BinaryMessageSend:
	BinaryMessageSend BinaryMessage {#createMessageNodeFrom:}
|	UnaryMessageSend BinaryMessage {#createMessageNodeFrom:}
|	Primary BinaryMessage {#createMessageNodeFrom:} ;

BinaryMessage :
	<binarySymbol> BinaryArgument {Array with: (ReadStream on: '1' value) with: (Array with: '2')};

BinaryArgument:
	UnaryMessageSend {#liftFirstValue:}
|	Primary {#liftFirstValue:};

UnaryMessageSend :
	UnaryMessageSend UnaryMessage {#createMessageNodeFrom:}
|	Primary UnaryMessage {#createMessageNodeFrom:};

UnaryMessage :
	<name> {Array with: (ReadStream on: '1' value) with: #()};


Primary: 
	""("" Expression "")"" {#liftSecondValue:}
|	Literal {RBLiteralNode value: '1'}
|	Variable {#liftFirstValue:}
|	Block {#liftFirstValue:};

Variable: 
	<name> {RBVariableNode named: '1' value}
|	<dottedName> {RBVariableNode named: '1' value};

Literal:
	""true"" {true}
|	""false"" {false}
|	""nil"" {nil}
|	<number> {'1' value}
|	<negativeNumber> {'1' value}
|	<character> {'1' value at: 2}
|	<string> {('1' value copyFrom: 2 to: '1' value size - 1) copyReplaceAll: '''''' with: ''''}
|	 ""#"" <string> {(('2' value copyFrom: 2 to: '2' value size - 1) copyReplaceAll: '''''' with: '''') asSymbol}
|	""#"" <name> {'2' value asSymbol}
|	""#"" <binarySymbol> {'2' value asSymbol}
|	""#"" <keyword> {'2' value asSymbol}
|	""#"" <multikeyword> {'2' value asSymbol}
|	""#"" ""["" ByteArray ""]"" {'3' contents}
|	""#"" ""("" Array "")"" {'3' contents}
|	""#"" ""{"" <name> ""}"" {'3' value asQualifiedReference}
|	""#"" ""{"" <dottedName> ""}"" {'3' value asQualifiedReference};

ByteArray: 
	{WriteStream on: ByteArray new}
|	ByteArray <number> {'1' nextPut: '2' value; yourself};

Array: 
	{WriteStream on: Array new}
|	Array ArrayLiteral {'1' nextPut: '2'; yourself} 
|	Array <name> "":="" {'2' stopPosition + 1 = '3' startPosition ifTrue: ['1' nextPut: ('2' value, ':') asSymbol] ifFalse: ['1' nextPut: '2' value asSymbol; nextPut: #':']. scanner position: '3' startPosition. currentToken := nil. '1'};

ArrayLiteral:
	Literal {#liftFirstValue:}
|	<name> {'1' value asSymbol}
|	<binarySymbol> {'1' value asSymbol}
|	<keyword> {'1' value asSymbol}
|	<multikeyword> {'1' value asSymbol}
|	""{"" <name> ""}"" {'2' value asQualifiedReference}
|	""{"" <dottedName> ""}"" {'2' value asQualifiedReference}
|	""("" Array "")"" {'2' contents}
|	""["" ByteArray ""]"" {'2' contents}
|	<anyChar> {'1' value asSymbol}
|	<dottedName> {'1' value};"
]

{ #category : #'generated-accessing' }
StParser class >> scannerClass [
	^StScanner
]

{ #category : #private }
StParser class >> simplifyExpression: aSequenceNode [ 
	^aSequenceNode isNil
		ifFalse: [ 
	
	(aSequenceNode statements size == 1 
		and: [aSequenceNode temporaries isEmpty]) 
			ifTrue: [aSequenceNode statements first]
			ifFalse: [aSequenceNode] ]
]

{ #category : #'generated-starting states' }
StParser class >> startingStateForMethod [
	^1
]

{ #category : #'generated-starting states' }
StParser class >> startingStateForSequenceNode [
	^2
]

{ #category : #private }
StParser >> actionForCurrentToken [
	| ids action |
	ids := currentToken id.
	1 to: ids size
		do: 
			[:i | 
			action := self actionFor: (ids at: i).
			(action bitAnd: self actionMask) = self errorAction ifFalse: [^action].
			(ids at: i) = scanner negativeNumberId 
				ifTrue: 
					[currentToken := SmaCCToken 
								value: '-'
								start: currentToken startPosition
								id: (Array with: scanner binarySymbolId).
					scanner position: currentToken stopPosition - 1.
					^self actionForCurrentToken]].
	^self errorAction
]

{ #category : #private }
StParser >> createMessageNodeFrom: aCollection [ 
	^RBMessageNode 
		receiver: aCollection first
		selector: (aCollection at: 2) first contents asSymbol
		arguments: (aCollection at: 2) last
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArray1: nodes [
	^ WriteStream on: Array new
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArray2: nodes [
	^ (nodes at: 1)
		nextPut: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArray3: nodes [
	(nodes at: 2) stopPosition + 1 = (nodes at: 3) startPosition
		ifTrue: [ (nodes at: 1) nextPut: ((nodes at: 2) value , ':') asSymbol ]
		ifFalse: [ 
			(nodes at: 1)
				nextPut: (nodes at: 2) value asSymbol;
				nextPut: #':' ].
	scanner position: (nodes at: 3) startPosition.
	currentToken := nil.
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral10: nodes [
	^ (nodes at: 1) value asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral11: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral2: nodes [
	^ (nodes at: 1) value asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral3: nodes [
	^ (nodes at: 1) value asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral4: nodes [
	^ (nodes at: 1) value asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral5: nodes [
	^ (nodes at: 1) value asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral6: nodes [
	^ (nodes at: 2) value asQualifiedReference
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral7: nodes [
	^ (nodes at: 2) value asQualifiedReference
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral8: nodes [
	^ (nodes at: 2) contents
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral9: nodes [
	^ (nodes at: 2) contents
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBinaryMessage1: nodes [
	^ Array with: (ReadStream on: (nodes at: 1) value) with: (Array with: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBinaryMethodName1: nodes [
	^ Array with: (nodes at: 1) value asSymbol with: (Array with: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBlock1: nodes [
	^ RBBlockNode arguments: (nodes at: 2) body: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBlock2: nodes [
	^ RBBlockNode body: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBlock3: nodes [
	^ RBBlockNode arguments: (nodes at: 2) body: (RBSequenceNode statements: #())
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBlock4: nodes [
	^ RBBlockNode arguments: (nodes at: 2) body: (RBSequenceNode temporaries: (nodes at: 4) statements: (nodes at: 6))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBlockArgs1: nodes [
	^ OrderedCollection with: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBlockArgs2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 3);
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForByteArray1: nodes [
	^ WriteStream on: ByteArray new
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForByteArray2: nodes [
	^ (nodes at: 1)
		nextPut: (nodes at: 2) value;
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForCascade1: nodes [
	| messages |
	(nodes at: 2) isEmpty
		ifTrue: [ ^ nodes at: 1 ].
	messages := OrderedCollection new: (nodes at: 2) size + 1.
	messages add: (nodes at: 1).
	(nodes at: 2)
		do: [ :each | 
			messages
				add: (RBMessageNode receiver: (nodes at: 1) receiver selector: each first contents asSymbol arguments: each last) ].
	^ RBCascadeNode messages: messages
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForCascadeList1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForCascadeList2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 3);
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForExpression1: nodes [
	^ RBAssignmentNode variable: (nodes at: 1) value: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForKeywordMessage1: nodes [
	| stream |
	stream := WriteStream on: (String new: 30).
	stream nextPutAll: (nodes at: 1) value.
	^ Array with: stream with: (OrderedCollection with: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForKeywordMessage2: nodes [
	(nodes at: 1) first nextPutAll: (nodes at: 2) value.
	(nodes at: 1) last add: (nodes at: 3).
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForKeywordMethodName1: nodes [
	| stream |
	stream := WriteStream on: (String new: 30).
	stream nextPutAll: (nodes at: 1) value.
	^ Array with: stream with: (OrderedCollection with: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForKeywordMethodName2: nodes [
	(nodes at: 1) first nextPutAll: (nodes at: 2) value.
	(nodes at: 1) last add: (nodes at: 3).
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral10: nodes [
	^ (nodes at: 2) value asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral11: nodes [
	^ (nodes at: 2) value asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral12: nodes [
	^ (nodes at: 2) value asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral13: nodes [
	^ (nodes at: 3) contents
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral14: nodes [
	^ (nodes at: 3) contents
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral15: nodes [
	^ (nodes at: 3) value asQualifiedReference
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral16: nodes [
	^ (nodes at: 3) value asQualifiedReference
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral1: nodes [
	^ true
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral2: nodes [
	^ false
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral3: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral4: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral5: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral6: nodes [
	^ (nodes at: 1) value at: 2
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral7: nodes [
	^ ((nodes at: 1) value copyFrom: 2 to: (nodes at: 1) value size - 1) copyReplaceAll: '''''' with: ''''
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral8: nodes [
	^ (((nodes at: 2) value copyFrom: 2 to: (nodes at: 2) value size - 1) copyReplaceAll: '''''' with: '''') asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral9: nodes [
	^ (nodes at: 2) value asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForMethod1: nodes [
	^ RBMethodNode selector: (nodes at: 1) value asSymbol arguments: #() body: (nodes at: 2) last
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForMethod2: nodes [
	^ RBMethodNode selector: (nodes at: 1) first arguments: (nodes at: 1) last body: (nodes at: 2) last
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForMethod3: nodes [
	^ RBMethodNode selector: (nodes at: 1) first contents asSymbol arguments: (nodes at: 1) last body: (nodes at: 2) last
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForMethodSequenceNode1: nodes [
	^ Array
		with:
			((nodes at: 1)
				addAll: (nodes at: 5);
				yourself)
		with: (RBSequenceNode temporaries: (nodes at: 3) statements: (nodes at: 6))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForMethodSequenceNode2: nodes [
	^ Array
		with:
			((nodes at: 1)
				addAll: (nodes at: 3);
				yourself)
		with: (RBSequenceNode temporaries: #() statements: (nodes at: 4))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForMethodSequenceNode3: nodes [
	^ Array with: (nodes at: 1) with: (RBSequenceNode temporaries: #() statements: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForOptionalXXXXX1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForOptionalXXXXX2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimary2: nodes [
	^ RBLiteralNode value: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitiveMessageSend10: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitiveMessageSend11: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitiveMessageSend2: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitiveMessageSend3: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitiveMessageSend4: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitiveMessageSend5: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitiveMessageSend6: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitiveMessageSend7: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitiveMessageSend8: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitiveMessageSend9: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitives1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitives2: nodes [
	^ (nodes at: 1)
		add: ((nodes at: 2) startPosition to: (nodes at: 4) startPosition);
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForSequenceNode1: nodes [
	^ RBSequenceNode temporaries: (nodes at: 1) statements: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForStatementList2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 3);
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForStatements1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForStatements3: nodes [
	^ (nodes at: 1)
		add: (RBReturnNode value: (nodes at: 4));
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForStatements4: nodes [
	^ OrderedCollection with: (RBReturnNode value: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForTemporaries1: nodes [
	^ #()
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForTemporaries2: nodes [
	^ #()
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForTemporaries3: nodes [
	^ nodes at: 2
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForTemporaryVariables1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForTemporaryVariables2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForUnaryMessage1: nodes [
	^ Array with: (ReadStream on: (nodes at: 1) value) with: #()
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForVariable1: nodes [
	^ RBVariableNode named: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForVariable2: nodes [
	^ RBVariableNode named: (nodes at: 1) value
]

{ #category : #'generated-tables' }
StParser >> reduceTable [
	^#(
#(33 0 #reduceFor:)
#(33 2 #reduceActionForPrimitiveMessageSend2:)
#(33 2 #reduceActionForPrimitiveMessageSend3:)
#(33 2 #reduceActionForPrimitiveMessageSend4:)
#(33 2 #reduceActionForPrimitiveMessageSend5:)
#(33 2 #reduceActionForPrimitiveMessageSend6:)
#(33 2 #reduceActionForPrimitiveMessageSend7:)
#(33 2 #reduceActionForPrimitiveMessageSend8:)
#(33 2 #reduceActionForPrimitiveMessageSend9:)
#(33 2 #reduceActionForPrimitiveMessageSend10:)
#(33 2 #reduceActionForPrimitiveMessageSend11:)
#(34 2 #reduceActionForKeywordMethodName1:)
#(34 3 #reduceActionForKeywordMethodName2:)
#(35 0 #reduceActionForTemporaryVariables1:)
#(35 2 #reduceActionForTemporaryVariables2:)
#(36 0 #reduceActionForStatements1:)
#(36 2 #liftFirstValue:)
#(36 5 #reduceActionForStatements3:)
#(36 3 #reduceActionForStatements4:)
#(37 0 #reduceActionForTemporaries1:)
#(37 1 #reduceActionForTemporaries2:)
#(37 3 #reduceActionForTemporaries3:)
#(38 1 #reduceFor:)
#(38 3 #reduceActionForStatementList2:)
#(39 0 #reduceActionForOptionalXXXXX1:)
#(39 1 #reduceActionForOptionalXXXXX2:)
#(40 3 #reduceActionForExpression1:)
#(40 1 #liftFirstValue:)
#(41 2 #reduceActionForBlockArgs1:)
#(41 3 #reduceActionForBlockArgs2:)
#(42 5 #reduceActionForBlock1:)
#(42 3 #reduceActionForBlock2:)
#(42 3 #reduceActionForBlock3:)
#(42 7 #reduceActionForBlock4:)
#(43 2 #reduceActionForCascade1:)
#(43 1 #liftFirstValue:)
#(44 1 #liftFirstValue:)
#(44 1 #liftFirstValue:)
#(44 1 #liftFirstValue:)
#(45 0 #reduceActionForCascadeList1:)
#(45 3 #reduceActionForCascadeList2:)
#(46 0 #reduceActionForPrimitives1:)
#(46 4 #reduceActionForPrimitives2:)
#(47 2 #createMessageNodeFrom:)
#(47 2 #createMessageNodeFrom:)
#(47 2 #createMessageNodeFrom:)
#(48 2 #createMessageNodeFrom:)
#(48 2 #createMessageNodeFrom:)
#(48 2 #createMessageNodeFrom:)
#(49 2 #createMessageNodeFrom:)
#(49 2 #createMessageNodeFrom:)
#(50 1 #liftFirstValue:)
#(50 1 #liftFirstValue:)
#(50 1 #liftFirstValue:)
#(51 1 #reduceActionForUnaryMessage1:)
#(52 2 #reduceActionForBinaryMessage1:)
#(53 2 #reduceActionForKeywordMessage1:)
#(53 3 #reduceActionForKeywordMessage2:)
#(54 1 #liftFirstValue:)
#(54 1 #liftFirstValue:)
#(54 1 #liftFirstValue:)
#(55 1 #liftFirstValue:)
#(55 1 #liftFirstValue:)
#(56 2 #reduceActionForMethod1:)
#(56 2 #reduceActionForMethod2:)
#(56 2 #reduceActionForMethod3:)
#(57 1 #reduceActionForVariable1:)
#(57 1 #reduceActionForVariable2:)
#(58 2 #reduceActionForBinaryMethodName1:)
#(59 6 #reduceActionForMethodSequenceNode1:)
#(59 4 #reduceActionForMethodSequenceNode2:)
#(59 2 #reduceActionForMethodSequenceNode3:)
#(60 0 #reduceActionForByteArray1:)
#(60 2 #reduceActionForByteArray2:)
#(61 0 #reduceActionForArray1:)
#(61 2 #reduceActionForArray2:)
#(61 3 #reduceActionForArray3:)
#(62 1 #liftFirstValue:)
#(62 1 #reduceActionForArrayLiteral2:)
#(62 1 #reduceActionForArrayLiteral3:)
#(62 1 #reduceActionForArrayLiteral4:)
#(62 1 #reduceActionForArrayLiteral5:)
#(62 3 #reduceActionForArrayLiteral6:)
#(62 3 #reduceActionForArrayLiteral7:)
#(62 3 #reduceActionForArrayLiteral8:)
#(62 3 #reduceActionForArrayLiteral9:)
#(62 1 #reduceActionForArrayLiteral10:)
#(62 1 #reduceActionForArrayLiteral11:)
#(63 3 #liftSecondValue:)
#(63 1 #reduceActionForPrimary2:)
#(63 1 #liftFirstValue:)
#(63 1 #liftFirstValue:)
#(66 2 #reduceActionForSequenceNode1:)
#(67 1 #reduceFor:)
#(68 1 #reduceActionForLiteral1:)
#(68 1 #reduceActionForLiteral2:)
#(68 1 #reduceActionForLiteral3:)
#(68 1 #reduceActionForLiteral4:)
#(68 1 #reduceActionForLiteral5:)
#(68 1 #reduceActionForLiteral6:)
#(68 1 #reduceActionForLiteral7:)
#(68 2 #reduceActionForLiteral8:)
#(68 2 #reduceActionForLiteral9:)
#(68 2 #reduceActionForLiteral10:)
#(68 2 #reduceActionForLiteral11:)
#(68 2 #reduceActionForLiteral12:)
#(68 4 #reduceActionForLiteral13:)
#(68 4 #reduceActionForLiteral14:)
#(68 4 #reduceActionForLiteral15:)
#(68 4 #reduceActionForLiteral16:)
)
]

{ #category : #'generated-tables' }
StParser >> transitionTable [
	^#(
#[1 0 13 0 20 0 17 0 24 0 21 0 26 0 25 0 34 0 29 0 56 0 33 0 58]
#[1 0 82 0 1 0 37 0 9 0 82 0 10 0 82 0 11 0 82 0 12 0 82 0 14 0 41 0 15 0 82 0 16 0 82 0 17 0 82 0 20 0 82 0 21 0 82 0 22 0 82 0 23 0 82 0 29 0 82 0 30 0 45 0 37 0 82 0 64 0 49 0 66]
#[1 0 170 0 1 0 170 0 6 0 170 0 9 0 170 0 10 0 170 0 11 0 170 0 12 0 170 0 14 0 170 0 15 0 170 0 16 0 170 0 17 0 170 0 20 0 170 0 21 0 170 0 22 0 170 0 23 0 170 0 29 0 170 0 30 0 53 0 46 0 57 0 59 0 170 0 64]
#[1 0 61 0 20 0 65 0 29 0 69 0 57]
#[1 0 61 0 20 0 65 0 29 0 73 0 57]
#[1 0 170 0 1 0 170 0 6 0 170 0 9 0 170 0 10 0 170 0 11 0 170 0 12 0 170 0 14 0 170 0 15 0 170 0 16 0 170 0 17 0 170 0 20 0 170 0 21 0 170 0 22 0 170 0 23 0 77 0 24 0 170 0 29 0 170 0 30 0 53 0 46 0 81 0 59 0 170 0 64]
#[0 0 0 0 64]
#[1 0 170 0 1 0 170 0 6 0 170 0 9 0 170 0 10 0 170 0 11 0 170 0 12 0 170 0 14 0 170 0 15 0 170 0 16 0 170 0 17 0 170 0 20 0 170 0 21 0 170 0 22 0 170 0 23 0 170 0 29 0 170 0 30 0 53 0 46 0 85 0 59 0 170 0 64]
#[1 0 58 0 9 0 58 0 20 0 58 0 29 0 89 0 35]
#[0 0 86 0 1 0 10 0 11 0 12 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 29 0 30 0 64]
#[1 0 93 0 1 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 0 113 0 16 0 117 0 17 0 66 0 19 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 137 0 36 0 141 0 38 0 145 0 40 0 149 0 42 0 153 0 43 0 157 0 44 0 161 0 47 0 165 0 48 0 169 0 49 0 173 0 57 0 177 0 63 0 66 0 64 0 181 0 68]
#[0 0 0 0 64]
#[1 0 93 0 1 0 185 0 6 0 189 0 9 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 0 193 0 15 0 113 0 16 0 117 0 17 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 197 0 36 0 141 0 38 0 145 0 40 0 149 0 42 0 153 0 43 0 157 0 44 0 161 0 47 0 165 0 48 0 169 0 49 0 173 0 57 0 177 0 63 0 66 0 64 0 181 0 68]
#[0 1 2 0 64]
#[0 1 14 0 1 0 2 0 4 0 5 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 26 0 29 0 30 0 64]
#[0 1 18 0 1 0 2 0 4 0 5 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 26 0 29 0 30 0 64]
#[0 0 50 0 1 0 6 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 29 0 30 0 64]
#[0 1 22 0 1 0 6 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 29 0 30 0 64]
#[1 0 61 0 20 0 65 0 29 0 201 0 57]
#[0 1 10 0 64]
#[0 1 6 0 64]
#[1 0 205 0 9 0 61 0 20 0 65 0 29 0 209 0 57]
#[1 0 213 0 3 0 217 0 10 0 221 0 17 0 225 0 20 0 229 0 23 0 233 0 24 0 237 0 25 0 241 0 26]
#[1 0 93 0 1 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 0 117 0 17 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 245 0 40 0 149 0 42 0 153 0 43 0 157 0 44 0 161 0 47 0 165 0 48 0 169 0 49 0 173 0 57 0 177 0 63 0 181 0 68]
#[0 1 126 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 130 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 134 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[1 0 93 0 1 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 0 117 0 17 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 249 0 40 0 149 0 42 0 153 0 43 0 157 0 44 0 161 0 47 0 165 0 48 0 169 0 49 0 173 0 57 0 177 0 63 0 181 0 68]
#[1 0 82 0 1 0 37 0 9 0 82 0 10 0 82 0 11 0 82 0 12 0 82 0 14 0 41 0 15 0 82 0 16 0 82 0 17 0 253 0 18 0 82 0 19 0 82 0 20 0 82 0 21 0 82 0 22 0 82 0 23 0 82 0 29 0 82 0 30 0 45 0 37 1 1 0 41 1 5 0 66]
#[0 1 138 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 142 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 150 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 146 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 118 0 19 0 64]
#[1 1 9 0 5 0 102 0 19 1 13 0 39 0 102 0 64]
#[0 0 94 0 5 0 19 0 64]
#[0 1 114 0 2 0 4 0 5 0 19 0 20 0 24 0 26 0 64]
#[0 0 114 0 4 0 5 0 19 0 64]
#[1 0 162 0 2 0 162 0 4 0 162 0 5 0 162 0 19 1 17 0 45 0 162 0 64]
#[0 0 150 0 2 0 4 0 5 0 19 0 64]
#[1 0 154 0 2 0 154 0 4 0 154 0 5 0 154 0 19 1 21 0 24 1 25 0 26 1 29 0 52 1 33 0 53 0 154 0 64]
#[1 0 158 0 2 0 158 0 4 0 158 0 5 0 158 0 19 1 37 0 20 1 21 0 24 1 25 0 26 1 41 0 51 1 45 0 52 1 49 0 53 0 158 0 64]
#[1 1 110 0 4 1 110 0 5 1 53 0 13 1 110 0 19 1 110 0 20 1 110 0 24 1 110 0 26 1 110 0 64]
#[1 0 146 0 4 0 146 0 5 0 146 0 19 1 37 0 20 1 21 0 24 1 25 0 26 1 57 0 51 1 61 0 52 1 65 0 53 0 146 0 64]
#[0 1 106 0 2 0 4 0 5 0 19 0 20 0 24 0 26 0 64]
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 7 0 6 0 8 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 14 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 24 0 6 0 26 0 6 0 30 1 69 0 33]
#[1 0 58 0 9 0 58 0 20 0 58 0 29 1 73 0 35]
#[1 0 170 0 1 0 170 0 6 0 170 0 10 0 170 0 11 0 170 0 12 0 170 0 14 0 170 0 16 0 170 0 17 0 170 0 20 0 170 0 21 0 170 0 22 0 170 0 23 0 170 0 29 0 170 0 30 1 77 0 46 0 170 0 64]
#[0 1 34 0 64]
#[0 0 54 0 1 0 6 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 29 0 30 0 64]
#[0 0 90 0 1 0 10 0 11 0 12 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 29 0 30 0 64]
#[0 0 62 0 9 0 20 0 29]
#[1 1 81 0 20 1 85 0 29]
#[1 1 46 0 1 1 46 0 3 1 46 0 4 1 46 0 10 1 46 0 11 1 46 0 12 1 46 0 14 1 46 0 17 1 46 0 20 1 46 0 21 1 46 0 22 1 46 0 23 1 46 0 24 1 46 0 25 1 46 0 26 1 46 0 29 1 46 0 30 1 46 0 32 1 89 0 61]
#[1 1 38 0 19 1 38 0 21 1 93 0 60]
#[0 1 158 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 154 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 166 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 170 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 162 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 97 0 4]
#[1 1 101 0 5 0 102 0 19 1 105 0 39 0 102 0 64]
#[1 0 61 0 20 0 65 0 29 1 109 0 57]
#[1 1 113 0 9 1 117 0 15 1 121 0 18 1 125 0 19]
#[0 1 129 0 19]
#[1 0 93 0 1 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 1 133 0 16 0 117 0 17 0 106 0 19 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 1 137 0 40 0 149 0 42 0 153 0 43 0 157 0 44 0 161 0 47 0 165 0 48 0 169 0 49 0 173 0 57 0 177 0 63 0 106 0 64 0 181 0 68]
#[0 0 70 0 19 0 64]
#[1 1 141 0 2 0 142 0 4 0 142 0 5 0 142 0 19 0 142 0 64]
#[1 0 93 0 1 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 0 117 0 17 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 149 0 42 1 145 0 48 1 149 0 49 1 153 0 54 1 157 0 57 1 161 0 63 0 181 0 68]
#[1 0 93 0 1 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 0 117 0 17 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 149 0 42 1 165 0 49 1 169 0 55 1 157 0 57 1 173 0 63 0 181 0 68]
#[0 0 190 0 2 0 4 0 5 0 19 0 24 0 26 0 64]
#[1 0 178 0 2 0 178 0 4 0 178 0 5 0 178 0 19 1 177 0 24 0 178 0 64]
#[0 0 222 0 2 0 4 0 5 0 19 0 20 0 24 0 26 0 64]
#[0 0 202 0 2 0 4 0 5 0 19 0 20 0 24 0 26 0 64]
#[0 0 194 0 2 0 4 0 5 0 19 0 24 0 26 0 64]
#[1 0 182 0 2 0 182 0 4 0 182 0 5 0 182 0 19 1 177 0 24 0 182 0 64]
#[1 0 93 0 1 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 0 117 0 17 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 1 181 0 40 0 149 0 42 0 153 0 43 0 157 0 44 0 161 0 47 0 165 0 48 0 169 0 49 0 173 0 57 0 177 0 63 0 181 0 68]
#[0 0 206 0 2 0 4 0 5 0 19 0 20 0 24 0 26 0 64]
#[0 0 198 0 2 0 4 0 5 0 19 0 24 0 26 0 64]
#[1 0 186 0 2 0 186 0 4 0 186 0 5 0 186 0 19 1 177 0 24 0 186 0 64]
#[1 0 93 0 1 1 185 0 2 1 189 0 3 1 193 0 4 1 197 0 5 1 201 0 7 1 205 0 8 1 209 0 10 0 101 0 11 0 105 0 12 0 109 0 14 1 213 0 20 0 121 0 21 0 125 0 22 0 129 0 23 1 217 0 24 1 221 0 26 0 133 0 30 1 225 0 68]
#[1 1 229 0 9 0 61 0 20 0 65 0 29 0 209 0 57]
#[1 0 93 0 1 0 185 0 6 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 0 113 0 16 0 117 0 17 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 1 233 0 36 0 141 0 38 0 145 0 40 0 149 0 42 0 153 0 43 0 157 0 44 0 161 0 47 0 165 0 48 0 169 0 49 0 173 0 57 0 177 0 63 0 66 0 64 0 181 0 68]
#[0 1 237 0 8]
#[0 1 241 0 8]
#[1 0 93 0 1 1 245 0 3 1 249 0 4 1 253 0 10 0 101 0 11 0 105 0 12 0 109 0 14 2 1 0 17 2 5 0 20 0 121 0 21 0 125 0 22 0 129 0 23 2 9 0 24 2 13 0 25 2 17 0 26 2 21 0 29 0 133 0 30 2 25 0 32 2 29 0 62 2 33 0 68]
#[1 2 37 0 19 2 41 0 21]
#[0 1 102 0 2 0 4 0 5 0 19 0 20 0 24 0 26 0 64]
#[0 0 106 0 19 0 64]
#[0 0 78 0 19 0 64]
#[0 0 118 0 9 0 15 0 18 0 19]
#[1 0 82 0 1 0 37 0 9 0 82 0 10 0 82 0 11 0 82 0 12 0 82 0 14 0 41 0 15 0 82 0 16 0 82 0 17 0 82 0 19 0 82 0 20 0 82 0 21 0 82 0 22 0 82 0 23 0 82 0 29 0 82 0 30 0 45 0 37 2 45 0 66]
#[1 0 58 0 9 0 58 0 20 0 58 0 29 2 49 0 35]
#[1 0 61 0 20 0 65 0 29 2 53 0 57]
#[0 0 134 0 2 0 4 0 5 0 19 0 20 0 24 0 26 0 64]
#[0 0 130 0 2 0 4 0 5 0 19 0 20 0 24 0 26 0 64]
#[1 0 93 0 1 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 0 117 0 17 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 2 57 0 40 0 149 0 42 0 153 0 43 0 157 0 44 0 161 0 47 0 165 0 48 0 169 0 49 0 173 0 57 0 177 0 63 0 181 0 68]
#[0 0 98 0 5 0 19 0 64]
#[1 1 37 0 20 1 21 0 24 1 25 0 26 2 61 0 50 2 65 0 51 2 69 0 52 2 73 0 53]
#[1 0 238 0 2 0 238 0 4 0 238 0 5 0 238 0 19 0 238 0 24 1 25 0 26 1 29 0 52 0 238 0 64]
#[1 0 242 0 2 0 242 0 4 0 242 0 5 0 242 0 19 1 37 0 20 0 242 0 24 1 25 0 26 1 41 0 51 1 45 0 52 0 242 0 64]
#[0 0 230 0 2 0 4 0 5 0 19 0 24 0 64]
#[0 1 110 0 2 0 4 0 5 0 19 0 20 0 24 0 26 0 64]
#[1 0 246 0 2 0 246 0 4 0 246 0 5 0 246 0 19 1 37 0 20 0 246 0 24 1 25 0 26 1 57 0 51 1 61 0 52 0 246 0 64]
#[1 0 250 0 2 0 250 0 4 0 250 0 5 0 250 0 19 1 37 0 20 0 250 0 24 0 250 0 26 1 41 0 51 0 250 0 64]
#[0 0 226 0 2 0 4 0 5 0 19 0 24 0 26 0 64]
#[1 0 254 0 2 0 254 0 4 0 254 0 5 0 254 0 19 1 37 0 20 0 254 0 24 0 254 0 26 1 57 0 51 0 254 0 64]
#[1 0 93 0 1 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 0 117 0 17 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 149 0 42 1 145 0 48 1 149 0 49 2 77 0 54 1 157 0 57 1 161 0 63 0 181 0 68]
#[0 0 110 0 4 0 5 0 19 0 64]
#[0 0 34 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 20 0 21 0 22 0 23 0 24 0 26 0 30]
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 20 0 21 0 22 0 23 0 24 0 26 0 30]
#[0 0 22 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 20 0 21 0 22 0 23 0 24 0 26 0 30]
#[0 0 38 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 20 0 21 0 22 0 23 0 24 0 26 0 30]
#[0 0 174 0 1 0 6 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 29 0 30 0 64]
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 20 0 21 0 22 0 23 0 24 0 26 0 30]
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 20 0 21 0 22 0 23 0 24 0 26 0 30]
#[0 0 42 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 20 0 21 0 22 0 23 0 24 0 26 0 30]
#[0 0 10 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 20 0 21 0 22 0 23 0 24 0 26 0 30]
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 20 0 21 0 22 0 23 0 24 0 26 0 30]
#[0 0 14 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 20 0 21 0 22 0 23 0 24 0 26 0 30]
#[1 0 170 0 1 0 170 0 6 0 170 0 10 0 170 0 11 0 170 0 12 0 170 0 14 0 170 0 16 0 170 0 17 0 170 0 20 0 170 0 21 0 170 0 22 0 170 0 23 0 170 0 29 0 170 0 30 2 81 0 46 0 170 0 64]
#[0 1 30 0 64]
#[0 1 182 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 186 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[1 2 85 0 20 2 89 0 29]
#[0 1 178 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[1 1 46 0 1 1 46 0 3 1 46 0 4 1 46 0 10 1 46 0 11 1 46 0 12 1 46 0 14 1 46 0 17 1 46 0 20 1 46 0 21 1 46 0 22 1 46 0 23 1 46 0 24 1 46 0 25 1 46 0 26 1 46 0 29 1 46 0 30 1 46 0 32 2 93 0 61]
#[1 1 38 0 19 1 38 0 21 2 97 0 60]
#[1 1 62 0 1 1 62 0 3 1 62 0 4 1 62 0 10 1 62 0 11 1 62 0 12 2 101 0 13 1 62 0 14 1 62 0 17 1 62 0 20 1 62 0 21 1 62 0 22 1 62 0 23 1 62 0 24 1 62 0 25 1 62 0 26 1 62 0 29 1 62 0 30 1 62 0 32]
#[0 1 70 0 1 0 3 0 4 0 10 0 11 0 12 0 14 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32]
#[0 1 74 0 1 0 3 0 4 0 10 0 11 0 12 0 14 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32]
#[0 1 66 0 1 0 3 0 4 0 10 0 11 0 12 0 14 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32]
#[0 1 98 0 1 0 3 0 4 0 10 0 11 0 12 0 14 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32]
#[0 1 94 0 1 0 3 0 4 0 10 0 11 0 12 0 14 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32]
#[0 1 50 0 1 0 3 0 4 0 10 0 11 0 12 0 14 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32]
#[0 1 58 0 1 0 3 0 4 0 10 0 11 0 12 0 14 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32]
#[0 1 174 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 12 0 14 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 64]
#[0 1 42 0 19 0 21]
#[0 2 105 0 19]
#[1 2 109 0 9 0 61 0 20 0 65 0 29 0 209 0 57]
#[0 0 122 0 9 0 15 0 18 0 19]
#[1 1 101 0 5 0 102 0 19 2 113 0 39 0 102 0 64]
#[0 0 166 0 2 0 4 0 5 0 19 0 64]
#[0 0 210 0 2 0 4 0 5 0 19 0 64]
#[0 0 214 0 2 0 4 0 5 0 19 0 64]
#[1 0 218 0 2 0 218 0 4 0 218 0 5 0 218 0 19 1 177 0 24 0 218 0 64]
#[0 0 234 0 2 0 4 0 5 0 19 0 24 0 64]
#[1 0 93 0 1 0 185 0 6 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 0 113 0 16 0 117 0 17 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 2 117 0 36 0 141 0 38 0 145 0 40 0 149 0 42 0 153 0 43 0 157 0 44 0 161 0 47 0 165 0 48 0 169 0 49 0 173 0 57 0 177 0 63 0 66 0 64 0 181 0 68]
#[0 2 121 0 8]
#[0 2 125 0 8]
#[1 0 93 0 1 1 245 0 3 2 129 0 4 1 253 0 10 0 101 0 11 0 105 0 12 0 109 0 14 2 1 0 17 2 5 0 20 0 121 0 21 0 125 0 22 0 129 0 23 2 9 0 24 2 13 0 25 2 17 0 26 2 21 0 29 0 133 0 30 2 25 0 32 2 29 0 62 2 33 0 68]
#[1 2 133 0 19 2 41 0 21]
#[0 1 54 0 1 0 3 0 4 0 10 0 11 0 12 0 14 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32]
#[0 0 126 0 2 0 4 0 5 0 19 0 20 0 24 0 26 0 64]
#[1 0 93 0 1 0 97 0 10 0 101 0 11 0 105 0 12 0 109 0 14 0 113 0 16 0 117 0 17 0 66 0 19 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 2 137 0 36 0 141 0 38 0 145 0 40 0 149 0 42 0 153 0 43 0 157 0 44 0 161 0 47 0 165 0 48 0 169 0 49 0 173 0 57 0 177 0 63 0 181 0 68]
#[0 0 74 0 19 0 64]
#[0 1 26 0 64]
#[0 1 78 0 1 0 3 0 4 0 10 0 11 0 12 0 14 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32]
#[0 1 82 0 1 0 3 0 4 0 10 0 11 0 12 0 14 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32]
#[0 1 86 0 1 0 3 0 4 0 10 0 11 0 12 0 14 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32]
#[0 1 90 0 1 0 3 0 4 0 10 0 11 0 12 0 14 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32]
#[0 2 141 0 19]
#[0 0 138 0 2 0 4 0 5 0 19 0 20 0 24 0 26 0 64]
)
]
