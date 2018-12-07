"
<ISO10303-11-EXPRESS>
ENTITY bound 
	ABSTRACT SUPERTYPE OF ( ONEOF ( integer_bound, population_dependent_bound ) ) 
	SUBTYPE OF ( dictionary_instance );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltBound,
	#superclass : #PltDictionaryInstance,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltBound class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltBound class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBound class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBound class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBound class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltBound class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltBound class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltBound >> accept: aVisitor [
  ^aVisitor acceptBound: self


]

{ #category : #'platypus-generated-copying' }
PltBound >> boundCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltBound >> boundFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltBound >> boundToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltBound >> fromValues: values [
  ^self boundFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltBound >> isPltBound [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltBound >> localFromValues: values [
  ^self boundFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltBound >> localToValues: values [
  ^self boundToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltBound >> owner [
	^ owner


]

{ #category : #'platypus-generated-copying' }
PltBound >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltBound >> pltCopyTo: another [
  super pltCopyTo: another.
  self boundCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltBound >> pltLocalCopyTo: another [
  self boundCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltBound >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltBound >> toValues: values [
  ^self boundToValues: (super toValues: values)


]
