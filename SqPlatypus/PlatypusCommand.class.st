Class {
	#name : #PlatypusCommand,
	#superclass : #Object,
	#instVars : [
		'haveError'
	],
	#category : #'SqPlatypus-HW-CommandLine'
}

{ #category : #accessing }
PlatypusCommand >> haveError [
	^ haveError
]

{ #category : #accessing }
PlatypusCommand >> haveError: aBoolean [
	haveError := aBoolean
]

{ #category : #initialization }
PlatypusCommand >> initialize [
	super initialize.
	haveError := false
]

{ #category : #'error handling' }
PlatypusCommand >> notify: aMessage [ 
	| m |
	self haveError:  true.
	m := 'Platypus: Error: ' , aMessage , String cr.
	Transcript show: m.
	FileStream stdout nextPutAll: m
]

{ #category : #'error handling' }
PlatypusCommand >> notify: aMessage at: aPosition [
	| m |
	self haveError:  true.
	m := 'Platypus: Error: at position ' , aPosition asString , ' :' , aMessage , String cr.
	Transcript show: m.
	FileStream stdout nextPutAll: m
]

{ #category : #commands }
PlatypusCommand >> updateSchemaFrom: aFilePath [
	| elemName ref contents |
	ref := aFilePath asFileReference.
	elemName := ref basenameWithoutExtension.
	contents := (ref readStream contents) replaceAll: Character lf with: Character cr.
	(Platypus itemNamed: elemName) accept: contents notifying: self.
	self haveError ifFalse: [ (Platypus itemNamed: elemName) menuSave ]
]
