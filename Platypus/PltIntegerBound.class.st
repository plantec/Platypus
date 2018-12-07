"
<ISO10303-11-EXPRESS>
ENTITY integer_bound 
	SUBTYPE OF ( bound );
	bound_value : INTEGER;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltIntegerBound,
	#superclass : #PltBound,
	#instVars : [
		'boundValue'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltIntegerBound class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltIntegerBound class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIntegerBound class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIntegerBound class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIntegerBound class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltIntegerBound class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltIntegerBound class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltIntegerBound >> accept: aVisitor [
  ^aVisitor acceptIntegerBound: self


]

{ #category : #'platypus-generated-accessing' }
PltIntegerBound >> boundValue [
  ^boundValue


]

{ #category : #'platypus-generated-accessing' }
PltIntegerBound >> boundValue: anInteger [
  boundValue := anInteger


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIntegerBound >> boundValueUsingContext: aContext [
  ^self boundValue


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIntegerBound >> fastSetBoundValue: anInteger [
  boundValue := anInteger


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerBound >> fromValues: values [
  ^self integerBoundFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltIntegerBound >> integerBoundCopyTo: another [
  another fastSetBoundValue: self boundValue


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerBound >> integerBoundFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setBoundValue: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerBound >> integerBoundToValues: values [
  values add: self boundValue.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltIntegerBound >> isPltIntegerBound [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerBound >> localFromValues: values [
  ^self integerBoundFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerBound >> localToValues: values [
  ^self integerBoundToValues: values


]

{ #category : #'platypus-generated-copying' }
PltIntegerBound >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltIntegerBound >> pltCopyTo: another [
  super pltCopyTo: another.
  self integerBoundCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltIntegerBound >> pltLocalCopyTo: another [
  self integerBoundCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltIntegerBound >> setBoundValue: anInteger [
  self boundValue: anInteger


]

{ #category : #'platypus-generated-initializing' }
PltIntegerBound >> stepInitialize [
  super stepInitialize.
  boundValue := 0


]

{ #category : #'platypus-generated-group-accessing' }
PltIntegerBound >> toValues: values [
  ^self integerBoundToValues: (super toValues: values)


]
