"
<ISO10303-11-EXPRESS>
ENTITY global_rule 
	SUBTYPE OF ( statements_container );
	for_entities : LIST [ 1 : ? ] OF entity_instances_set;
	where_rules : LIST [ 1 : ? ] OF where_rule;
	SELF\context_definition.owner : schema_definition;
DERIVE
	accepted : entity_instance := SELF.accept_global_rule;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltGlobalRule,
	#superclass : #PltStatementsContainer,
	#instVars : [
		'whereRules',
		'forEntities'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltGlobalRule class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltGlobalRule class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGlobalRule class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGlobalRule class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGlobalRule class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltGlobalRule class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltGlobalRule class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltGlobalRule >> accept: aVisitor [
  ^aVisitor acceptGlobalRule: self


]

{ #category : #'platypus-generated-deriving' }
PltGlobalRule >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltGlobalRule >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltGlobalRule >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptGlobalRuleUsingContext: aContext


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltGlobalRule >> fastSetForEntities: aListOfPltEntityInstancesSet [
  forEntities := aListOfPltEntityInstancesSet


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltGlobalRule >> fastSetOwner: aPltSchemaDefinition [
  owner := aPltSchemaDefinition


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltGlobalRule >> fastSetWhereRules: aListOfPltWhereRule [
  whereRules := aListOfPltWhereRule


]

{ #category : #'platypus-generated-accessing' }
PltGlobalRule >> forEntities [
  ^forEntities


]

{ #category : #'platypus-generated-accessing' }
PltGlobalRule >> forEntities: aListOfPltEntityInstancesSet [
  forEntities := aListOfPltEntityInstancesSet ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltEntityInstancesSet as: OrderedCollection ]


]

{ #category : #'platypus-generated-group-accessing' }
PltGlobalRule >> forEntities: aListOfPltEntityInstancesSet whereRules: aListOfPltWhereRule owner: aPltSchemaDefinition [ 	self setForEntities:aListOfPltEntityInstancesSet.	self setWhereRules:aListOfPltWhereRule.	self setOwner:aPltSchemaDefinition.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltGlobalRule >> forEntitiesUsingContext: aContext [
  ^self forEntities


]

{ #category : #'platypus-generated-group-accessing' }
PltGlobalRule >> fromValues: values [
  ^self globalRuleFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltGlobalRule >> globalRuleCopyTo: another [
  another fastSetForEntities: self forEntities.
  another fastSetWhereRules: self whereRules.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltGlobalRule >> globalRuleFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setForEntities: valuesloc removeFirst.
  self setWhereRules: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltGlobalRule >> globalRuleToValues: values [
  values add: self forEntities.
  values add: self whereRules.
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltGlobalRule >> isPltGlobalRule [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltGlobalRule >> localFromValues: values [
  ^self globalRuleFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltGlobalRule >> localToValues: values [
  ^self globalRuleToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltGlobalRule >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltGlobalRule >> owner: aPltSchemaDefinition [
  owner := aPltSchemaDefinition


]

{ #category : #'platypus-generated-with-context-accessing' }
PltGlobalRule >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltGlobalRule >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltGlobalRule >> pltCopyTo: another [
  super pltCopyTo: another.
  self globalRuleCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltGlobalRule >> pltLocalCopyTo: another [
  self globalRuleCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltGlobalRule >> setForEntities: aListOfPltEntityInstancesSet [
  self forEntities: aListOfPltEntityInstancesSet


]

{ #category : #'platypus-generated-set-accessing' }
PltGlobalRule >> setOwner: aPltSchemaDefinition [
  self owner: aPltSchemaDefinition


]

{ #category : #'platypus-generated-set-accessing' }
PltGlobalRule >> setWhereRules: aListOfPltWhereRule [
  self whereRules: aListOfPltWhereRule


]

{ #category : #'platypus-generated-initializing' }
PltGlobalRule >> stepInitialize [
  super stepInitialize.
  forEntities := OrderedCollection new.
  whereRules := OrderedCollection new.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltGlobalRule >> toValues: values [
  ^self globalRuleToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltGlobalRule >> whereRules [
  ^whereRules


]

{ #category : #'platypus-generated-accessing' }
PltGlobalRule >> whereRules: aListOfPltWhereRule [
  whereRules := aListOfPltWhereRule ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltWhereRule as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltGlobalRule >> whereRulesUsingContext: aContext [
  ^self whereRules


]
