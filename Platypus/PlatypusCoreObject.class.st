Class {
	#name : #PlatypusCoreObject,
	#superclass : #Object,
	#category : #'Platypus-HW-core'
}

{ #category : #'express code accessing' }
PlatypusCoreObject class >> expressSchemaCode [
	^ self expressSchemaCodeForClass: self 
]

{ #category : #'express code accessing' }
PlatypusCoreObject class >> expressSchemaCodeForClass: aClass [
	| s i1 i2 |
	s := aClass comment asString.
	i1 := s indexOfSubCollection: self expressSchemaCodeStartMark startingAt: 1.
	i2 := s indexOfSubCollection: self expressSchemaCodeStopMark
				startingAt: i1 + 1.
	^ s copyFrom: i1 + self expressSchemaCodeStartMark size to: i2 - 1
]

{ #category : #'express code accessing' }
PlatypusCoreObject class >> expressSchemaCodeStartMark [
	^ '<ISO10303-11-EXPRESS>'
]

{ #category : #'express code accessing' }
PlatypusCoreObject class >> expressSchemaCodeStopMark [
	^ '</ISO10303-11-EXPRESS>'
]

{ #category : #'as yet unclassified' }
PlatypusCoreObject class >> platypusMetaData [
	^ self schemaDefinition metaDataFor: self name asSymbol
]

{ #category : #'platypus-signature' }
PlatypusCoreObject class >> vwNamespaceName [
	^ #Platypus
]

{ #category : #'code accessing' }
PlatypusCoreObject >> expressSchemaCode [
	^ self class expressSchemaCode
]
