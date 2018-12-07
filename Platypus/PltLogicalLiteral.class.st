"
<ISO10303-11-EXPRESS>
ENTITY logical_literal 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( literal );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltLogicalLiteral,
	#superclass : #PltLiteral,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltLogicalLiteral class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltLogicalLiteral class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLogicalLiteral class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLogicalLiteral class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLogicalLiteral class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltLogicalLiteral class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltLogicalLiteral class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltLogicalLiteral >> accept: aVisitor [
  ^aVisitor acceptLogicalLiteral: self


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalLiteral >> fromValues: values [
  ^self logicalLiteralFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltLogicalLiteral >> isPltLogicalLiteral [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalLiteral >> localFromValues: values [
  ^self logicalLiteralFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalLiteral >> localToValues: values [
  ^self logicalLiteralToValues: values


]

{ #category : #'platypus-generated-copying' }
PltLogicalLiteral >> logicalLiteralCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalLiteral >> logicalLiteralFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalLiteral >> logicalLiteralToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltLogicalLiteral >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltLogicalLiteral >> pltCopyTo: another [
  super pltCopyTo: another.
  self logicalLiteralCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltLogicalLiteral >> pltLocalCopyTo: another [
  self logicalLiteralCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltLogicalLiteral >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltLogicalLiteral >> toValues: values [
  ^self logicalLiteralToValues: (super toValues: values)


]
