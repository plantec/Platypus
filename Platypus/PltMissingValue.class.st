"
<ISO10303-11-EXPRESS>
ENTITY missing_value 
	SUBTYPE OF ( unary_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltMissingValue,
	#superclass : #PltUnaryExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltMissingValue class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltMissingValue class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMissingValue class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMissingValue class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMissingValue class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltMissingValue class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltMissingValue class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltMissingValue >> accept: aVisitor [
  ^aVisitor acceptMissingValue: self


]

{ #category : #'platypus-generated-group-accessing' }
PltMissingValue >> fromValues: values [
  ^self missingValueFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltMissingValue >> isPltMissingValue [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltMissingValue >> localFromValues: values [
  ^self missingValueFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltMissingValue >> localToValues: values [
  ^self missingValueToValues: values


]

{ #category : #'platypus-generated-copying' }
PltMissingValue >> missingValueCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltMissingValue >> missingValueFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltMissingValue >> missingValueToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltMissingValue >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltMissingValue >> pltCopyTo: another [
  super pltCopyTo: another.
  self missingValueCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltMissingValue >> pltLocalCopyTo: another [
  self missingValueCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltMissingValue >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltMissingValue >> toValues: values [
  ^self missingValueToValues: (super toValues: values)


]
