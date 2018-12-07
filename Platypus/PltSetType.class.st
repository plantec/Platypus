"
<ISO10303-11-EXPRESS>
ENTITY set_type 
	SUBTYPE OF ( variable_size_aggregation_type );
DERIVE
	accepted : entity_instance := SELF.accept_set_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSetType,
	#superclass : #PltVariableSizeAggregationType,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSetType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSetType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSetType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSetType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSetType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSetType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSetType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSetType >> accept: aVisitor [
  ^aVisitor acceptSetType: self


]

{ #category : #'platypus-generated-deriving' }
PltSetType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltSetType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltSetType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptSetTypeUsingContext: aContext


]

{ #category : #'platypus-generated-group-accessing' }
PltSetType >> fromValues: values [
  ^self setTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSetType >> isPltSetType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSetType >> localFromValues: values [
  ^self setTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSetType >> localToValues: values [
  ^self setTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltSetType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSetType >> pltCopyTo: another [
  super pltCopyTo: another.
  self setTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSetType >> pltLocalCopyTo: another [
  self setTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSetType >> setTypeCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltSetType >> setTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSetType >> setTypeToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltSetType >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltSetType >> toValues: values [
  ^self setTypeToValues: (super toValues: values)


]
