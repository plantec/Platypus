"
<ISO10303-11-EXPRESS>
ENTITY file_name 
	SUBTYPE OF ( header_instance );
	name : STRING ( 256 );
	time_stamp : STRING ( 256 );
	author : LIST [ 1 : ? ] OF STRING ( 256 );
	organization : LIST [ 1 : ? ] OF STRING ( 256 );
	preprocessor_version : STRING ( 256 );
	originating_system : STRING ( 256 );
	authorisation : STRING ( 256 );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltFileName,
	#superclass : #PltHeaderInstance,
	#instVars : [
		'author',
		'organization',
		'originatingSystem',
		'authorisation',
		'name',
		'preprocessorVersion',
		'timeStamp'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltFileName class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltFileName class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFileName class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFileName class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFileName class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltFileName class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltFileName class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltFileName >> accept: aVisitor [
  ^aVisitor acceptFileName: self


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> author [
  ^author


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> author: aListOfString [
  author := aListOfString ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltFileName >> authorUsingContext: aContext [
  ^self author


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> authorisation [
  ^authorisation


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> authorisation: aString [
  authorisation := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltFileName >> authorisationUsingContext: aContext [
  ^self authorisation


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltFileName >> fastSetAuthor: aListOfString [
  author := aListOfString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltFileName >> fastSetAuthorisation: aString [
  authorisation := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltFileName >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltFileName >> fastSetOrganization: aListOfString [
  organization := aListOfString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltFileName >> fastSetOriginatingSystem: aString [
  originatingSystem := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltFileName >> fastSetPreprocessorVersion: aString [
  preprocessorVersion := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltFileName >> fastSetTimeStamp: aString [
  timeStamp := aString


]

{ #category : #'platypus-generated-copying' }
PltFileName >> fileNameCopyTo: another [
  another fastSetName: self name.
  another fastSetTimeStamp: self timeStamp.
  another fastSetAuthor: self author.
  another fastSetOrganization: self organization.
  another fastSetPreprocessorVersion: self preprocessorVersion.
  another fastSetOriginatingSystem: self originatingSystem.
  another fastSetAuthorisation: self authorisation


]

{ #category : #'platypus-generated-group-accessing' }
PltFileName >> fileNameFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setName: valuesloc removeFirst.
  self setTimeStamp: valuesloc removeFirst.
  self setAuthor: valuesloc removeFirst.
  self setOrganization: valuesloc removeFirst.
  self setPreprocessorVersion: valuesloc removeFirst.
  self setOriginatingSystem: valuesloc removeFirst.
  self setAuthorisation: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltFileName >> fileNameToValues: values [
  values add: self name.
  values add: self timeStamp.
  values add: self author.
  values add: self organization.
  values add: self preprocessorVersion.
  values add: self originatingSystem.
  values add: self authorisation.
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltFileName >> fromValues: values [
  ^self fileNameFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltFileName >> isPltFileName [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltFileName >> localFromValues: values [
  ^self fileNameFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltFileName >> localToValues: values [
  ^self fileNameToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltFileName >> name: aString timeStamp: aString1 author: aListOfString organization: aListOfString1 preprocessorVersion: aString2 originatingSystem: aString3 authorisation: aString4 [ 	self setName:aString.	self setTimeStamp:aString1.	self setAuthor:aListOfString.	self setOrganization:aListOfString1.	self setPreprocessorVersion:aString2.	self setOriginatingSystem:aString3.	self setAuthorisation:aString4.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltFileName >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> organization [
  ^organization


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> organization: aListOfString [
  organization := aListOfString ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltFileName >> organizationUsingContext: aContext [
  ^self organization


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> originatingSystem [
  ^originatingSystem


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> originatingSystem: aString [
  originatingSystem := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltFileName >> originatingSystemUsingContext: aContext [
  ^self originatingSystem


]

{ #category : #'platypus-generated-copying' }
PltFileName >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltFileName >> pltCopyTo: another [
  super pltCopyTo: another.
  self fileNameCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltFileName >> pltLocalCopyTo: another [
  self fileNameCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> preprocessorVersion [
  ^preprocessorVersion


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> preprocessorVersion: aString [
  preprocessorVersion := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltFileName >> preprocessorVersionUsingContext: aContext [
  ^self preprocessorVersion


]

{ #category : #'platypus-generated-set-accessing' }
PltFileName >> setAuthor: aListOfString [
  self author: aListOfString


]

{ #category : #'platypus-generated-set-accessing' }
PltFileName >> setAuthorisation: aString [
  self authorisation: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltFileName >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltFileName >> setOrganization: aListOfString [
  self organization: aListOfString


]

{ #category : #'platypus-generated-set-accessing' }
PltFileName >> setOriginatingSystem: aString [
  self originatingSystem: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltFileName >> setPreprocessorVersion: aString [
  self preprocessorVersion: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltFileName >> setTimeStamp: aString [
  self timeStamp: aString


]

{ #category : #'platypus-generated-initializing' }
PltFileName >> stepInitialize [
  super stepInitialize.
  name := ''.
  timeStamp := ''.
  author := OrderedCollection new.
  organization := OrderedCollection new.
  preprocessorVersion := ''.
  originatingSystem := ''.
  authorisation := ''


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> timeStamp [
  ^timeStamp


]

{ #category : #'platypus-generated-accessing' }
PltFileName >> timeStamp: aString [
  timeStamp := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltFileName >> timeStampUsingContext: aContext [
  ^self timeStamp


]

{ #category : #'platypus-generated-group-accessing' }
PltFileName >> toValues: values [
  ^self fileNameToValues: (super toValues: values)


]
