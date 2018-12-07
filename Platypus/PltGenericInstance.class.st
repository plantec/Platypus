"
<ISO10303-11-EXPRESS>
ENTITY generic_instance 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( application_instance );
	instance_scope : OPTIONAL instance_scope;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltGenericInstance,
	#superclass : #PltApplicationInstance,
	#instVars : [
		'instanceScope',
		'computed',
		'scope'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltGenericInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltGenericInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGenericInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGenericInstance class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGenericInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltGenericInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltGenericInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltGenericInstance >> accept: aVisitor [
  ^aVisitor acceptGenericInstance: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltGenericInstance >> fastSetInstanceScope: aPltInstanceScope [
  instanceScope := aPltInstanceScope


]

{ #category : #'platypus-generated-group-accessing' }
PltGenericInstance >> fromValues: values [
  ^self genericInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltGenericInstance >> genericInstanceCopyTo: another [
  another fastSetInstanceScope: self instanceScope


]

{ #category : #'platypus-generated-group-accessing' }
PltGenericInstance >> genericInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setInstanceScope: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltGenericInstance >> genericInstanceToValues: values [
  values add: self instanceScope.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltGenericInstance >> instanceScope [
  ^instanceScope


]

{ #category : #'platypus-generated-accessing' }
PltGenericInstance >> instanceScope: aPltInstanceScope [
  instanceScope := aPltInstanceScope


]

{ #category : #'platypus-generated-with-context-accessing' }
PltGenericInstance >> instanceScopeUsingContext: aContext [
  ^self instanceScope


]

{ #category : #'platypus-generated-classifying' }
PltGenericInstance >> isPltGenericInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltGenericInstance >> localFromValues: values [
  ^self genericInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltGenericInstance >> localToValues: values [
  ^self genericInstanceToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltGenericInstance >> owner [
	^ owner


]

{ #category : #'platypus-generated-copying' }
PltGenericInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltGenericInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self genericInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltGenericInstance >> pltLocalCopyTo: another [
  self genericInstanceCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltGenericInstance >> setInstanceScope: aPltInstanceScope [
  self instanceScope: aPltInstanceScope


]

{ #category : #'platypus-generated-initializing' }
PltGenericInstance >> stepInitialize [
  super stepInitialize.
  instanceScope := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltGenericInstance >> toValues: values [
  ^self genericInstanceToValues: (super toValues: values)


]
