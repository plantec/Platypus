Class {
	#name : #PlatypusStepOwnerSetter,
	#superclass : #PlatypusStepOnePassAbstractVisitor,
	#category : #'Platypus-HW-visitors'
}

{ #category : #'as yet unclassified' }
PlatypusStepOwnerSetter >> acceptEnumerationValue: e [
	super acceptEnumerationValue: e
]

{ #category : #'visit expressions schema' }
PlatypusStepOwnerSetter >> acceptIdentifier: e [
	 e ref acceptTry: self. 
	 e parameters acceptTry: self
]

{ #category : #'visit environment schema' }
PlatypusStepOwnerSetter >> acceptSchemaInstance: e [ 
	e internalSchemata acceptTry: self.
	e metaConceptsIndex acceptTry: self.

]

{ #category : #'visit generic' }
PlatypusStepOwnerSetter >> acceptTry: e [
	e ifNotNil: [
		e owner ifNil: [
			visitPath isEmpty
				ifFalse: [e owner: visitPath top]].
		super acceptTry: e]
]
