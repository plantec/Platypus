"
<ISO10303-11-EXPRESS>
ENTITY real_literal 
	SUBTYPE OF ( numeric_literal );
	val : REAL;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltRealLiteral,
	#superclass : #PltNumericLiteral,
	#instVars : [
		'val'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltRealLiteral class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltRealLiteral class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRealLiteral class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRealLiteral class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRealLiteral class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltRealLiteral class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltRealLiteral class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltRealLiteral >> accept: aVisitor [
  ^aVisitor acceptRealLiteral: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRealLiteral >> fastSetVal: aReal [
  val := aReal


]

{ #category : #'platypus-generated-group-accessing' }
PltRealLiteral >> fromValues: values [
  ^self realLiteralFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltRealLiteral >> isPltRealLiteral [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltRealLiteral >> localFromValues: values [
  ^self realLiteralFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltRealLiteral >> localToValues: values [
  ^self realLiteralToValues: values


]

{ #category : #'platypus-generated-copying' }
PltRealLiteral >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltRealLiteral >> pltCopyTo: another [
  super pltCopyTo: another.
  self realLiteralCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRealLiteral >> pltLocalCopyTo: another [
  self realLiteralCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRealLiteral >> realLiteralCopyTo: another [
  another fastSetVal: self val


]

{ #category : #'platypus-generated-group-accessing' }
PltRealLiteral >> realLiteralFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setVal: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltRealLiteral >> realLiteralToValues: values [
  values add: self val.
  ^values


]

{ #category : #'platypus-generated-set-accessing' }
PltRealLiteral >> setVal: aReal [
  self val: aReal


]

{ #category : #'platypus-generated-initializing' }
PltRealLiteral >> stepInitialize [
  super stepInitialize.
  val := 0.0


]

{ #category : #'platypus-generated-group-accessing' }
PltRealLiteral >> toValues: values [
  ^self realLiteralToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltRealLiteral >> val [
  ^val


]

{ #category : #'platypus-generated-accessing' }
PltRealLiteral >> val: aReal [
  val := aReal


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRealLiteral >> valUsingContext: aContext [
  ^self val


]
