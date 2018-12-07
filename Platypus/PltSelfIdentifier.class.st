"
<ISO10303-11-EXPRESS>
ENTITY self_identifier 
	SUBTYPE OF ( unary_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSelfIdentifier,
	#superclass : #PltUnaryExpression,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSelfIdentifier class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSelfIdentifier class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSelfIdentifier class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSelfIdentifier class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSelfIdentifier class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSelfIdentifier class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSelfIdentifier class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSelfIdentifier >> accept: aVisitor [
  ^aVisitor acceptSelfIdentifier: self


]

{ #category : #'platypus-generated-group-accessing' }
PltSelfIdentifier >> fromValues: values [
  ^self selfIdentifierFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSelfIdentifier >> isPltSelfIdentifier [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSelfIdentifier >> localFromValues: values [
  ^self selfIdentifierFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSelfIdentifier >> localToValues: values [
  ^self selfIdentifierToValues: values


]

{ #category : #'platypus-generated-copying' }
PltSelfIdentifier >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSelfIdentifier >> pltCopyTo: another [
  super pltCopyTo: another.
  self selfIdentifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSelfIdentifier >> pltLocalCopyTo: another [
  self selfIdentifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSelfIdentifier >> selfIdentifierCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltSelfIdentifier >> selfIdentifierFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSelfIdentifier >> selfIdentifierToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltSelfIdentifier >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltSelfIdentifier >> toValues: values [
  ^self selfIdentifierToValues: (super toValues: values)


]
