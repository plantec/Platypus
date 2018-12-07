"
<ISO10303-11-EXPRESS>
ENTITY real_type 
	SUBTYPE OF ( number_type );
	precision : OPTIONAL bound;
DERIVE
	SELF\number_type.accepted : entity_instance := SELF.accept_real_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltRealType,
	#superclass : #PltNumberType,
	#instVars : [
		'precision'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltRealType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltRealType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRealType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRealType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRealType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltRealType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltRealType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltRealType >> accept: aVisitor [
  ^aVisitor acceptRealType: self


]

{ #category : #'platypus-generated-deriving' }
PltRealType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltRealType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltRealType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptRealTypeUsingContext: aContext


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRealType >> fastSetPrecision: aPltBound [
  precision := aPltBound


]

{ #category : #'platypus-generated-group-accessing' }
PltRealType >> fromValues: values [
  ^self realTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltRealType >> isPltRealType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltRealType >> localFromValues: values [
  ^self realTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltRealType >> localToValues: values [
  ^self realTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltRealType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltRealType >> pltCopyTo: another [
  super pltCopyTo: another.
  self realTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRealType >> pltLocalCopyTo: another [
  self realTypeCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltRealType >> precision [
  ^precision


]

{ #category : #'platypus-generated-accessing' }
PltRealType >> precision: aPltBound [
  precision := aPltBound


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRealType >> precisionUsingContext: aContext [
  ^self precision


]

{ #category : #'platypus-generated-copying' }
PltRealType >> realTypeCopyTo: another [
  another fastSetPrecision: self precision


]

{ #category : #'platypus-generated-group-accessing' }
PltRealType >> realTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setPrecision: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltRealType >> realTypeToValues: values [
  values add: self precision.
  ^values


]

{ #category : #'platypus-generated-set-accessing' }
PltRealType >> setPrecision: aPltBound [
  self precision: aPltBound


]

{ #category : #'platypus-generated-initializing' }
PltRealType >> stepInitialize [
  super stepInitialize.
  precision := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltRealType >> toValues: values [
  ^self realTypeToValues: (super toValues: values)


]
