Class {
	#name : #PlatypusCoreContextDefinition,
	#superclass : #PlatypusCoreObject,
	#instVars : [
		'metaData',
		'owner'
	],
	#classInstVars : [
		'singleton'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #accessing }
PlatypusCoreContextDefinition class >> lookUpIdentifierBN: aName [ 
	^ self singleton lookUpIdentifierBN: aName 

]

{ #category : #accessing }
PlatypusCoreContextDefinition class >> lookUpNamedTypeBN: aName [ 
	^ self singleton lookUpNamedTypeBN: aName
]

{ #category : #accessing }
PlatypusCoreContextDefinition class >> reinitializeSingleton [
	singleton
		ifNotNil: [singleton metaData ifNotNil: [singleton metaData deepDestroy]].
	singleton := nil
]

{ #category : #accessing }
PlatypusCoreContextDefinition class >> singleton [
	^ singleton ifNil: [singleton := self new]
]

{ #category : #'private accessing' }
PlatypusCoreContextDefinition >> entityDefinitionClassInfos [
	| result |
	result := OrderedCollection new.
	1
		to: self entityDefinitionCount
		do: [:cpt | result
				add: (self perform: ('entityDefinition' , cpt asString) asSymbol)].
	^ result
]

{ #category : #'private accessing' }
PlatypusCoreContextDefinition >> entityDefinitionCount [
	self subclassResponsibility 
]

{ #category : #'private accessing' }
PlatypusCoreContextDefinition >> functionDeclarationClassInfos [
	| result |
	result := OrderedCollection new.
	1
		to: self functionDeclarationCount
		do: [:cpt | result
				add: (self perform: ('functionDeclaration' , cpt asString) asSymbol)].
	^ result
]

{ #category : #'private accessing' }
PlatypusCoreContextDefinition >> functionDeclarationCount [
	self subclassResponsibility
]

{ #category : #'private initializing' }
PlatypusCoreContextDefinition >> initializeFromOwner: myOwner [ 
	| metaDataByClassNameIndex classNamesByMetaDataNameIndex elementName elementClassName |
	owner := myOwner.
	metaDataByClassNameIndex := myOwner metaDataByClassNameIndex.
	classNamesByMetaDataNameIndex := myOwner classNamesByMetaDataNameIndex.
	metaDataByClassNameIndex at: self class name asSymbol put: self metaData.
	self entityDefinitionClassInfos , self functionDeclarationClassInfos
		do: [:info | 
			elementName := info first.
			elementClassName := info second.
			metaDataByClassNameIndex
				at: elementClassName asSymbol
				put: ((self metaData lookUpNamedTypeBN: elementName)
						ifNil: [self metaData lookUpIdentifierBN: elementName]).
			classNamesByMetaDataNameIndex at: elementName asUppercase asSymbol put: elementClassName asSymbol]
]

{ #category : #accessing }
PlatypusCoreContextDefinition >> lookUpIdentifierBN: aName [ 
	self metaData isNil
		ifTrue: [self schemaInstance buildIndexes].
	^ self metaData lookUpIdentifierBN: aName
]

{ #category : #accessing }
PlatypusCoreContextDefinition >> lookUpNamedTypeBN: aName [ 
	^ self metaData
		ifNotNil: [self metaData lookUpNamedTypeBN: aName]
]

{ #category : #accessing }
PlatypusCoreContextDefinition >> metaData [
	^ metaData
]

{ #category : #accessing }
PlatypusCoreContextDefinition >> metaData: anObject [ 
	metaData := anObject
]

{ #category : #accessing }
PlatypusCoreContextDefinition >> metaDataByClassNameIndex [
	^ self schemaInstance metaDataByClassNameIndex
]

{ #category : #accessing }
PlatypusCoreContextDefinition >> metaDataFor: aSymbol [
	^ self schemaInstance metaDataFor: aSymbol
]

{ #category : #accessing }
PlatypusCoreContextDefinition >> metaDataForInstance: anObject [ 
	^self metaDataFor: anObject class name
]

{ #category : #accessing }
PlatypusCoreContextDefinition >> owner [
	^owner
]

{ #category : #accessing }
PlatypusCoreContextDefinition >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
PlatypusCoreContextDefinition >> schemaInstance [
	^ self schemaInstanceClass singleton

]

{ #category : #'private accessing' }
PlatypusCoreContextDefinition >> schemaInstanceClass [
	^ PlatypusPharoSmalltalk
		at: self schemaInstanceClassName 
		ifAbsent: []
]

{ #category : #'private accessing' }
PlatypusCoreContextDefinition >> schemaInstanceClassName [
	^ self shouldNotImplement
]
