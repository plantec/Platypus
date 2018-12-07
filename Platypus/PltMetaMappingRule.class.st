"
<ISO10303-11-EXPRESS>
ENTITY meta_mapping_rule 
	SUBTYPE OF ( dictionary_instance );
	condition : STRING;
	expression : STRING;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltMetaMappingRule,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'metaCondition',
		'expression',
		'metaExpression',
		'haveError',
		'condition'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltMetaMappingRule class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMetaMappingRule class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMetaMappingRule class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltMetaMappingRule class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltMetaMappingRule class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltMetaMappingRule >> accept: aVisitor [
  ^aVisitor acceptMetaMappingRule: self


]

{ #category : #'platypus-generated-accessing' }
PltMetaMappingRule >> condition [
  ^condition


]

{ #category : #'platypus-generated-accessing' }
PltMetaMappingRule >> condition: aString [
  condition := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltMetaMappingRule >> conditionUsingContext: aContext [
  ^self condition


]

{ #category : #'platypus-generated-accessing' }
PltMetaMappingRule >> expression [
  ^expression


]

{ #category : #'platypus-generated-accessing' }
PltMetaMappingRule >> expression: aString [
  expression := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltMetaMappingRule >> expressionUsingContext: aContext [
  ^self expression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltMetaMappingRule >> fastSetCondition: aString [
  condition := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltMetaMappingRule >> fastSetExpression: aString [
  expression := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltMetaMappingRule >> fastSetMetaCondition:aPltExpression [	metaCondition := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltMetaMappingRule >> fastSetMetaExpression:aPltExpression [	metaExpression := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingRule >> fromValues: values [
  ^self metaMappingRuleFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltMetaMappingRule >> isPltMetaMappingRule [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingRule >> localFromValues: values [
  ^self metaMappingRuleFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingRule >> localToValues: values [
  ^self metaMappingRuleToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltMetaMappingRule >> metaCondition [	 ^metaCondition


]

{ #category : #'platypus-generated-with-context-accessing' }
PltMetaMappingRule >> metaConditionUsingContext:aContext [	^ self metaCondition


]

{ #category : #'platypus-generated-accessing' }
PltMetaMappingRule >> metaExpression [	 ^metaExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltMetaMappingRule >> metaExpressionUsingContext:aContext [	^ self metaExpression


]

{ #category : #'platypus-generated-copying' }
PltMetaMappingRule >> metaMappingRuleCopyTo: another [
  another fastSetCondition: self condition.
  another fastSetExpression: self expression


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingRule >> metaMappingRuleFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setCondition: valuesloc removeFirst.
  self setExpression: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingRule >> metaMappingRuleToValues: values [
  values add: self condition.
  values add: self expression.
  ^values


]

{ #category : #'platypus-generated-copying' }
PltMetaMappingRule >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltMetaMappingRule >> pltCopyTo: another [
  super pltCopyTo: another.
  self metaMappingRuleCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltMetaMappingRule >> pltLocalCopyTo: another [
  self metaMappingRuleCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltMetaMappingRule >> setCondition: aString [
  self condition: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltMetaMappingRule >> setExpression: aString [
  self expression: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltMetaMappingRule >> setMetaCondition:aPltExpression [	self metaCondition:aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltMetaMappingRule >> setMetaExpression:aPltExpression [	self metaExpression:aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltMetaMappingRule >> stepInitialize [
  super stepInitialize.
  condition := ''.
  expression := ''


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingRule >> toValues: values [
  ^self metaMappingRuleToValues: (super toValues: values)


]
