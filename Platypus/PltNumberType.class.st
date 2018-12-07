"
<ISO10303-11-EXPRESS>
ENTITY number_type 
	SUBTYPE OF ( simple_type );
DERIVE
	accepted : entity_instance := SELF.accept_number_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNumberType,
	#superclass : #PltSimpleType,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltNumberType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltNumberType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNumberType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNumberType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNumberType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNumberType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNumberType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltNumberType >> accept: aVisitor [
  ^aVisitor acceptNumberType: self


]

{ #category : #'platypus-generated-deriving' }
PltNumberType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltNumberType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltNumberType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptNumberTypeUsingContext: aContext


]

{ #category : #'platypus-generated-group-accessing' }
PltNumberType >> fromValues: values [
  ^self numberTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltNumberType >> isPltNumberType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltNumberType >> localFromValues: values [
  ^self numberTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltNumberType >> localToValues: values [
  ^self numberTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltNumberType >> numberTypeCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltNumberType >> numberTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltNumberType >> numberTypeToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltNumberType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltNumberType >> pltCopyTo: another [
  super pltCopyTo: another.
  self numberTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltNumberType >> pltLocalCopyTo: another [
  self numberTypeCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltNumberType >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltNumberType >> toValues: values [
  ^self numberTypeToValues: (super toValues: values)


]
