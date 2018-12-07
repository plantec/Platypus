"
<ISO10303-11-EXPRESS>
ENTITY bag_type 
	SUBTYPE OF ( variable_size_aggregation_type );
DERIVE
	accepted : entity_instance := SELF.accept_bag_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltBagType,
	#superclass : #PltVariableSizeAggregationType,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltBagType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltBagType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBagType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBagType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBagType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltBagType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltBagType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltBagType >> accept: aVisitor [
  ^aVisitor acceptBagType: self


]

{ #category : #'platypus-generated-deriving' }
PltBagType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltBagType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltBagType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptBagTypeUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
PltBagType >> bagTypeCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltBagType >> bagTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltBagType >> bagTypeToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltBagType >> fromValues: values [
  ^self bagTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltBagType >> isPltBagType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltBagType >> localFromValues: values [
  ^self bagTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltBagType >> localToValues: values [
  ^self bagTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltBagType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltBagType >> pltCopyTo: another [
  super pltCopyTo: another.
  self bagTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltBagType >> pltLocalCopyTo: another [
  self bagTypeCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltBagType >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltBagType >> toValues: values [
  ^self bagTypeToValues: (super toValues: values)


]
