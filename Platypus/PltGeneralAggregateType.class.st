"
<ISO10303-11-EXPRESS>
ENTITY general_aggregate_type 
	SUBTYPE OF ( aggregate_type );
	type_label : OPTIONAL STRING;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltGeneralAggregateType,
	#superclass : #PltAggregateType,
	#instVars : [
		'typeLabel'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltGeneralAggregateType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltGeneralAggregateType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGeneralAggregateType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGeneralAggregateType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGeneralAggregateType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltGeneralAggregateType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltGeneralAggregateType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltGeneralAggregateType >> accept: aVisitor [
  ^aVisitor acceptGeneralAggregateType: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltGeneralAggregateType >> fastSetTypeLabel: aString [
  typeLabel := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltGeneralAggregateType >> fromValues: values [
  ^self generalAggregateTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltGeneralAggregateType >> generalAggregateTypeCopyTo: another [
  another fastSetTypeLabel: self typeLabel


]

{ #category : #'platypus-generated-group-accessing' }
PltGeneralAggregateType >> generalAggregateTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setTypeLabel: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltGeneralAggregateType >> generalAggregateTypeToValues: values [
  values add: self typeLabel.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltGeneralAggregateType >> isPltGeneralAggregateType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltGeneralAggregateType >> localFromValues: values [
  ^self generalAggregateTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltGeneralAggregateType >> localToValues: values [
  ^self generalAggregateTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltGeneralAggregateType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltGeneralAggregateType >> pltCopyTo: another [
  super pltCopyTo: another.
  self generalAggregateTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltGeneralAggregateType >> pltLocalCopyTo: another [
  self generalAggregateTypeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltGeneralAggregateType >> setTypeLabel: aString [
  self typeLabel: aString


]

{ #category : #'platypus-generated-initializing' }
PltGeneralAggregateType >> stepInitialize [
  super stepInitialize.
  typeLabel := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltGeneralAggregateType >> toValues: values [
  ^self generalAggregateTypeToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltGeneralAggregateType >> typeLabel [
  ^typeLabel


]

{ #category : #'platypus-generated-accessing' }
PltGeneralAggregateType >> typeLabel: aString [
  typeLabel := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltGeneralAggregateType >> typeLabelUsingContext: aContext [
  ^self typeLabel


]
