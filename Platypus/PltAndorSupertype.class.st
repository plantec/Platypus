"
<ISO10303-11-EXPRESS>
ENTITY andor_supertype 
	SUBTYPE OF ( binary_supertype_expression );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAndorSupertype,
	#superclass : #PltBinarySupertypeExpression,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAndorSupertype class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAndorSupertype class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAndorSupertype class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAndorSupertype class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAndorSupertype class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAndorSupertype class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAndorSupertype class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAndorSupertype >> accept: aVisitor [
  ^aVisitor acceptAndorSupertype: self


]

{ #category : #'platypus-generated-copying' }
PltAndorSupertype >> andorSupertypeCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltAndorSupertype >> andorSupertypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAndorSupertype >> andorSupertypeToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltAndorSupertype >> fromValues: values [
  ^self andorSupertypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAndorSupertype >> isPltAndorSupertype [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAndorSupertype >> localFromValues: values [
  ^self andorSupertypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAndorSupertype >> localToValues: values [
  ^self andorSupertypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAndorSupertype >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAndorSupertype >> pltCopyTo: another [
  super pltCopyTo: another.
  self andorSupertypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAndorSupertype >> pltLocalCopyTo: another [
  self andorSupertypeCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltAndorSupertype >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltAndorSupertype >> toValues: values [
  ^self andorSupertypeToValues: (super toValues: values)


]
