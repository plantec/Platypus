"
<ISO10303-11-EXPRESS>
ENTITY and_supertype 
	SUBTYPE OF ( binary_supertype_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAndSupertype,
	#superclass : #PltBinarySupertypeExpression,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAndSupertype class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAndSupertype class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAndSupertype class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAndSupertype class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAndSupertype class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAndSupertype class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAndSupertype class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAndSupertype >> accept: aVisitor [
  ^aVisitor acceptAndSupertype: self


]

{ #category : #'platypus-generated-copying' }
PltAndSupertype >> andSupertypeCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltAndSupertype >> andSupertypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAndSupertype >> andSupertypeToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltAndSupertype >> fromValues: values [
  ^self andSupertypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAndSupertype >> isPltAndSupertype [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAndSupertype >> localFromValues: values [
  ^self andSupertypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAndSupertype >> localToValues: values [
  ^self andSupertypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAndSupertype >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAndSupertype >> pltCopyTo: another [
  super pltCopyTo: another.
  self andSupertypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAndSupertype >> pltLocalCopyTo: another [
  self andSupertypeCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltAndSupertype >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltAndSupertype >> toValues: values [
  ^self andSupertypeToValues: (super toValues: values)


]
