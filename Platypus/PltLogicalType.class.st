"
<ISO10303-11-EXPRESS>
ENTITY logical_type 
	SUBTYPE OF ( simple_type );
DERIVE
	accepted : entity_instance := SELF.accept_logical_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltLogicalType,
	#superclass : #PltSimpleType,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltLogicalType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltLogicalType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLogicalType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLogicalType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLogicalType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltLogicalType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltLogicalType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltLogicalType >> accept: aVisitor [
  ^aVisitor acceptLogicalType: self


]

{ #category : #'platypus-generated-deriving' }
PltLogicalType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltLogicalType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltLogicalType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptLogicalTypeUsingContext: aContext


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalType >> fromValues: values [
  ^self logicalTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltLogicalType >> isPltLogicalType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalType >> localFromValues: values [
  ^self logicalTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalType >> localToValues: values [
  ^self logicalTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltLogicalType >> logicalTypeCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalType >> logicalTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalType >> logicalTypeToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltLogicalType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltLogicalType >> pltCopyTo: another [
  super pltCopyTo: another.
  self logicalTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltLogicalType >> pltLocalCopyTo: another [
  self logicalTypeCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltLogicalType >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalType >> toValues: values [
  ^self logicalTypeToValues: (super toValues: values)


]
