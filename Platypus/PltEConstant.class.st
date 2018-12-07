"
<ISO10303-11-EXPRESS>
ENTITY e_constant 
	SUBTYPE OF ( real_literal );
DERIVE
	SELF\real_literal.val : REAL := 2.71828;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEConstant,
	#superclass : #PltRealLiteral,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEConstant class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEConstant class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEConstant class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEConstant class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEConstant class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEConstant class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEConstant class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEConstant >> accept: aVisitor [
  ^aVisitor acceptEConstant: self


]

{ #category : #'platypus-generated-copying' }
PltEConstant >> eConstantCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltEConstant >> eConstantFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEConstant >> eConstantToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltEConstant >> fromValues: values [
  ^self eConstantFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltEConstant >> isPltEConstant [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEConstant >> localFromValues: values [
  ^self eConstantFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEConstant >> localToValues: values [
  ^self eConstantToValues: values


]

{ #category : #'platypus-generated-copying' }
PltEConstant >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEConstant >> pltCopyTo: another [
  super pltCopyTo: another.
  self eConstantCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEConstant >> pltLocalCopyTo: another [
  self eConstantCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltEConstant >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltEConstant >> toValues: values [
  ^self eConstantToValues: (super toValues: values)


]

{ #category : #'platypus-generated-deriving' }
PltEConstant >> val [
  ^self valUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltEConstant >> valUsingContext: aContext [
  ^self valUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltEConstant >> valUsingContext: aContext receiver: aReceiver [
  ^2.71828


]
