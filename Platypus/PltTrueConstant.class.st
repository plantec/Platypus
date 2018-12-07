"
<ISO10303-11-EXPRESS>
ENTITY true_constant 
	SUBTYPE OF ( logical_literal );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltTrueConstant,
	#superclass : #PltLogicalLiteral,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltTrueConstant class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltTrueConstant class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltTrueConstant class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltTrueConstant class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltTrueConstant class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltTrueConstant class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltTrueConstant class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltTrueConstant >> accept: aVisitor [
  ^aVisitor acceptTrueConstant: self


]

{ #category : #'platypus-generated-group-accessing' }
PltTrueConstant >> fromValues: values [
  ^self trueConstantFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltTrueConstant >> isPltTrueConstant [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltTrueConstant >> localFromValues: values [
  ^self trueConstantFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltTrueConstant >> localToValues: values [
  ^self trueConstantToValues: values


]

{ #category : #'platypus-generated-copying' }
PltTrueConstant >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltTrueConstant >> pltCopyTo: another [
  super pltCopyTo: another.
  self trueConstantCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltTrueConstant >> pltLocalCopyTo: another [
  self trueConstantCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltTrueConstant >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltTrueConstant >> toValues: values [
  ^self trueConstantToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltTrueConstant >> trueConstantCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltTrueConstant >> trueConstantFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltTrueConstant >> trueConstantToValues: values [
  ^values


]
