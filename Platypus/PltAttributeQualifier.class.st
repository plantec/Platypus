"
<ISO10303-11-EXPRESS>
ENTITY attribute_qualifier 
	SUBTYPE OF ( qualifier );
	attribute_name : STRING;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAttributeQualifier,
	#superclass : #PltQualifier,
	#instVars : [
		'attributeName'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAttributeQualifier class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAttributeQualifier class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAttributeQualifier class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAttributeQualifier class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAttributeQualifier class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAttributeQualifier class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAttributeQualifier class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAttributeQualifier >> accept: aVisitor [
  ^aVisitor acceptAttributeQualifier: self


]

{ #category : #'platypus-generated-accessing' }
PltAttributeQualifier >> attributeName [
  ^attributeName


]

{ #category : #'platypus-generated-accessing' }
PltAttributeQualifier >> attributeName: aString [
  attributeName := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAttributeQualifier >> attributeNameUsingContext: aContext [
  ^self attributeName


]

{ #category : #'platypus-generated-copying' }
PltAttributeQualifier >> attributeQualifierCopyTo: another [
  another fastSetAttributeName: self attributeName


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeQualifier >> attributeQualifierFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setAttributeName: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeQualifier >> attributeQualifierToValues: values [
  values add: self attributeName.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAttributeQualifier >> fastSetAttributeName: aString [
  attributeName := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeQualifier >> fromValues: values [
  ^self attributeQualifierFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAttributeQualifier >> isPltAttributeQualifier [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeQualifier >> localFromValues: values [
  ^self attributeQualifierFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeQualifier >> localToValues: values [
  ^self attributeQualifierToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAttributeQualifier >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAttributeQualifier >> pltCopyTo: another [
  super pltCopyTo: another.
  self attributeQualifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAttributeQualifier >> pltLocalCopyTo: another [
  self attributeQualifierCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltAttributeQualifier >> setAttributeName: aString [
  self attributeName: aString


]

{ #category : #'platypus-generated-initializing' }
PltAttributeQualifier >> stepInitialize [
  super stepInitialize.
  attributeName := ''


]

{ #category : #'platypus-generated-group-accessing' }
PltAttributeQualifier >> toValues: values [
  ^self attributeQualifierToValues: (super toValues: values)


]
