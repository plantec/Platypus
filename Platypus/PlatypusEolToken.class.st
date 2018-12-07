Class {
	#name : #PlatypusEolToken,
	#superclass : #PlatypusGenericToken,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #'instance creation' }
PlatypusEolToken class >> new [
	^ super new lexicalElement: Character cr
]

{ #category : #visiting }
PlatypusEolToken >> accept: aVisitor [ 
	^ aVisitor acceptEol: self
]

{ #category : #'as yet unclassified' }
PlatypusEolToken >> asString [
	^  String cr
]

{ #category : #testing }
PlatypusEolToken >> isEol [
	^true
]
