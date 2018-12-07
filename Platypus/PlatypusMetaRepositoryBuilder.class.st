Class {
	#name : #PlatypusMetaRepositoryBuilder,
	#superclass : #PlatypusStepOnePassAbstractVisitor,
	#instVars : [
		'stepRepo',
		'modelContents'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'repository building' }
PlatypusMetaRepositoryBuilder class >> build: aStepRepository with: aMetaData [ 
	| builder |
	builder := self new stepRepo: aStepRepository.
	builder acceptTry: aMetaData.
	^ builder
]

{ #category : #'visit dictionary schema' }
PlatypusMetaRepositoryBuilder >> acceptContextDefinition: e [ 
	super acceptContextDefinition: e.
	e owner acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusMetaRepositoryBuilder >> acceptEntityDefinition: e [ 
	e owner acceptTry: self.
	super acceptEntityDefinition: e
]

{ #category : #'visit dictionary schema' }
PlatypusMetaRepositoryBuilder >> acceptExternalMetaSchema: e [ 
	^ super acceptExternalMetaSchema: e
]

{ #category : #'visit dictionary schema' }
PlatypusMetaRepositoryBuilder >> acceptExternalSchema: e [ 
	
]

{ #category : #'visit dictionary schema' }
PlatypusMetaRepositoryBuilder >> acceptIncludeSchema: e [ 
	e nativeSchema acceptTry: self.
	super acceptIncludeSchema: e
]

{ #category : #'visit population schema' }
PlatypusMetaRepositoryBuilder >> acceptInternalRepresentation: e [ 
	super acceptInternalRepresentation: e.
	e definition acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusMetaRepositoryBuilder >> acceptInverseAttribute: e [ 
	e domain acceptTry: self.
	^ super acceptInverseAttribute: e
]

{ #category : #'visit dictionary schema' }
PlatypusMetaRepositoryBuilder >> acceptLocalVariable: e [ 
	super acceptLocalVariable: e.
	e owner
		ifNotNil: [e owner acceptTry: self]
]

{ #category : #'visit dictionary schema' }
PlatypusMetaRepositoryBuilder >> acceptParameterDefinition: e [ 
	super acceptParameterDefinition: e.
	e owner ifNotNil: [e owner  acceptTry: self]
]

{ #category : #'visit dictionary schema' }
PlatypusMetaRepositoryBuilder >> acceptRemarkReference: e [ 
	super acceptRemarkReference: e.
	e inside acceptTry: self.
	e referenced acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusMetaRepositoryBuilder >> acceptSchemaDefinition: e [ 
	super acceptSchemaDefinition: e
]

{ #category : #'visit environment schema' }
PlatypusMetaRepositoryBuilder >> acceptSchemaInstance: e [
	e dataSchemata acceptTry: self.
	e metaConceptsIndex acceptTry: self.
	e associatedModels acceptTry: self
]

{ #category : #'visit population schema' }
PlatypusMetaRepositoryBuilder >> acceptSimpleRecord: e [ 
	super acceptSimpleRecord: e.
	e definition acceptTry: self
]

{ #category : #'visit generic' }
PlatypusMetaRepositoryBuilder >> acceptTry: anObject [ 
	stepRepo registerInstance: anObject.
	^ super acceptTry: anObject
]

{ #category : #accessing }
PlatypusMetaRepositoryBuilder >> modelContents [
	^ modelContents
]

{ #category : #accessing }
PlatypusMetaRepositoryBuilder >> modelContents: aModelContents [
	modelContents := aModelContents
]

{ #category : #accessing }
PlatypusMetaRepositoryBuilder >> stepRepo: anObject [
	stepRepo := anObject
]
