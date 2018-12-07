Class {
	#name : #PlatypusCoreAlgorithmDeclaration,
	#superclass : #PlatypusCoreObject,
	#category : #'Platypus-HW-core'
}

{ #category : #accessing }
PlatypusCoreAlgorithmDeclaration class >> context [
	^self schemaDefinition context
]

{ #category : #'instance creation' }
PlatypusCoreAlgorithmDeclaration class >> fromValues: values [
	^ self new fromValues: values
]

{ #category : #'instance creation' }
PlatypusCoreAlgorithmDeclaration class >> invoke [
	^self new invoke
]

{ #category : #'instance creation' }
PlatypusCoreAlgorithmDeclaration class >> invokeFromValues: values [ 
	| algo |
	algo := self new fromValues: values.
	^algo invoke
]

{ #category : #'instance creation' }
PlatypusCoreAlgorithmDeclaration class >> invokeOnContextStream: aStream [
	| repo |
	repo := self schemaInstance repositoryClass new asSchemaInstanceContext.
	repo parseStream: aStream.
	^self new invoke
]

{ #category : #'instance creation' }
PlatypusCoreAlgorithmDeclaration class >> invokeOnContextStream: aStream fromValues: values [
	| repo |
	repo := self schemaInstance repositoryClass new asSchemaInstanceContext.
	repo parseStream: aStream.
	^(self new fromValues: values) invoke
]

{ #category : #accessing }
PlatypusCoreAlgorithmDeclaration class >> schemaInstance [
	^ self schemaDefinition schemaInstance
]

{ #category : #accessing }
PlatypusCoreAlgorithmDeclaration >> fromValues: values [ 

]

{ #category : #executing }
PlatypusCoreAlgorithmDeclaration >> invoke [
	
]

{ #category : #executing }
PlatypusCoreAlgorithmDeclaration >> invokeOnModelDataStream: aStream [
	
	
]

{ #category : #accessing }
PlatypusCoreAlgorithmDeclaration >> myContext [
	^ self class context
]

{ #category : #executing }
PlatypusCoreAlgorithmDeclaration >> return: anObject [ 
	^ anObject pltNativeValue 
]
