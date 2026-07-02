"
SmaCCTokens are used as the interface objects between scanner and parser. They hold the string that was scanned and its position information. Also, included in the token is its id. The id specifies what type of token it is.

Instance Variables:
	id	<Array of: Integer>	the list of possible token types this represents. There can be overlapping tokens, so we list all of the id here. The default parser only looks at the first id, but we can redefine this behavior in a subclass to look at all possibilities until we find a valid token.
	start	<Integer>	the starting position of the token in the original input
	value	<Object>	the value of our token (normally a string, but could be anything)

"
Class {
	#name : #SmaCCToken,
	#superclass : #Object,
	#instVars : [
		'start',
		'id',
		'value'
	],
	#category : #'SmaCC-Runtime'
}

{ #category : #'instance creation' }
SmaCCToken class >> value: aString start: anInteger id: anObject [ 
	^(self new)
		value: aString
			start: anInteger
			id: anObject;
		yourself
]

{ #category : #accessing }
SmaCCToken >> id [
	^id
]

{ #category : #printing }
SmaCCToken >> printOn: aStream [ 
	aStream
		nextPut: ${;
		nextPutAll: self value;
		nextPut: $(;
		nextPutAll: self startPosition printString;
		nextPut: $,;
		nextPutAll: self stopPosition printString;
		nextPut: $,;
		nextPutAll: self id printString;
		nextPutAll: ')}'
]

{ #category : #accessing }
SmaCCToken >> startPosition [
	^start
]

{ #category : #accessing }
SmaCCToken >> stopPosition [
	^start + value size - 1
]

{ #category : #accessing }
SmaCCToken >> value [
	^value
]

{ #category : #'initialize-release' }
SmaCCToken >> value: anObject start: startPositionInteger id: anInteger [ 
	value := anObject.
	start := startPositionInteger.
	id := anInteger
]
