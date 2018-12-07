"
<ISO10303-11-EXPRESS>
ENTITY string_literal 
	SUBTYPE OF ( literal );
	val : STRING;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltStringLiteral,
	#superclass : #PltLiteral,
	#instVars : [
		'val'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltStringLiteral class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltStringLiteral class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltStringLiteral class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltStringLiteral class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltStringLiteral class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltStringLiteral class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltStringLiteral class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltStringLiteral >> accept: aVisitor [
  ^aVisitor acceptStringLiteral: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltStringLiteral >> fastSetVal: aString [
  val := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltStringLiteral >> fromValues: values [
  ^self stringLiteralFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltStringLiteral >> isPltStringLiteral [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltStringLiteral >> localFromValues: values [
  ^self stringLiteralFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltStringLiteral >> localToValues: values [
  ^self stringLiteralToValues: values


]

{ #category : #'platypus-generated-copying' }
PltStringLiteral >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltStringLiteral >> pltCopyTo: another [
  super pltCopyTo: another.
  self stringLiteralCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltStringLiteral >> pltLocalCopyTo: another [
  self stringLiteralCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltStringLiteral >> setVal: aString [
  self val: aString


]

{ #category : #'platypus-generated-initializing' }
PltStringLiteral >> stepInitialize [
  super stepInitialize.
  val := ''


]

{ #category : #'platypus-generated-copying' }
PltStringLiteral >> stringLiteralCopyTo: another [
  another fastSetVal: self val


]

{ #category : #'platypus-generated-group-accessing' }
PltStringLiteral >> stringLiteralFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setVal: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltStringLiteral >> stringLiteralToValues: values [
  values add: self val.
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltStringLiteral >> toValues: values [
  ^self stringLiteralToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltStringLiteral >> val [
  ^val


]

{ #category : #'platypus-generated-accessing' }
PltStringLiteral >> val: aString [
  val := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltStringLiteral >> valUsingContext: aContext [
  ^self val


]
