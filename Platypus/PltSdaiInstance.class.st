"
<ISO10303-11-EXPRESS>
ENTITY sdai_instance 
	ABSTRACT SUPERTYPE OF ( ONEOF ( dictionary_instance, session_instance ) ) 
	SUBTYPE OF ( entity_instance );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSdaiInstance,
	#superclass : #PltEntityInstance,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSdaiInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSdaiInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSdaiInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSdaiInstance class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSdaiInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSdaiInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSdaiInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSdaiInstance >> accept: aVisitor [
  ^aVisitor acceptSdaiInstance: self


]

{ #category : #'platypus-generated-group-accessing' }
PltSdaiInstance >> fromValues: values [
  ^self sdaiInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSdaiInstance >> isPltSdaiInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSdaiInstance >> localFromValues: values [
  ^self sdaiInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSdaiInstance >> localToValues: values [
  ^self sdaiInstanceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltSdaiInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSdaiInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self sdaiInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSdaiInstance >> pltLocalCopyTo: another [
  self sdaiInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSdaiInstance >> sdaiInstanceCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltSdaiInstance >> sdaiInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSdaiInstance >> sdaiInstanceToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltSdaiInstance >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltSdaiInstance >> toValues: values [
  ^self sdaiInstanceToValues: (super toValues: values)


]
