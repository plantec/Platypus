"
<ISO10303-11-EXPRESS>
ENTITY false_constant 
	SUBTYPE OF ( logical_literal );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltFalseConstant,
	#superclass : #PltLogicalLiteral,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltFalseConstant class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltFalseConstant class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFalseConstant class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFalseConstant class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFalseConstant class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltFalseConstant class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltFalseConstant class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltFalseConstant >> accept: aVisitor [
  ^aVisitor acceptFalseConstant: self


]

{ #category : #'platypus-generated-copying' }
PltFalseConstant >> falseConstantCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltFalseConstant >> falseConstantFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltFalseConstant >> falseConstantToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltFalseConstant >> fromValues: values [
  ^self falseConstantFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltFalseConstant >> isPltFalseConstant [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltFalseConstant >> localFromValues: values [
  ^self falseConstantFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltFalseConstant >> localToValues: values [
  ^self falseConstantToValues: values


]

{ #category : #'platypus-generated-copying' }
PltFalseConstant >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltFalseConstant >> pltCopyTo: another [
  super pltCopyTo: another.
  self falseConstantCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltFalseConstant >> pltLocalCopyTo: another [
  self falseConstantCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltFalseConstant >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltFalseConstant >> toValues: values [
  ^self falseConstantToValues: (super toValues: values)


]
