"
<ISO10303-11-EXPRESS>
ENTITY unknown_constant 
	SUBTYPE OF ( logical_literal );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltUnknownConstant,
	#superclass : #PltLogicalLiteral,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltUnknownConstant class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltUnknownConstant class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUnknownConstant class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUnknownConstant class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUnknownConstant class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltUnknownConstant class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltUnknownConstant class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltUnknownConstant >> accept: aVisitor [
  ^aVisitor acceptUnknownConstant: self


]

{ #category : #'platypus-generated-group-accessing' }
PltUnknownConstant >> fromValues: values [
  ^self unknownConstantFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltUnknownConstant >> isPltUnknownConstant [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltUnknownConstant >> localFromValues: values [
  ^self unknownConstantFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltUnknownConstant >> localToValues: values [
  ^self unknownConstantToValues: values


]

{ #category : #'platypus-generated-copying' }
PltUnknownConstant >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltUnknownConstant >> pltCopyTo: another [
  super pltCopyTo: another.
  self unknownConstantCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltUnknownConstant >> pltLocalCopyTo: another [
  self unknownConstantCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltUnknownConstant >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltUnknownConstant >> toValues: values [
  ^self unknownConstantToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltUnknownConstant >> unknownConstantCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltUnknownConstant >> unknownConstantFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltUnknownConstant >> unknownConstantToValues: values [
  ^values


]
