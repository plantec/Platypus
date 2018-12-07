"
<ISO10303-11-EXPRESS>
ENTITY redefined_attribute_value 
	SUBTYPE OF ( missing_value );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltRedefinedAttributeValue,
	#superclass : #PltMissingValue,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltRedefinedAttributeValue class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltRedefinedAttributeValue class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRedefinedAttributeValue class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRedefinedAttributeValue class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRedefinedAttributeValue class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltRedefinedAttributeValue class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltRedefinedAttributeValue class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltRedefinedAttributeValue >> accept: aVisitor [
  ^aVisitor acceptRedefinedAttributeValue: self


]

{ #category : #'platypus-generated-group-accessing' }
PltRedefinedAttributeValue >> fromValues: values [
  ^self redefinedAttributeValueFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltRedefinedAttributeValue >> isPltRedefinedAttributeValue [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltRedefinedAttributeValue >> localFromValues: values [
  ^self redefinedAttributeValueFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltRedefinedAttributeValue >> localToValues: values [
  ^self redefinedAttributeValueToValues: values


]

{ #category : #'platypus-generated-copying' }
PltRedefinedAttributeValue >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltRedefinedAttributeValue >> pltCopyTo: another [
  super pltCopyTo: another.
  self redefinedAttributeValueCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRedefinedAttributeValue >> pltLocalCopyTo: another [
  self redefinedAttributeValueCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRedefinedAttributeValue >> redefinedAttributeValueCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltRedefinedAttributeValue >> redefinedAttributeValueFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltRedefinedAttributeValue >> redefinedAttributeValueToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltRedefinedAttributeValue >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltRedefinedAttributeValue >> toValues: values [
  ^self redefinedAttributeValueToValues: (super toValues: values)


]
