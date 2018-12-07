"
<ISO10303-11-EXPRESS>
ENTITY remark 
	ABSTRACT SUPERTYPE OF ( ONEOF ( tail_remark, embedded_remark ) ) 
	SUBTYPE OF ( entity_instance );
	text : STRING;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltRemark,
	#superclass : #PltEntityInstance,
	#instVars : [
		'text'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltRemark class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltRemark class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRemark class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRemark class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRemark class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltRemark class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltRemark class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltRemark >> accept: aVisitor [
  ^aVisitor acceptRemark: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRemark >> fastSetText: aString [
  text := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltRemark >> fromValues: values [
  ^self remarkFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltRemark >> isPltRemark [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltRemark >> localFromValues: values [
  ^self remarkFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltRemark >> localToValues: values [
  ^self remarkToValues: values


]

{ #category : #'platypus-generated-copying' }
PltRemark >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltRemark >> pltCopyTo: another [
  super pltCopyTo: another.
  self remarkCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRemark >> pltLocalCopyTo: another [
  self remarkCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRemark >> remarkCopyTo: another [
  another fastSetText: self text


]

{ #category : #'platypus-generated-group-accessing' }
PltRemark >> remarkFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setText: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltRemark >> remarkToValues: values [
  values add: self text.
  ^values


]

{ #category : #'platypus-generated-set-accessing' }
PltRemark >> setText: aString [
  self text: aString


]

{ #category : #'platypus-generated-initializing' }
PltRemark >> stepInitialize [
  super stepInitialize.
  text := ''


]

{ #category : #'platypus-generated-accessing' }
PltRemark >> text [
  ^text


]

{ #category : #'platypus-generated-accessing' }
PltRemark >> text: aString [
  text := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRemark >> textUsingContext: aContext [
  ^self text


]

{ #category : #'platypus-generated-group-accessing' }
PltRemark >> toValues: values [
  ^self remarkToValues: (super toValues: values)


]
