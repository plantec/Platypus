"
<ISO10303-11-EXPRESS>
ENTITY binary_literal 
	SUBTYPE OF ( literal );
	val : BINARY;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltBinaryLiteral,
	#superclass : #PltLiteral,
	#instVars : [
		'val'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltBinaryLiteral class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltBinaryLiteral class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBinaryLiteral class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBinaryLiteral class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBinaryLiteral class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltBinaryLiteral class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltBinaryLiteral class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltBinaryLiteral >> accept: aVisitor [
  ^aVisitor acceptBinaryLiteral: self


]

{ #category : #'platypus-generated-copying' }
PltBinaryLiteral >> binaryLiteralCopyTo: another [
  another fastSetVal: self val


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryLiteral >> binaryLiteralFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setVal: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryLiteral >> binaryLiteralToValues: values [
  values add: self val.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltBinaryLiteral >> fastSetVal: aBinary [
  val := aBinary


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryLiteral >> fromValues: values [
  ^self binaryLiteralFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltBinaryLiteral >> isPltBinaryLiteral [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryLiteral >> localFromValues: values [
  ^self binaryLiteralFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryLiteral >> localToValues: values [
  ^self binaryLiteralToValues: values


]

{ #category : #'platypus-generated-copying' }
PltBinaryLiteral >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltBinaryLiteral >> pltCopyTo: another [
  super pltCopyTo: another.
  self binaryLiteralCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltBinaryLiteral >> pltLocalCopyTo: another [
  self binaryLiteralCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltBinaryLiteral >> setVal: aBinary [
  self val: aBinary


]

{ #category : #'platypus-generated-initializing' }
PltBinaryLiteral >> stepInitialize [
  super stepInitialize.
  val := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryLiteral >> toValues: values [
  ^self binaryLiteralToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltBinaryLiteral >> val [
  ^val


]

{ #category : #'platypus-generated-accessing' }
PltBinaryLiteral >> val: aBinary [
  val := aBinary


]

{ #category : #'platypus-generated-with-context-accessing' }
PltBinaryLiteral >> valUsingContext: aContext [
  ^self val


]
