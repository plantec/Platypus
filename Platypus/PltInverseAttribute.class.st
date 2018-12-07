"
<ISO10303-11-EXPRESS>
ENTITY inverse_attribute 
	SUBTYPE OF ( attribute );
	inverted_attr : attribute_reference;
	min_cardinality : OPTIONAL bound;
	max_cardinality : OPTIONAL bound;
	duplicates : BOOLEAN;
DERIVE
	SELF\attribute.domain : entity_definition_reference := inverted_attr.entity_ref;
	accepted : entity_instance := SELF.accept_inverse_attribute;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltInverseAttribute,
	#superclass : #PltAttribute,
	#instVars : [
		'maxCardinality',
		'minCardinality',
		'duplicates',
		'invertedAttr'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltInverseAttribute class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltInverseAttribute class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInverseAttribute class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInverseAttribute class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInverseAttribute class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltInverseAttribute class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltInverseAttribute class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltInverseAttribute >> accept: aVisitor [
  ^aVisitor acceptInverseAttribute: self


]

{ #category : #'platypus-generated-deriving' }
PltInverseAttribute >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltInverseAttribute >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltInverseAttribute >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptInverseAttributeUsingContext: aContext


]

{ #category : #'platypus-generated-deriving' }
PltInverseAttribute >> domain [
  ^self domainUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltInverseAttribute >> domainUsingContext: aContext [
  ^self domainUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltInverseAttribute >> domainUsingContext: aContext receiver: aReceiver [
  ^aReceiver invertedAttr entityRefUsingContext: aContext


]

{ #category : #'platypus-generated-accessing' }
PltInverseAttribute >> duplicates [
  ^duplicates


]

{ #category : #'platypus-generated-accessing' }
PltInverseAttribute >> duplicates: aBoolean [
  duplicates := aBoolean


]

{ #category : #'platypus-generated-with-context-accessing' }
PltInverseAttribute >> duplicatesUsingContext: aContext [
  ^self duplicates


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltInverseAttribute >> fastSetDuplicates: aBoolean [
  duplicates := aBoolean


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltInverseAttribute >> fastSetInvertedAttr: aPltAttributeReference [
  invertedAttr := aPltAttributeReference


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltInverseAttribute >> fastSetMaxCardinality: aPltBound [
  maxCardinality := aPltBound


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltInverseAttribute >> fastSetMinCardinality: aPltBound [
  minCardinality := aPltBound


]

{ #category : #'platypus-generated-group-accessing' }
PltInverseAttribute >> fromValues: values [
  ^self inverseAttributeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltInverseAttribute >> inverseAttributeCopyTo: another [
  another fastSetInvertedAttr: self invertedAttr.
  another fastSetMinCardinality: self minCardinality.
  another fastSetMaxCardinality: self maxCardinality.
  another fastSetDuplicates: self duplicates


]

{ #category : #'platypus-generated-group-accessing' }
PltInverseAttribute >> inverseAttributeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setInvertedAttr: valuesloc removeFirst.
  self setMinCardinality: valuesloc removeFirst.
  self setMaxCardinality: valuesloc removeFirst.
  self setDuplicates: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltInverseAttribute >> inverseAttributeToValues: values [
  values add: self invertedAttr.
  values add: self minCardinality.
  values add: self maxCardinality.
  values add: self duplicates.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltInverseAttribute >> invertedAttr [
  ^invertedAttr


]

{ #category : #'platypus-generated-accessing' }
PltInverseAttribute >> invertedAttr: aPltAttributeReference [
  invertedAttr := aPltAttributeReference


]

{ #category : #'platypus-generated-group-accessing' }
PltInverseAttribute >> invertedAttr: aPltAttributeReference minCardinality: aPltBound maxCardinality: aPltBound1 duplicates: aBoolean [ 	self setInvertedAttr:aPltAttributeReference.	self setMinCardinality:aPltBound.	self setMaxCardinality:aPltBound1.	self setDuplicates:aBoolean.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltInverseAttribute >> invertedAttrUsingContext: aContext [
  ^self invertedAttr


]

{ #category : #'platypus-generated-classifying' }
PltInverseAttribute >> isPltInverseAttribute [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltInverseAttribute >> localFromValues: values [
  ^self inverseAttributeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltInverseAttribute >> localToValues: values [
  ^self inverseAttributeToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltInverseAttribute >> maxCardinality [
  ^maxCardinality


]

{ #category : #'platypus-generated-accessing' }
PltInverseAttribute >> maxCardinality: aPltBound [
  maxCardinality := aPltBound


]

{ #category : #'platypus-generated-with-context-accessing' }
PltInverseAttribute >> maxCardinalityUsingContext: aContext [
  ^self maxCardinality


]

{ #category : #'platypus-generated-accessing' }
PltInverseAttribute >> minCardinality [
  ^minCardinality


]

{ #category : #'platypus-generated-accessing' }
PltInverseAttribute >> minCardinality: aPltBound [
  minCardinality := aPltBound


]

{ #category : #'platypus-generated-with-context-accessing' }
PltInverseAttribute >> minCardinalityUsingContext: aContext [
  ^self minCardinality


]

{ #category : #'platypus-generated-copying' }
PltInverseAttribute >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltInverseAttribute >> pltCopyTo: another [
  super pltCopyTo: another.
  self inverseAttributeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltInverseAttribute >> pltLocalCopyTo: another [
  self inverseAttributeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltInverseAttribute >> setDuplicates: aBoolean [
  self duplicates: aBoolean


]

{ #category : #'platypus-generated-set-accessing' }
PltInverseAttribute >> setInvertedAttr: aPltAttributeReference [
  self invertedAttr: aPltAttributeReference


]

{ #category : #'platypus-generated-set-accessing' }
PltInverseAttribute >> setMaxCardinality: aPltBound [
  self maxCardinality: aPltBound


]

{ #category : #'platypus-generated-set-accessing' }
PltInverseAttribute >> setMinCardinality: aPltBound [
  self minCardinality: aPltBound


]

{ #category : #'platypus-generated-initializing' }
PltInverseAttribute >> stepInitialize [
  super stepInitialize.
  invertedAttr := nil.
  minCardinality := nil.
  maxCardinality := nil.
  duplicates := false


]

{ #category : #'platypus-generated-group-accessing' }
PltInverseAttribute >> toValues: values [
  ^self inverseAttributeToValues: (super toValues: values)


]
