"
SmaCCScannerDefinition is the parsed representation of the scanner. It contains the tokens and states for the scanner.

Instance Variables:
	excludeStates	<Collection>	exclusive states (when we are in one of these, then we shouldn't try to parse the default tokens)
	states	<Collection>	states in the scanner -- if no states are specified, then this will only contain #default
	tokens	<Dictionary>	dictionary mapping token names to their regular expressions


"
Class {
	#name : #SmaCCScannerDefinition,
	#superclass : #Object,
	#instVars : [
		'tokens',
		'states',
		'excludeStates'
	],
	#category : #'SmaCCDev-ScannerGenerator'
}

{ #category : #accessing }
SmaCCScannerDefinition >> addExcludeState: aSymbol [ 
	excludeStates add: aSymbol.
	self addState: aSymbol
]

{ #category : #accessing }
SmaCCScannerDefinition >> addState: aSymbol [
	states add: aSymbol
]

{ #category : #accessing }
SmaCCScannerDefinition >> addToken: aSmaCCRENode withName: aString [
	tokens at: aString put: aSmaCCRENode
]

{ #category : #accessing }
SmaCCScannerDefinition >> defaultState [
	^#default
]

{ #category : #testing }
SmaCCScannerDefinition >> includesTokenNamed: aString [
	^tokens includesKey: aString
]

{ #category : #'initialize-release' }
SmaCCScannerDefinition >> initialize [
	tokens := Dictionary new.
	states := Set with: self defaultState.
	excludeStates := Set new
]

{ #category : #testing }
SmaCCScannerDefinition >> isExcludeState: aSymbol [
	^excludeStates includes: aSymbol
]

{ #category : #accessing }
SmaCCScannerDefinition >> nonExcludeStates [
	| nonExcludeStates |
	nonExcludeStates := states reject: [:each | self isExcludeState: each].
	nonExcludeStates add: self defaultState.
	^nonExcludeStates
]

{ #category : #accessing }
SmaCCScannerDefinition >> states [
	^states
]

{ #category : #accessing }
SmaCCScannerDefinition >> tokenNamed: aString [
	^tokens at: aString
]

{ #category : #accessing }
SmaCCScannerDefinition >> tokenNamed: aString ifAbsentPut: aBlock [ 
	^tokens at: aString ifAbsentPut: aBlock
]

{ #category : #accessing }
SmaCCScannerDefinition >> tokens [
	^tokens
]
