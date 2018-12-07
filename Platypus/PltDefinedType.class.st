"
<ISO10303-11-EXPRESS>
ENTITY defined_type 
	SUBTYPE OF ( named_type );
	domain : underlying_type;
DERIVE
	accepted : entity_instance := SELF.accept_defined_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltDefinedType,
	#superclass : #PltNamedType,
	#instVars : [
		'domain'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltDefinedType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltDefinedType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDefinedType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDefinedType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDefinedType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltDefinedType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltDefinedType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltDefinedType >> accept: aVisitor [
  ^aVisitor acceptDefinedType: self


]

{ #category : #'platypus-generated-deriving' }
PltDefinedType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltDefinedType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltDefinedType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptDefinedTypeUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
PltDefinedType >> definedTypeCopyTo: another [
  another fastSetDomain: self domain


]

{ #category : #'platypus-generated-group-accessing' }
PltDefinedType >> definedTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setDomain: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltDefinedType >> definedTypeToValues: values [
  values add: self domain.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltDefinedType >> domain [
  ^domain


]

{ #category : #'platypus-generated-accessing' }
PltDefinedType >> domain: aPltUnderlyingType [
  domain := aPltUnderlyingType


]

{ #category : #'platypus-generated-with-context-accessing' }
PltDefinedType >> domainUsingContext: aContext [
  ^self domain


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltDefinedType >> fastSetDomain: aPltUnderlyingType [
  domain := aPltUnderlyingType


]

{ #category : #'platypus-generated-group-accessing' }
PltDefinedType >> fromValues: values [
  ^self definedTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltDefinedType >> isPltDefinedType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltDefinedType >> localFromValues: values [
  ^self definedTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltDefinedType >> localToValues: values [
  ^self definedTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltDefinedType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltDefinedType >> pltCopyTo: another [
  super pltCopyTo: another.
  self definedTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltDefinedType >> pltLocalCopyTo: another [
  self definedTypeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltDefinedType >> setDomain: aPltUnderlyingType [
  self domain: aPltUnderlyingType


]

{ #category : #'platypus-generated-initializing' }
PltDefinedType >> stepInitialize [
  super stepInitialize.
  domain := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltDefinedType >> toValues: values [
  ^self definedTypeToValues: (super toValues: values)


]
