Class {
	#name : #PlatypusRuleReference,
	#superclass : #PlatypusSchemaElementReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #accessing }
PlatypusRuleReference class >> lexicalElement [
	^ #rule
]

{ #category : #testing }
PlatypusRuleReference >> canEvaluate [
	^ true
]

{ #category : #accessing }
PlatypusRuleReference >> children [
	^ self subContents
]

{ #category : #accessing }
PlatypusRuleReference >> icon [
	^ TamIcons mimeIcon: '10x10/mimetypes/blue_r'
]
