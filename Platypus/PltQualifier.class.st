"
<ISO10303-11-EXPRESS>
ENTITY qualifier 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( unary_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltQualifier,
	#superclass : #PltUnaryExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltQualifier class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltQualifier class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltQualifier class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltQualifier class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltQualifier class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltQualifier class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltQualifier class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltQualifier >> accept: aVisitor [
  ^aVisitor acceptQualifier: self


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifier >> fromValues: values [
  ^self qualifierFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltQualifier >> isPltQualifier [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifier >> localFromValues: values [
  ^self qualifierFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifier >> localToValues: values [
  ^self qualifierToValues: values


]

{ #category : #'platypus-generated-copying' }
PltQualifier >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltQualifier >> pltCopyTo: another [
  super pltCopyTo: another.
  self qualifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltQualifier >> pltLocalCopyTo: another [
  self qualifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltQualifier >> qualifierCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifier >> qualifierFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifier >> qualifierToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltQualifier >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltQualifier >> toValues: values [
  ^self qualifierToValues: (super toValues: values)


]
