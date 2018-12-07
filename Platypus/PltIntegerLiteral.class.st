"
<ISO10303-11-EXPRESS>
ENTITY integer_literal 
	SUBTYPE OF ( numeric_literal );
	val : INTEGER;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltIntegerLiteral,
	#superclass : #PltNumericLiteral,
	#instVars : [
		'val'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltIntegerLiteral class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltIntegerLiteral class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIntegerLiteral class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIntegerLiteral class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIntegerLiteral class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltIntegerLiteral class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltIntegerLiteral class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltIntegerLiteral >> accept: aVisitor [
  ^aVisitor acceptIntegerLiteral: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIntegerLiteral >> fastSetVal: anInteger [
  val := anInteger


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerLiteral >> fromValues: values [
  ^self integerLiteralFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltIntegerLiteral >> integerLiteralCopyTo: another [
  another fastSetVal: self val


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerLiteral >> integerLiteralFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setVal: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerLiteral >> integerLiteralToValues: values [
  values add: self val.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltIntegerLiteral >> isPltIntegerLiteral [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerLiteral >> localFromValues: values [
  ^self integerLiteralFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerLiteral >> localToValues: values [
  ^self integerLiteralToValues: values


]

{ #category : #'platypus-generated-copying' }
PltIntegerLiteral >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltIntegerLiteral >> pltCopyTo: another [
  super pltCopyTo: another.
  self integerLiteralCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltIntegerLiteral >> pltLocalCopyTo: another [
  self integerLiteralCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltIntegerLiteral >> setVal: anInteger [
  self val: anInteger


]

{ #category : #'platypus-generated-initializing' }
PltIntegerLiteral >> stepInitialize [
  super stepInitialize.
  val := 0


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerLiteral >> toValues: values [
  ^self integerLiteralToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltIntegerLiteral >> val [
  ^val


]

{ #category : #'platypus-generated-accessing' }
PltIntegerLiteral >> val: anInteger [
  val := anInteger


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIntegerLiteral >> valUsingContext: aContext [
  ^self val


]
