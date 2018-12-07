Class {
	#name : #PlatypusPrimaryElementOpenKeywordToken,
	#superclass : #PlatypusOpenKeywordToken,
	#instVars : [
		'metaData'
	],
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #'initialize/release' }
PlatypusPrimaryElementOpenKeywordToken >> destroy [
	metaData := nil.
	super destroy
]

{ #category : #Classification }
PlatypusPrimaryElementOpenKeywordToken >> isPrimaryElementOpenKeyword [
	^ true
]

{ #category : #accessing }
PlatypusPrimaryElementOpenKeywordToken >> metaData [
	^metaData
]

{ #category : #accessing }
PlatypusPrimaryElementOpenKeywordToken >> metaData: anObject [
	metaData := anObject
]
