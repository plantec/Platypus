"
<ISO10303-11-EXPRESS>
ENTITY meta_mapping_definition 
	SUBTYPE OF ( dictionary_instance );
	definition : dictionary_instance;
	expression : STRING;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltMetaMappingDefinition,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'expression',
		'metaExpression',
		'haveError',
		'definitionPath',
		'definition'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltMetaMappingDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMetaMappingDefinition class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMetaMappingDefinition class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltMetaMappingDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltMetaMappingDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltMetaMappingDefinition >> accept: aVisitor [
  ^aVisitor acceptMetaMappingDefinition: self


]

{ #category : #'platypus-generated-accessing' }
PltMetaMappingDefinition >> definition [
  ^definition


]

{ #category : #'platypus-generated-accessing' }
PltMetaMappingDefinition >> definition: aPltDictionaryInstance [
  definition := aPltDictionaryInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingDefinition >> definition: aPltDictionaryInstance expression: aString [ 	self setDefinition:aPltDictionaryInstance.	self setExpression:aString.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltMetaMappingDefinition >> definitionUsingContext: aContext [
  ^self definition


]

{ #category : #'platypus-generated-accessing' }
PltMetaMappingDefinition >> expression [
  ^expression


]

{ #category : #'platypus-generated-accessing' }
PltMetaMappingDefinition >> expression: aString [
  expression := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltMetaMappingDefinition >> expressionUsingContext: aContext [
  ^self expression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltMetaMappingDefinition >> fastSetDefinition: aPltDictionaryInstance [
  definition := aPltDictionaryInstance


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltMetaMappingDefinition >> fastSetExpression: aString [
  expression := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltMetaMappingDefinition >> fastSetMetaExpression:aPltExpression [	metaExpression := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingDefinition >> fromValues: values [
  ^self metaMappingDefinitionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltMetaMappingDefinition >> isPltMetaMappingDefinition [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingDefinition >> localFromValues: values [
  ^self metaMappingDefinitionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingDefinition >> localToValues: values [
  ^self metaMappingDefinitionToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltMetaMappingDefinition >> metaExpression [	 ^metaExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltMetaMappingDefinition >> metaExpressionUsingContext:aContext [	^ self metaExpression


]

{ #category : #'platypus-generated-copying' }
PltMetaMappingDefinition >> metaMappingDefinitionCopyTo: another [
  another fastSetDefinition: self definition.
  another fastSetExpression: self expression


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingDefinition >> metaMappingDefinitionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setDefinition: valuesloc removeFirst.
  self setExpression: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingDefinition >> metaMappingDefinitionToValues: values [
  values add: self definition.
  values add: self expression.
  ^values


]

{ #category : #'platypus-generated-copying' }
PltMetaMappingDefinition >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltMetaMappingDefinition >> pltCopyTo: another [
  super pltCopyTo: another.
  self metaMappingDefinitionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltMetaMappingDefinition >> pltLocalCopyTo: another [
  self metaMappingDefinitionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltMetaMappingDefinition >> setDefinition: aPltDictionaryInstance [
  self definition: aPltDictionaryInstance


]

{ #category : #'platypus-generated-set-accessing' }
PltMetaMappingDefinition >> setExpression: aString [
  self expression: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltMetaMappingDefinition >> setMetaExpression:aPltExpression [	self metaExpression:aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltMetaMappingDefinition >> stepInitialize [
  super stepInitialize.
  definition := nil.
  expression := ''


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaMappingDefinition >> toValues: values [
  ^self metaMappingDefinitionToValues: (super toValues: values)


]
