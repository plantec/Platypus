Class {
	#name : 'PlatypusProcedureReference',
	#superclass : 'PlatypusSchemaElementReference',
	#category : 'SqPlatypus-HW-tamaris',
	#package : 'SqPlatypus',
	#tag : 'HW-tamaris'
}

{ #category : 'accessing' }
PlatypusProcedureReference class >> lexicalElement [
	^ #procedure
]

{ #category : 'testing' }
PlatypusProcedureReference >> canEvaluate [
	^ true
]

{ #category : 'accessing' }
PlatypusProcedureReference >> icon [
	^ TamIcons mimeIcon: '10x10/mimetypes/blue_p'
]
