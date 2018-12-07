"
<ISO10303-11-EXPRESS>
ENTITY integer_type 
	SUBTYPE OF ( number_type );
	precision : OPTIONAL bound;
DERIVE
	SELF\number_type.accepted : entity_instance := SELF.accept_integer_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltIntegerType,
	#superclass : #PltNumberType,
	#instVars : [
		'precision'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltIntegerType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltIntegerType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIntegerType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIntegerType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIntegerType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltIntegerType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltIntegerType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltIntegerType >> accept: aVisitor [
  ^aVisitor acceptIntegerType: self


]

{ #category : #'platypus-generated-deriving' }
PltIntegerType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltIntegerType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltIntegerType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptIntegerTypeUsingContext: aContext


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIntegerType >> fastSetPrecision: aPltBound [
  precision := aPltBound


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerType >> fromValues: values [
  ^self integerTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltIntegerType >> integerTypeCopyTo: another [
  another fastSetPrecision: self precision


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerType >> integerTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setPrecision: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerType >> integerTypeToValues: values [
  values add: self precision.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltIntegerType >> isPltIntegerType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerType >> localFromValues: values [
  ^self integerTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerType >> localToValues: values [
  ^self integerTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltIntegerType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltIntegerType >> pltCopyTo: another [
  super pltCopyTo: another.
  self integerTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltIntegerType >> pltLocalCopyTo: another [
  self integerTypeCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltIntegerType >> precision [
  ^precision


]

{ #category : #'platypus-generated-accessing' }
PltIntegerType >> precision: aPltBound [
  precision := aPltBound


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIntegerType >> precisionUsingContext: aContext [
  ^self precision


]

{ #category : #'platypus-generated-set-accessing' }
PltIntegerType >> setPrecision: aPltBound [
  self precision: aPltBound


]

{ #category : #'platypus-generated-initializing' }
PltIntegerType >> stepInitialize [
  super stepInitialize.
  precision := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerType >> toValues: values [
  ^self integerTypeToValues: (super toValues: values)


]
