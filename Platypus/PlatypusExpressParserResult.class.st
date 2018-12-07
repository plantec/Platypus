Class {
	#name : #PlatypusExpressParserResult,
	#superclass : #Object,
	#instVars : [
		'tokenList',
		'metaData',
		'users'
	],
	#category : #'Platypus-HW-parsers'
}

{ #category : #'instance creation' }
PlatypusExpressParserResult class >> tokenList: aTokenList metaData: aMetaDataInstance [
	^ self new tokenList: aTokenList metaData: aMetaDataInstance
]

{ #category : #accessing }
PlatypusExpressParserResult >> metaData [
	^ metaData
]

{ #category : #accessing }
PlatypusExpressParserResult >> metaData: anObject [
	metaData := anObject
]

{ #category : #accessing }
PlatypusExpressParserResult >> tokenList [
	^tokenList
]

{ #category : #accessing }
PlatypusExpressParserResult >> tokenList: anObject [
	tokenList := anObject
]

{ #category : #accessing }
PlatypusExpressParserResult >> tokenList: aTokenList metaData: aMetaDataInstance [ 
	self tokenList: aTokenList.
	self metaData: aMetaDataInstance.

]

{ #category : #accessing }
PlatypusExpressParserResult >> users [
	^ users 
]

{ #category : #accessing }
PlatypusExpressParserResult >> users: aListOfSchemaInstanceReferences [
	users := aListOfSchemaInstanceReferences
]
