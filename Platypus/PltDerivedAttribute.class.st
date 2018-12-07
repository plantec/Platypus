"
<ISO10303-11-EXPRESS>
ENTITY derived_attribute 
	SUBTYPE OF ( attribute );
	assign : expression;
DERIVE
	accepted : entity_instance := SELF.accept_derived_attribute;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltDerivedAttribute,
	#superclass : #PltAttribute,
	#instVars : [
		'assign'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltDerivedAttribute class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltDerivedAttribute class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDerivedAttribute class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDerivedAttribute class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltDerivedAttribute class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltDerivedAttribute class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltDerivedAttribute class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltDerivedAttribute >> accept: aVisitor [
  ^aVisitor acceptDerivedAttribute: self


]

{ #category : #'platypus-generated-deriving' }
PltDerivedAttribute >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltDerivedAttribute >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltDerivedAttribute >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptDerivedAttributeUsingContext: aContext


]

{ #category : #'platypus-generated-accessing' }
PltDerivedAttribute >> assign [
  ^assign


]

{ #category : #'platypus-generated-accessing' }
PltDerivedAttribute >> assign: aPltExpression [
  assign := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltDerivedAttribute >> assignUsingContext: aContext [
  ^self assign


]

{ #category : #'platypus-generated-copying' }
PltDerivedAttribute >> derivedAttributeCopyTo: another [
  another fastSetAssign: self assign


]

{ #category : #'platypus-generated-group-accessing' }
PltDerivedAttribute >> derivedAttributeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setAssign: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltDerivedAttribute >> derivedAttributeToValues: values [
  values add: self assign.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltDerivedAttribute >> fastSetAssign: aPltExpression [
  assign := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltDerivedAttribute >> fromValues: values [
  ^self derivedAttributeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltDerivedAttribute >> isPltDerivedAttribute [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltDerivedAttribute >> localFromValues: values [
  ^self derivedAttributeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltDerivedAttribute >> localToValues: values [
  ^self derivedAttributeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltDerivedAttribute >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltDerivedAttribute >> pltCopyTo: another [
  super pltCopyTo: another.
  self derivedAttributeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltDerivedAttribute >> pltLocalCopyTo: another [
  self derivedAttributeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltDerivedAttribute >> setAssign: aPltExpression [
  self assign: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltDerivedAttribute >> stepInitialize [
  super stepInitialize.
  assign := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltDerivedAttribute >> toValues: values [
  ^self derivedAttributeToValues: (super toValues: values)


]
