"
<ISO10303-11-EXPRESS>
ENTITY file_description 
	SUBTYPE OF ( header_instance );
	description : LIST [ 1 : ? ] OF STRING ( 256 );
	implementation_level : STRING ( 256 );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltFileDescription,
	#superclass : #PltHeaderInstance,
	#instVars : [
		'description',
		'implementationLevel'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltFileDescription class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltFileDescription class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFileDescription class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFileDescription class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFileDescription class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltFileDescription class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltFileDescription class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltFileDescription >> accept: aVisitor [
  ^aVisitor acceptFileDescription: self


]

{ #category : #'platypus-generated-accessing' }
PltFileDescription >> description [
  ^description


]

{ #category : #'platypus-generated-accessing' }
PltFileDescription >> description: aListOfString [
  description := aListOfString ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : #'platypus-generated-group-accessing' }
PltFileDescription >> description: aListOfString implementationLevel: aString [ 	self setDescription:aListOfString.	self setImplementationLevel:aString.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltFileDescription >> descriptionUsingContext: aContext [
  ^self description


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltFileDescription >> fastSetDescription: aListOfString [
  description := aListOfString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltFileDescription >> fastSetImplementationLevel: aString [
  implementationLevel := aString


]

{ #category : #'platypus-generated-copying' }
PltFileDescription >> fileDescriptionCopyTo: another [
  another fastSetDescription: self description.
  another fastSetImplementationLevel: self implementationLevel


]

{ #category : #'platypus-generated-group-accessing' }
PltFileDescription >> fileDescriptionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setDescription: valuesloc removeFirst.
  self setImplementationLevel: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltFileDescription >> fileDescriptionToValues: values [
  values add: self description.
  values add: self implementationLevel.
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltFileDescription >> fromValues: values [
  ^self fileDescriptionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltFileDescription >> implementationLevel [
  ^implementationLevel


]

{ #category : #'platypus-generated-accessing' }
PltFileDescription >> implementationLevel: aString [
  implementationLevel := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltFileDescription >> implementationLevelUsingContext: aContext [
  ^self implementationLevel


]

{ #category : #'platypus-generated-classifying' }
PltFileDescription >> isPltFileDescription [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltFileDescription >> localFromValues: values [
  ^self fileDescriptionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltFileDescription >> localToValues: values [
  ^self fileDescriptionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltFileDescription >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltFileDescription >> pltCopyTo: another [
  super pltCopyTo: another.
  self fileDescriptionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltFileDescription >> pltLocalCopyTo: another [
  self fileDescriptionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltFileDescription >> setDescription: aListOfString [
  self description: aListOfString


]

{ #category : #'platypus-generated-set-accessing' }
PltFileDescription >> setImplementationLevel: aString [
  self implementationLevel: aString


]

{ #category : #'platypus-generated-initializing' }
PltFileDescription >> stepInitialize [
  super stepInitialize.
  description := OrderedCollection new.
  implementationLevel := ''


]

{ #category : #'platypus-generated-group-accessing' }
PltFileDescription >> toValues: values [
  ^self fileDescriptionToValues: (super toValues: values)


]
