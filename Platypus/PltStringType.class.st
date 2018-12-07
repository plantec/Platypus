"
<ISO10303-11-EXPRESS>
ENTITY string_type 
	SUBTYPE OF ( simple_type );
	width : OPTIONAL bound;
	fixed_width : BOOLEAN;
DERIVE
	accepted : entity_instance := SELF.accept_string_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltStringType,
	#superclass : #PltSimpleType,
	#instVars : [
		'width',
		'fixedWidth'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltStringType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltStringType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltStringType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltStringType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltStringType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltStringType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltStringType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltStringType >> accept: aVisitor [
  ^aVisitor acceptStringType: self


]

{ #category : #'platypus-generated-deriving' }
PltStringType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltStringType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltStringType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptStringTypeUsingContext: aContext


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltStringType >> fastSetFixedWidth: aBoolean [
  fixedWidth := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltStringType >> fastSetWidth: aPltBound [
  width := aPltBound


]

{ #category : #'platypus-generated-accessing' }
PltStringType >> fixedWidth [
  ^fixedWidth


]

{ #category : #'platypus-generated-accessing' }
PltStringType >> fixedWidth: aBoolean [
  fixedWidth := aBoolean


]

{ #category : #'platypus-generated-with-context-accessing' }
PltStringType >> fixedWidthUsingContext: aContext [
  ^self fixedWidth


]

{ #category : #'platypus-generated-group-accessing' }
PltStringType >> fromValues: values [
  ^self stringTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltStringType >> isPltStringType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltStringType >> localFromValues: values [
  ^self stringTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltStringType >> localToValues: values [
  ^self stringTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltStringType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltStringType >> pltCopyTo: another [
  super pltCopyTo: another.
  self stringTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltStringType >> pltLocalCopyTo: another [
  self stringTypeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltStringType >> setFixedWidth: aBoolean [
  self fixedWidth: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
PltStringType >> setWidth: aPltBound [
  self width: aPltBound


]

{ #category : #'platypus-generated-initializing' }
PltStringType >> stepInitialize [
  super stepInitialize.
  width := nil.
  fixedWidth := false


]

{ #category : #'platypus-generated-copying' }
PltStringType >> stringTypeCopyTo: another [
  another fastSetWidth: self width.
  another fastSetFixedWidth: self fixedWidth


]

{ #category : #'platypus-generated-group-accessing' }
PltStringType >> stringTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setWidth: valuesloc removeFirst.
  self setFixedWidth: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltStringType >> stringTypeToValues: values [
  values add: self width.
  values add: self fixedWidth.
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltStringType >> toValues: values [
  ^self stringTypeToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltStringType >> width [
  ^width


]

{ #category : #'platypus-generated-accessing' }
PltStringType >> width: aPltBound [
  width := aPltBound


]

{ #category : #'platypus-generated-group-accessing' }
PltStringType >> width: aPltBound fixedWidth: aBoolean [ 	self setWidth:aPltBound.	self setFixedWidth:aBoolean.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltStringType >> widthUsingContext: aContext [
  ^self width


]
