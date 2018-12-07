"
<ISO10303-11-EXPRESS>
ENTITY literal 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( unary_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltLiteral,
	#superclass : #PltUnaryExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltLiteral class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltLiteral class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLiteral class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLiteral class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLiteral class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltLiteral class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltLiteral class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltLiteral >> accept: aVisitor [
  ^aVisitor acceptLiteral: self


]

{ #category : #'platypus-generated-group-accessing' }
PltLiteral >> fromValues: values [
  ^self literalFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltLiteral >> isPltLiteral [
  ^true


]

{ #category : #'platypus-generated-copying' }
PltLiteral >> literalCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltLiteral >> literalFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltLiteral >> literalToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltLiteral >> localFromValues: values [
  ^self literalFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltLiteral >> localToValues: values [
  ^self literalToValues: values


]

{ #category : #'platypus-generated-copying' }
PltLiteral >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltLiteral >> pltCopyTo: another [
  super pltCopyTo: another.
  self literalCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltLiteral >> pltLocalCopyTo: another [
  self literalCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltLiteral >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltLiteral >> toValues: values [
  ^self literalToValues: (super toValues: values)


]
