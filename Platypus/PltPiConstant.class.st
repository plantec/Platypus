"
<ISO10303-11-EXPRESS>
ENTITY pi_constant 
	SUBTYPE OF ( real_literal );
DERIVE
	SELF\real_literal.val : REAL := 3.14159;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltPiConstant,
	#superclass : #PltRealLiteral,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltPiConstant class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltPiConstant class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPiConstant class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPiConstant class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltPiConstant class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltPiConstant class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltPiConstant class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltPiConstant >> accept: aVisitor [
  ^aVisitor acceptPiConstant: self


]

{ #category : #'platypus-generated-group-accessing' }
PltPiConstant >> fromValues: values [
  ^self piConstantFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltPiConstant >> isPltPiConstant [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltPiConstant >> localFromValues: values [
  ^self piConstantFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltPiConstant >> localToValues: values [
  ^self piConstantToValues: values


]

{ #category : #'platypus-generated-copying' }
PltPiConstant >> piConstantCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltPiConstant >> piConstantFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltPiConstant >> piConstantToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltPiConstant >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltPiConstant >> pltCopyTo: another [
  super pltCopyTo: another.
  self piConstantCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltPiConstant >> pltLocalCopyTo: another [
  self piConstantCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltPiConstant >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltPiConstant >> toValues: values [
  ^self piConstantToValues: (super toValues: values)


]

{ #category : #'platypus-generated-deriving' }
PltPiConstant >> val [
  ^self valUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltPiConstant >> valUsingContext: aContext [
  ^self valUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltPiConstant >> valUsingContext: aContext receiver: aReceiver [
  ^3.14159


]
