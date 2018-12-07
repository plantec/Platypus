Class {
	#name : #PlatypusExpressChecker,
	#superclass : #PlatypusStepChecker,
	#instVars : [
		'schemaInstance'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #checking }
PlatypusExpressChecker class >> checks: metaData [ 
	^ self
		checks: metaData
		owners: metaData ownerPath

]

{ #category : #checking }
PlatypusExpressChecker class >> checks: metaData owners: ownerPath [ 
	| checker |
	checker := self new visitContexts: ownerPath.
	^ checker checks: metaData
]

{ #category : #'visit dictionary schema' }
PlatypusExpressChecker >> acceptDefinedTypeReference: e [ 
	^ self acceptNamedTypeReference: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressChecker >> acceptEntityDefinitionReference: e [ 
	^ self acceptNamedTypeReference: e
]
