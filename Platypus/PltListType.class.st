"
<ISO10303-11-EXPRESS>
ENTITY list_type 
	SUBTYPE OF ( variable_size_aggregation_type );
	unique_flag : BOOLEAN;
DERIVE
	accepted : entity_instance := SELF.accept_list_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltListType,
	#superclass : #PltVariableSizeAggregationType,
	#instVars : [
		'uniqueFlag'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltListType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltListType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltListType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltListType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltListType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltListType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltListType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltListType >> accept: aVisitor [
  ^aVisitor acceptListType: self


]

{ #category : #'platypus-generated-deriving' }
PltListType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltListType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltListType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptListTypeUsingContext: aContext


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltListType >> fastSetUniqueFlag: aBoolean [
  uniqueFlag := aBoolean


]

{ #category : #'platypus-generated-group-accessing' }
PltListType >> fromValues: values [
  ^self listTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltListType >> isPltListType [
  ^true


]

{ #category : #'platypus-generated-copying' }
PltListType >> listTypeCopyTo: another [
  another fastSetUniqueFlag: self uniqueFlag


]

{ #category : #'platypus-generated-group-accessing' }
PltListType >> listTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setUniqueFlag: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltListType >> listTypeToValues: values [
  values add: self uniqueFlag.
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltListType >> localFromValues: values [
  ^self listTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltListType >> localToValues: values [
  ^self listTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltListType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltListType >> pltCopyTo: another [
  super pltCopyTo: another.
  self listTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltListType >> pltLocalCopyTo: another [
  self listTypeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltListType >> setUniqueFlag: aBoolean [
  self uniqueFlag: aBoolean


]

{ #category : #'platypus-generated-initializing' }
PltListType >> stepInitialize [
  super stepInitialize.
  uniqueFlag := false


]

{ #category : #'platypus-generated-group-accessing' }
PltListType >> toValues: values [
  ^self listTypeToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltListType >> uniqueFlag [
  ^uniqueFlag


]

{ #category : #'platypus-generated-accessing' }
PltListType >> uniqueFlag: aBoolean [
  uniqueFlag := aBoolean


]

{ #category : #'platypus-generated-with-context-accessing' }
PltListType >> uniqueFlagUsingContext: aContext [
  ^self uniqueFlag


]
