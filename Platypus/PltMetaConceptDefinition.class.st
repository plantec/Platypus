"
<ISO10303-11-EXPRESS>
ENTITY meta_concept_definition 
	SUBTYPE OF ( dictionary_instance );
	definition : dictionary_instance;
	expression : STRING;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltMetaConceptDefinition,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'expression',
		'metaExpression',
		'haveError',
		'definition'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltMetaConceptDefinition class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltMetaConceptDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMetaConceptDefinition class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMetaConceptDefinition class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltMetaConceptDefinition class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltMetaConceptDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltMetaConceptDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltMetaConceptDefinition >> accept: aVisitor [
  ^aVisitor acceptMetaConceptDefinition: self


]

{ #category : #'platypus-generated-accessing' }
PltMetaConceptDefinition >> definition [
  ^definition


]

{ #category : #'platypus-generated-accessing' }
PltMetaConceptDefinition >> definition: aPltDictionaryInstance [
  definition := aPltDictionaryInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaConceptDefinition >> definition: aPltDictionaryInstance expression: aString [ 	self setDefinition:aPltDictionaryInstance.	self setExpression:aString.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltMetaConceptDefinition >> definitionUsingContext: aContext [
  ^self definition


]

{ #category : #'platypus-generated-accessing' }
PltMetaConceptDefinition >> expression [
  ^expression


]

{ #category : #'platypus-generated-accessing' }
PltMetaConceptDefinition >> expression: aString [
  expression := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltMetaConceptDefinition >> expressionUsingContext: aContext [
  ^self expression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltMetaConceptDefinition >> fastSetDefinition: aPltDictionaryInstance [
  definition := aPltDictionaryInstance


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltMetaConceptDefinition >> fastSetExpression: aString [
  expression := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaConceptDefinition >> fromValues: values [
  ^self metaConceptDefinitionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltMetaConceptDefinition >> isPltMetaConceptDefinition [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaConceptDefinition >> localFromValues: values [
  ^self metaConceptDefinitionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaConceptDefinition >> localToValues: values [
  ^self metaConceptDefinitionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltMetaConceptDefinition >> metaConceptDefinitionCopyTo: another [
  another fastSetDefinition: self definition.
  another fastSetExpression: self expression


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaConceptDefinition >> metaConceptDefinitionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setDefinition: valuesloc removeFirst.
  self setExpression: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaConceptDefinition >> metaConceptDefinitionToValues: values [
  values add: self definition.
  values add: self expression.
  ^values


]

{ #category : #'platypus-generated-with-context-accessing' }
PltMetaConceptDefinition >> parametersUsingContext:aContext [
	^ self parameters
]

{ #category : #'platypus-generated-copying' }
PltMetaConceptDefinition >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltMetaConceptDefinition >> pltCopyTo: another [
  super pltCopyTo: another.
  self metaConceptDefinitionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltMetaConceptDefinition >> pltLocalCopyTo: another [
  self metaConceptDefinitionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltMetaConceptDefinition >> setDefinition: aPltDictionaryInstance [
  self definition: aPltDictionaryInstance


]

{ #category : #'platypus-generated-set-accessing' }
PltMetaConceptDefinition >> setExpression: aString [
  self expression: aString


]

{ #category : #'platypus-generated-initializing' }
PltMetaConceptDefinition >> stepInitialize [
  super stepInitialize.
  definition := nil.
  expression := ''


]

{ #category : #'platypus-generated-group-accessing' }
PltMetaConceptDefinition >> toValues: values [
  ^self metaConceptDefinitionToValues: (super toValues: values)


]
