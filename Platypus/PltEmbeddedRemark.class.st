"
<ISO10303-11-EXPRESS>
ENTITY embedded_remark 
	SUBTYPE OF ( remark );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEmbeddedRemark,
	#superclass : #PltRemark,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEmbeddedRemark class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEmbeddedRemark class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEmbeddedRemark class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEmbeddedRemark class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEmbeddedRemark class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEmbeddedRemark class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEmbeddedRemark class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEmbeddedRemark >> accept: aVisitor [
  ^aVisitor acceptEmbeddedRemark: self


]

{ #category : #'platypus-generated-copying' }
PltEmbeddedRemark >> embeddedRemarkCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltEmbeddedRemark >> embeddedRemarkFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEmbeddedRemark >> embeddedRemarkToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltEmbeddedRemark >> fromValues: values [
  ^self embeddedRemarkFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltEmbeddedRemark >> isPltEmbeddedRemark [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEmbeddedRemark >> localFromValues: values [
  ^self embeddedRemarkFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEmbeddedRemark >> localToValues: values [
  ^self embeddedRemarkToValues: values


]

{ #category : #'platypus-generated-copying' }
PltEmbeddedRemark >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEmbeddedRemark >> pltCopyTo: another [
  super pltCopyTo: another.
  self embeddedRemarkCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEmbeddedRemark >> pltLocalCopyTo: another [
  self embeddedRemarkCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltEmbeddedRemark >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltEmbeddedRemark >> toValues: values [
  ^self embeddedRemarkToValues: (super toValues: values)


]
