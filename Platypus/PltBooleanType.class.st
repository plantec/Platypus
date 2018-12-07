"
<ISO10303-11-EXPRESS>
ENTITY boolean_type 
	SUBTYPE OF ( logical_type );
DERIVE
	SELF\logical_type.accepted : entity_instance := SELF.accept_boolean_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltBooleanType,
	#superclass : #PltLogicalType,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltBooleanType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltBooleanType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBooleanType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBooleanType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBooleanType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltBooleanType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltBooleanType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltBooleanType >> accept: aVisitor [
  ^aVisitor acceptBooleanType: self


]

{ #category : #'platypus-generated-deriving' }
PltBooleanType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltBooleanType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltBooleanType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptBooleanTypeUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
PltBooleanType >> booleanTypeCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltBooleanType >> booleanTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltBooleanType >> booleanTypeToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltBooleanType >> fromValues: values [
  ^self booleanTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltBooleanType >> isPltBooleanType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltBooleanType >> localFromValues: values [
  ^self booleanTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltBooleanType >> localToValues: values [
  ^self booleanTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltBooleanType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltBooleanType >> pltCopyTo: another [
  super pltCopyTo: another.
  self booleanTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltBooleanType >> pltLocalCopyTo: another [
  self booleanTypeCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltBooleanType >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltBooleanType >> toValues: values [
  ^self booleanTypeToValues: (super toValues: values)


]
