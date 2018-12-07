"
<ISO10303-11-EXPRESS>
ENTITY uniqueness_rule 
	SUBTYPE OF ( dictionary_instance );
	label : OPTIONAL STRING;
	attributes : LIST [ 1 : ? ] OF UNIQUE uniqueness_rule_attribute_identifier;
	SELF\entity_instance.owner : entity_definition;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltUniquenessRule,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'attributes',
		'label'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltUniquenessRule class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltUniquenessRule class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUniquenessRule class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUniquenessRule class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUniquenessRule class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltUniquenessRule class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltUniquenessRule class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltUniquenessRule >> accept: aVisitor [
  ^aVisitor acceptUniquenessRule: self


]

{ #category : #'platypus-generated-accessing' }
PltUniquenessRule >> attributes [
  ^attributes


]

{ #category : #'platypus-generated-accessing' }
PltUniquenessRule >> attributes: aListOfPltUniquenessRuleAttributeIdentifier [
  attributes := aListOfPltUniquenessRuleAttributeIdentifier ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltUniquenessRuleAttributeIdentifier as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltUniquenessRule >> attributesUsingContext: aContext [
  ^self attributes


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltUniquenessRule >> fastSetAttributes: aListOfPltUniquenessRuleAttributeIdentifier [
  attributes := aListOfPltUniquenessRuleAttributeIdentifier


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltUniquenessRule >> fastSetLabel: aString [
  label := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltUniquenessRule >> fastSetOwner: aPltEntityDefinition [
  owner := aPltEntityDefinition


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRule >> fromValues: values [
  ^self uniquenessRuleFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltUniquenessRule >> isPltUniquenessRule [
  ^true


]

{ #category : #'platypus-generated-accessing' }
PltUniquenessRule >> label [
  ^label


]

{ #category : #'platypus-generated-accessing' }
PltUniquenessRule >> label: aString [
  label := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRule >> label: aString attributes: aListOfPltUniquenessRuleAttributeIdentifier owner: aPltEntityDefinition [ 	self setLabel:aString.	self setAttributes:aListOfPltUniquenessRuleAttributeIdentifier.	self setOwner:aPltEntityDefinition.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltUniquenessRule >> labelUsingContext: aContext [
  ^self label


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRule >> localFromValues: values [
  ^self uniquenessRuleFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRule >> localToValues: values [
  ^self uniquenessRuleToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltUniquenessRule >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltUniquenessRule >> owner: aPltEntityDefinition [
  owner := aPltEntityDefinition


]

{ #category : #'platypus-generated-with-context-accessing' }
PltUniquenessRule >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltUniquenessRule >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltUniquenessRule >> pltCopyTo: another [
  super pltCopyTo: another.
  self uniquenessRuleCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltUniquenessRule >> pltLocalCopyTo: another [
  self uniquenessRuleCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltUniquenessRule >> setAttributes: aListOfPltUniquenessRuleAttributeIdentifier [
  self attributes: aListOfPltUniquenessRuleAttributeIdentifier


]

{ #category : #'platypus-generated-set-accessing' }
PltUniquenessRule >> setLabel: aString [
  self label: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltUniquenessRule >> setOwner: aPltEntityDefinition [
  self owner: aPltEntityDefinition


]

{ #category : #'platypus-generated-initializing' }
PltUniquenessRule >> stepInitialize [
  super stepInitialize.
  label := nil.
  attributes := OrderedCollection new.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRule >> toValues: values [
  ^self uniquenessRuleToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltUniquenessRule >> uniquenessRuleCopyTo: another [
  another fastSetLabel: self label.
  another fastSetAttributes: self attributes.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRule >> uniquenessRuleFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setLabel: valuesloc removeFirst.
  self setAttributes: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRule >> uniquenessRuleToValues: values [
  values add: self label.
  values add: self attributes.
  values add: self owner.
  ^values


]
