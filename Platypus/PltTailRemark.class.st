"
<ISO10303-11-EXPRESS>
ENTITY tail_remark 
	SUBTYPE OF ( remark );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltTailRemark,
	#superclass : #PltRemark,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltTailRemark class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltTailRemark class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltTailRemark class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltTailRemark class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltTailRemark class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltTailRemark class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltTailRemark class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltTailRemark >> accept: aVisitor [
  ^aVisitor acceptTailRemark: self


]

{ #category : #'platypus-generated-group-accessing' }
PltTailRemark >> fromValues: values [
  ^self tailRemarkFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltTailRemark >> isPltTailRemark [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltTailRemark >> localFromValues: values [
  ^self tailRemarkFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltTailRemark >> localToValues: values [
  ^self tailRemarkToValues: values


]

{ #category : #'platypus-generated-copying' }
PltTailRemark >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltTailRemark >> pltCopyTo: another [
  super pltCopyTo: another.
  self tailRemarkCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltTailRemark >> pltLocalCopyTo: another [
  self tailRemarkCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltTailRemark >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-copying' }
PltTailRemark >> tailRemarkCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltTailRemark >> tailRemarkFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltTailRemark >> tailRemarkToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltTailRemark >> toValues: values [
  ^self tailRemarkToValues: (super toValues: values)


]
