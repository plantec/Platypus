"
<ISO10303-11-EXPRESS>
ENTITY index_qualifier 
	SUBTYPE OF ( qualifier );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltIndexQualifier,
	#superclass : #PltQualifier,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltIndexQualifier class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltIndexQualifier class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIndexQualifier class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIndexQualifier class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIndexQualifier class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltIndexQualifier class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltIndexQualifier class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltIndexQualifier >> accept: aVisitor [
  ^aVisitor acceptIndexQualifier: self


]

{ #category : #'platypus-generated-group-accessing' }
PltIndexQualifier >> fromValues: values [
  ^self indexQualifierFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltIndexQualifier >> indexQualifierCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltIndexQualifier >> indexQualifierFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltIndexQualifier >> indexQualifierToValues: values [
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltIndexQualifier >> isPltIndexQualifier [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltIndexQualifier >> localFromValues: values [
  ^self indexQualifierFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltIndexQualifier >> localToValues: values [
  ^self indexQualifierToValues: values


]

{ #category : #'platypus-generated-copying' }
PltIndexQualifier >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltIndexQualifier >> pltCopyTo: another [
  super pltCopyTo: another.
  self indexQualifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltIndexQualifier >> pltLocalCopyTo: another [
  self indexQualifierCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltIndexQualifier >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltIndexQualifier >> toValues: values [
  ^self indexQualifierToValues: (super toValues: values)


]
