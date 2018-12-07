"
<ISO10303-11-EXPRESS>
ENTITY array_type 
	SUBTYPE OF ( aggregation_type );
	unique_flag : BOOLEAN;
	optional_flag : BOOLEAN;
	SELF\aggregation_type.lower_bound : bound;
	SELF\aggregation_type.upper_bound : bound;
DERIVE
	accepted : entity_instance := SELF.accept_array_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltArrayType,
	#superclass : #PltAggregationType,
	#instVars : [
		'uniqueFlag',
		'optionalFlag'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltArrayType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltArrayType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltArrayType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltArrayType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltArrayType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltArrayType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltArrayType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltArrayType >> accept: aVisitor [
  ^aVisitor acceptArrayType: self


]

{ #category : #'platypus-generated-deriving' }
PltArrayType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltArrayType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltArrayType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptArrayTypeUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
PltArrayType >> arrayTypeCopyTo: another [
  another fastSetUniqueFlag: self uniqueFlag.
  another fastSetOptionalFlag: self optionalFlag.
  another fastSetLowerBound: self lowerBound.
  another fastSetUpperBound: self upperBound


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayType >> arrayTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setUniqueFlag: valuesloc removeFirst.
  self setOptionalFlag: valuesloc removeFirst.
  self setLowerBound: valuesloc removeFirst.
  self setUpperBound: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayType >> arrayTypeToValues: values [
  values add: self uniqueFlag.
  values add: self optionalFlag.
  values add: self lowerBound.
  values add: self upperBound.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltArrayType >> fastSetLowerBound: aPltBound [
  lowerBound := aPltBound


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltArrayType >> fastSetOptionalFlag: aBoolean [
  optionalFlag := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltArrayType >> fastSetUniqueFlag: aBoolean [
  uniqueFlag := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltArrayType >> fastSetUpperBound: aPltBound [
  upperBound := aPltBound


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayType >> fromValues: values [
  ^self arrayTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltArrayType >> isPltArrayType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayType >> localFromValues: values [
  ^self arrayTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayType >> localToValues: values [
  ^self arrayTypeToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltArrayType >> lowerBound [
  ^lowerBound


]

{ #category : #'platypus-generated-accessing' }
PltArrayType >> lowerBound: aPltBound [
  lowerBound := aPltBound


]

{ #category : #'platypus-generated-with-context-accessing' }
PltArrayType >> lowerBoundUsingContext: aContext [
  ^self lowerBound


]

{ #category : #'platypus-generated-accessing' }
PltArrayType >> optionalFlag [
  ^optionalFlag


]

{ #category : #'platypus-generated-accessing' }
PltArrayType >> optionalFlag: aBoolean [
  optionalFlag := aBoolean


]

{ #category : #'platypus-generated-with-context-accessing' }
PltArrayType >> optionalFlagUsingContext: aContext [
  ^self optionalFlag


]

{ #category : #'platypus-generated-copying' }
PltArrayType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltArrayType >> pltCopyTo: another [
  super pltCopyTo: another.
  self arrayTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltArrayType >> pltLocalCopyTo: another [
  self arrayTypeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltArrayType >> setLowerBound: aPltBound [
  self lowerBound: aPltBound


]

{ #category : #'platypus-generated-set-accessing' }
PltArrayType >> setOptionalFlag: aBoolean [
  self optionalFlag: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
PltArrayType >> setUniqueFlag: aBoolean [
  self uniqueFlag: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
PltArrayType >> setUpperBound: aPltBound [
  self upperBound: aPltBound


]

{ #category : #'platypus-generated-initializing' }
PltArrayType >> stepInitialize [
  super stepInitialize.
  uniqueFlag := false.
  optionalFlag := false.
  lowerBound := nil.
  upperBound := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayType >> toValues: values [
  ^self arrayTypeToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltArrayType >> uniqueFlag [
  ^uniqueFlag


]

{ #category : #'platypus-generated-accessing' }
PltArrayType >> uniqueFlag: aBoolean [
  uniqueFlag := aBoolean


]

{ #category : #'platypus-generated-group-accessing' }
PltArrayType >> uniqueFlag: aBoolean optionalFlag: aBoolean1 lowerBound: aPltBound upperBound: aPltBound1 [
	self setUniqueFlag:aBoolean.
	self setOptionalFlag:aBoolean1.
	self setLowerBound:aPltBound.
	self setUpperBound:aPltBound1.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltArrayType >> uniqueFlagUsingContext: aContext [
  ^self uniqueFlag


]

{ #category : #'platypus-generated-accessing' }
PltArrayType >> upperBound [
  ^upperBound


]

{ #category : #'platypus-generated-accessing' }
PltArrayType >> upperBound: aPltBound [
  upperBound := aPltBound


]

{ #category : #'platypus-generated-with-context-accessing' }
PltArrayType >> upperBoundUsingContext: aContext [
  ^self upperBound


]
