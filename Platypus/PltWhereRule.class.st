"
<ISO10303-11-EXPRESS>
ENTITY where_rule 
	SUBTYPE OF ( dictionary_instance );
	label : OPTIONAL STRING;
	SELF\entity_instance.owner : type_or_rule;
	where_value : expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltWhereRule,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'whereValue',
		'label'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltWhereRule class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltWhereRule class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltWhereRule class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltWhereRule class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltWhereRule class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltWhereRule class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltWhereRule class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltWhereRule >> accept: aVisitor [
  ^aVisitor acceptWhereRule: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltWhereRule >> fastSetLabel: aString [
  label := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltWhereRule >> fastSetOwner: aPltTypeOrRule [
  owner := aPltTypeOrRule


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltWhereRule >> fastSetWhereValue: aPltExpression [
  whereValue := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltWhereRule >> fromValues: values [
  ^self whereRuleFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltWhereRule >> isPltWhereRule [
  ^true


]

{ #category : #'platypus-generated-accessing' }
PltWhereRule >> label [
  ^label


]

{ #category : #'platypus-generated-accessing' }
PltWhereRule >> label: aString [
  label := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltWhereRule >> label: aString owner: aPltTypeOrRule whereValue: aPltExpression [ 	self setLabel:aString.	self setOwner:aPltTypeOrRule.	self setWhereValue:aPltExpression.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltWhereRule >> labelUsingContext: aContext [
  ^self label


]

{ #category : #'platypus-generated-group-accessing' }
PltWhereRule >> localFromValues: values [
  ^self whereRuleFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltWhereRule >> localToValues: values [
  ^self whereRuleToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltWhereRule >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltWhereRule >> owner: aPltTypeOrRule [
  owner := aPltTypeOrRule


]

{ #category : #'platypus-generated-with-context-accessing' }
PltWhereRule >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltWhereRule >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltWhereRule >> pltCopyTo: another [
  super pltCopyTo: another.
  self whereRuleCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltWhereRule >> pltLocalCopyTo: another [
  self whereRuleCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltWhereRule >> setLabel: aString [
  self label: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltWhereRule >> setOwner: aPltTypeOrRule [
  self owner: aPltTypeOrRule


]

{ #category : #'platypus-generated-set-accessing' }
PltWhereRule >> setWhereValue: aPltExpression [
  self whereValue: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltWhereRule >> stepInitialize [
  super stepInitialize.
  label := nil.
  owner := nil.
  whereValue := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltWhereRule >> toValues: values [
  ^self whereRuleToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltWhereRule >> whereRuleCopyTo: another [
  another fastSetLabel: self label.
  another fastSetOwner: self owner.
  another fastSetWhereValue: self whereValue


]

{ #category : #'platypus-generated-group-accessing' }
PltWhereRule >> whereRuleFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setLabel: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  self setWhereValue: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltWhereRule >> whereRuleToValues: values [
  values add: self label.
  values add: self owner.
  values add: self whereValue.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltWhereRule >> whereValue [
  ^whereValue


]

{ #category : #'platypus-generated-accessing' }
PltWhereRule >> whereValue: aPltExpression [
  whereValue := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltWhereRule >> whereValueUsingContext: aContext [
  ^self whereValue


]
