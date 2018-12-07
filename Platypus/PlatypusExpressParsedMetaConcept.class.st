Class {
	#name : #PlatypusExpressParsedMetaConcept,
	#superclass : #Object,
	#instVars : [
		'ident',
		'metaExpression'
	],
	#category : #'Platypus-HW-parsers'
}

{ #category : #'instance creation' }
PlatypusExpressParsedMetaConcept class >> ident: anIdent [
	^ self ident: anIdent metaExpression: nil
]

{ #category : #'instance creation' }
PlatypusExpressParsedMetaConcept class >> ident: anIdent metaExpression: aMetaExpression [
	^ self new ident: anIdent metaExpression: aMetaExpression
]

{ #category : #accessing }
PlatypusExpressParsedMetaConcept >> ident [
	^ident
]

{ #category : #accessing }
PlatypusExpressParsedMetaConcept >> ident: anObject [
	ident := anObject
]

{ #category : #accessing }
PlatypusExpressParsedMetaConcept >> ident: anIdent metaExpression: aMetaExpression [
	metaExpression := aMetaExpression.
	ident := anIdent
]

{ #category : #accessing }
PlatypusExpressParsedMetaConcept >> metaExpression [
	^metaExpression
]

{ #category : #accessing }
PlatypusExpressParsedMetaConcept >> metaExpression: anObject [
	metaExpression := anObject
]

{ #category : #accessing }
PlatypusExpressParsedMetaConcept >> updateDictionaryInstanceName: aDictionaryInstance [ 
	aDictionaryInstance name: self ident.
	self metaExpression 
		ifNotNil: [aDictionaryInstance metaExpression: self metaExpression]
]
