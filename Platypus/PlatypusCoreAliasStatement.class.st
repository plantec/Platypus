Class {
	#name : #PlatypusCoreAliasStatement,
	#superclass : #PlatypusCoreStatement,
	#instVars : [
		'statementsBlock'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #'instance creation' }
PlatypusCoreAliasStatement class >> alias: anExpression statementsBlock: oneArgStatementsBlock [ 
	^ (self new statementsBlock: oneArgStatementsBlock) alias: anExpression
]

{ #category : #'instance creation' }
PlatypusCoreAliasStatement class >> statementsBlock: oneArgStatementsBlock alias: anExpression [
	^ (self new statementsBlock: oneArgStatementsBlock) alias: anExpression
]

{ #category : #evaluating }
PlatypusCoreAliasStatement >> alias: anExpression [
	^ statementsBlock value: anExpression
]

{ #category : #accessing }
PlatypusCoreAliasStatement >> statementsBlock [
	^ statementsBlock ifNil: [[:aliasVar | ]]
]

{ #category : #accessing }
PlatypusCoreAliasStatement >> statementsBlock: oneArgStatementsBlock [
	statementsBlock := oneArgStatementsBlock
]
