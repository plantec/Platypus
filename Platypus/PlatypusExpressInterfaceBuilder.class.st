Class {
	#name : #PlatypusExpressInterfaceBuilder,
	#superclass : #PlatypusStepOnePassAbstractVisitor,
	#instVars : [
		'interface'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'instance creation' }
PlatypusExpressInterfaceBuilder class >> exportedPrimariesElementsOf: aDictionaryInstance [ 
	| interfaceBuilder |
	interfaceBuilder := self new.
	interfaceBuilder acceptTry: aDictionaryInstance.
	^ interfaceBuilder
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterfaceBuilder >> acceptAlgorithmDeclaration: e [ 
	self acceptContextDefinition: e.
	self addInInterface: e.
	e formalParameters acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterfaceBuilder >> acceptConstantDefinition: e [ 
	self addInInterface: e.
	e domain acceptTry: self.
	e initializer acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterfaceBuilder >> acceptExternalSchema: e [ 
	super acceptExternalSchema: e.

]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterfaceBuilder >> acceptGlobalRule: e [ 
	self addInInterface: e.
	e forEntities acceptTry: self
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterfaceBuilder >> acceptIncludeSchema: e [ 
	super acceptIncludeSchema: e.
	e nativeSchema
		ifNotNil: [e nativeSchema acceptTry: self]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressInterfaceBuilder >> acceptNamedType: e [ 
	self addInInterface: e.
	e whereRules acceptTry: self
]

{ #category : #accessing }
PlatypusExpressInterfaceBuilder >> addInInterface: e [ 
	interface add: e
]

{ #category : #'initialize/release' }
PlatypusExpressInterfaceBuilder >> initialize [
	super initialize.
	interface := IdentitySet new
]

{ #category : #accessing }
PlatypusExpressInterfaceBuilder >> interface [
	^ interface 
]
