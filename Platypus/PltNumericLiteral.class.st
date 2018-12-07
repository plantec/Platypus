"
<ISO10303-11-EXPRESS>
ENTITY numeric_literal 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( literal );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNumericLiteral,
	#superclass : #PltLiteral,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltNumericLiteral class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltNumericLiteral class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNumericLiteral class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNumericLiteral class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNumericLiteral class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNumericLiteral class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNumericLiteral class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltNumericLiteral >> accept: aVisitor [
  ^aVisitor acceptNumericLiteral: self


]

{ #category : #'platypus-generated-group-accessing' }
PltNumericLiteral >> fromValues: values [
  ^self numericLiteralFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltNumericLiteral >> isPltNumericLiteral [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltNumericLiteral >> localFromValues: values [
  ^self numericLiteralFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltNumericLiteral >> localToValues: values [
  ^self numericLiteralToValues: values


]

{ #category : #'platypus-generated-copying' }
PltNumericLiteral >> numericLiteralCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltNumericLiteral >> numericLiteralFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltNumericLiteral >> numericLiteralToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltNumericLiteral >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltNumericLiteral >> pltCopyTo: another [
  super pltCopyTo: another.
  self numericLiteralCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltNumericLiteral >> pltLocalCopyTo: another [
  self numericLiteralCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltNumericLiteral >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltNumericLiteral >> toValues: values [
  ^self numericLiteralToValues: (super toValues: values)


]
