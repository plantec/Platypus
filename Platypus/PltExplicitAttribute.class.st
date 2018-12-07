"
<ISO10303-11-EXPRESS>
ENTITY explicit_attribute 
	SUBTYPE OF ( attribute );
	optional_flag : BOOLEAN;
DERIVE
	accepted : entity_instance := SELF.accept_explicit_attribute;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltExplicitAttribute,
	#superclass : #PltAttribute,
	#instVars : [
		'optionalFlag'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltExplicitAttribute class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltExplicitAttribute class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExplicitAttribute class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExplicitAttribute class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExplicitAttribute class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltExplicitAttribute class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltExplicitAttribute class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltExplicitAttribute >> accept: aVisitor [
  ^aVisitor acceptExplicitAttribute: self


]

{ #category : #'platypus-generated-deriving' }
PltExplicitAttribute >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltExplicitAttribute >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltExplicitAttribute >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptExplicitAttributeUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
PltExplicitAttribute >> explicitAttributeCopyTo: another [
  another fastSetOptionalFlag: self optionalFlag


]

{ #category : #'platypus-generated-group-accessing' }
PltExplicitAttribute >> explicitAttributeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setOptionalFlag: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltExplicitAttribute >> explicitAttributeToValues: values [
  values add: self optionalFlag.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltExplicitAttribute >> fastSetOptionalFlag: aBoolean [
  optionalFlag := aBoolean


]

{ #category : #'platypus-generated-group-accessing' }
PltExplicitAttribute >> fromValues: values [
  ^self explicitAttributeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltExplicitAttribute >> isPltExplicitAttribute [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltExplicitAttribute >> localFromValues: values [
  ^self explicitAttributeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltExplicitAttribute >> localToValues: values [
  ^self explicitAttributeToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltExplicitAttribute >> optionalFlag [
  ^optionalFlag


]

{ #category : #'platypus-generated-accessing' }
PltExplicitAttribute >> optionalFlag: aBoolean [
  optionalFlag := aBoolean


]

{ #category : #'platypus-generated-with-context-accessing' }
PltExplicitAttribute >> optionalFlagUsingContext: aContext [
  ^self optionalFlag


]

{ #category : #'platypus-generated-copying' }
PltExplicitAttribute >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltExplicitAttribute >> pltCopyTo: another [
  super pltCopyTo: another.
  self explicitAttributeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltExplicitAttribute >> pltLocalCopyTo: another [
  self explicitAttributeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltExplicitAttribute >> setOptionalFlag: aBoolean [
  self optionalFlag: aBoolean


]

{ #category : #'platypus-generated-initializing' }
PltExplicitAttribute >> stepInitialize [
  super stepInitialize.
  optionalFlag := false


]

{ #category : #'platypus-generated-group-accessing' }
PltExplicitAttribute >> toValues: values [
  ^self explicitAttributeToValues: (super toValues: values)


]
