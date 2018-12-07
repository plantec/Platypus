Class {
	#name : #PlatypusFunctionReference,
	#superclass : #PlatypusSchemaElementReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #accessing }
PlatypusFunctionReference class >> lexicalElement [
	^ #function
]

{ #category : #testing }
PlatypusFunctionReference >> canEvaluate [
	^ true
]

{ #category : #accessing }
PlatypusFunctionReference >> children [
	^ self subContents

]

{ #category : #accessing }
PlatypusFunctionReference >> icon [
	^ TamIcons mimeIcon: '10x10/mimetypes/blue_f'

]
