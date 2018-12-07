"
<ISO10303-11-EXPRESS>
ENTITY enumeration_value 
	SUBTYPE OF ( qualifier );
	domain : defined_type_reference;
	element : STRING;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEnumerationValue,
	#superclass : #PltQualifier,
	#instVars : [
		'element',
		'domain'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEnumerationValue class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEnumerationValue class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEnumerationValue class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEnumerationValue class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEnumerationValue class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEnumerationValue class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEnumerationValue class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEnumerationValue >> accept: aVisitor [
  ^aVisitor acceptEnumerationValue: self


]

{ #category : #'platypus-generated-accessing' }
PltEnumerationValue >> domain [
  ^domain


]

{ #category : #'platypus-generated-accessing' }
PltEnumerationValue >> domain: aPltDefinedTypeReference [
  domain := aPltDefinedTypeReference


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationValue >> domain: aPltDefinedTypeReference element: aString [ 	self setDomain:aPltDefinedTypeReference.	self setElement:aString.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEnumerationValue >> domainUsingContext: aContext [
  ^self domain


]

{ #category : #'platypus-generated-accessing' }
PltEnumerationValue >> element [
  ^element


]

{ #category : #'platypus-generated-accessing' }
PltEnumerationValue >> element: aString [
  element := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEnumerationValue >> elementUsingContext: aContext [
  ^self element


]

{ #category : #'platypus-generated-copying' }
PltEnumerationValue >> enumerationValueCopyTo: another [
  another fastSetDomain: self domain.
  another fastSetElement: self element


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationValue >> enumerationValueFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setDomain: valuesloc removeFirst.
  self setElement: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationValue >> enumerationValueToValues: values [
  values add: self domain.
  values add: self element.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEnumerationValue >> fastSetDomain: aPltDefinedTypeReference [
  domain := aPltDefinedTypeReference


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEnumerationValue >> fastSetElement: aString [
  element := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationValue >> fromValues: values [
  ^self enumerationValueFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltEnumerationValue >> isPltEnumerationValue [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationValue >> localFromValues: values [
  ^self enumerationValueFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationValue >> localToValues: values [
  ^self enumerationValueToValues: values


]

{ #category : #'platypus-generated-copying' }
PltEnumerationValue >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEnumerationValue >> pltCopyTo: another [
  super pltCopyTo: another.
  self enumerationValueCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEnumerationValue >> pltLocalCopyTo: another [
  self enumerationValueCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltEnumerationValue >> setDomain: aPltDefinedTypeReference [
  self domain: aPltDefinedTypeReference


]

{ #category : #'platypus-generated-set-accessing' }
PltEnumerationValue >> setElement: aString [
  self element: aString


]

{ #category : #'platypus-generated-initializing' }
PltEnumerationValue >> stepInitialize [
  super stepInitialize.
  domain := nil.
  element := ''


]

{ #category : #'platypus-generated-group-accessing' }
PltEnumerationValue >> toValues: values [
  ^self enumerationValueToValues: (super toValues: values)


]
