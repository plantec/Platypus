"
<ISO10303-11-EXPRESS>
ENTITY binary_type 
	SUBTYPE OF ( simple_type );
	width : OPTIONAL bound;
	fixed_width : BOOLEAN;
DERIVE
	accepted : entity_instance := SELF.accept_binary_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltBinaryType,
	#superclass : #PltSimpleType,
	#instVars : [
		'width',
		'fixedWidth'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltBinaryType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltBinaryType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBinaryType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBinaryType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBinaryType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltBinaryType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltBinaryType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltBinaryType >> accept: aVisitor [
  ^aVisitor acceptBinaryType: self


]

{ #category : #'platypus-generated-deriving' }
PltBinaryType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltBinaryType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltBinaryType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptBinaryTypeUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
PltBinaryType >> binaryTypeCopyTo: another [
  another fastSetWidth: self width.
  another fastSetFixedWidth: self fixedWidth


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryType >> binaryTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setWidth: valuesloc removeFirst.
  self setFixedWidth: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryType >> binaryTypeToValues: values [
  values add: self width.
  values add: self fixedWidth.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltBinaryType >> fastSetFixedWidth: aBoolean [
  fixedWidth := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltBinaryType >> fastSetWidth: aPltBound [
  width := aPltBound


]

{ #category : #'platypus-generated-accessing' }
PltBinaryType >> fixedWidth [
  ^fixedWidth


]

{ #category : #'platypus-generated-accessing' }
PltBinaryType >> fixedWidth: aBoolean [
  fixedWidth := aBoolean


]

{ #category : #'platypus-generated-with-context-accessing' }
PltBinaryType >> fixedWidthUsingContext: aContext [
  ^self fixedWidth


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryType >> fromValues: values [
  ^self binaryTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltBinaryType >> isPltBinaryType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryType >> localFromValues: values [
  ^self binaryTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryType >> localToValues: values [
  ^self binaryTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltBinaryType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltBinaryType >> pltCopyTo: another [
  super pltCopyTo: another.
  self binaryTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltBinaryType >> pltLocalCopyTo: another [
  self binaryTypeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltBinaryType >> setFixedWidth: aBoolean [
  self fixedWidth: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
PltBinaryType >> setWidth: aPltBound [
  self width: aPltBound


]

{ #category : #'platypus-generated-initializing' }
PltBinaryType >> stepInitialize [
  super stepInitialize.
  width := nil.
  fixedWidth := false


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryType >> toValues: values [
  ^self binaryTypeToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltBinaryType >> width [
  ^width


]

{ #category : #'platypus-generated-accessing' }
PltBinaryType >> width: aPltBound [
  width := aPltBound


]

{ #category : #'platypus-generated-group-accessing' }
PltBinaryType >> width: aPltBound fixedWidth: aBoolean [ 	self setWidth:aPltBound.	self setFixedWidth:aBoolean.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltBinaryType >> widthUsingContext: aContext [
  ^self width


]
