"
<ISO10303-11-EXPRESS>
ENTITY sub_entity_ref_expression 
	SUBTYPE OF ( supertype_expression );
	entity_ref : entity_definition_reference;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSubEntityRefExpression,
	#superclass : #PltSupertypeExpression,
	#instVars : [
		'entityRef'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSubEntityRefExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSubEntityRefExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSubEntityRefExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSubEntityRefExpression class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSubEntityRefExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSubEntityRefExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSubEntityRefExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSubEntityRefExpression >> accept: aVisitor [
  ^aVisitor acceptSubEntityRefExpression: self


]

{ #category : #'platypus-generated-accessing' }
PltSubEntityRefExpression >> entityRef [
  ^entityRef


]

{ #category : #'platypus-generated-accessing' }
PltSubEntityRefExpression >> entityRef: aPltEntityDefinitionReference [
  entityRef := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSubEntityRefExpression >> entityRefUsingContext: aContext [
  ^self entityRef


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSubEntityRefExpression >> fastSetEntityRef: aPltEntityDefinitionReference [
  entityRef := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-group-accessing' }
PltSubEntityRefExpression >> fromValues: values [
  ^self subEntityRefExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSubEntityRefExpression >> isPltSubEntityRefExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSubEntityRefExpression >> localFromValues: values [
  ^self subEntityRefExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSubEntityRefExpression >> localToValues: values [
  ^self subEntityRefExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltSubEntityRefExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSubEntityRefExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self subEntityRefExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSubEntityRefExpression >> pltLocalCopyTo: another [
  self subEntityRefExpressionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltSubEntityRefExpression >> setEntityRef: aPltEntityDefinitionReference [
  self entityRef: aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-initializing' }
PltSubEntityRefExpression >> stepInitialize [
  super stepInitialize.
  entityRef := nil


]

{ #category : #'platypus-generated-copying' }
PltSubEntityRefExpression >> subEntityRefExpressionCopyTo: another [
  another fastSetEntityRef: self entityRef


]

{ #category : #'platypus-generated-group-accessing' }
PltSubEntityRefExpression >> subEntityRefExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setEntityRef: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSubEntityRefExpression >> subEntityRefExpressionToValues: values [
  values add: self entityRef.
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltSubEntityRefExpression >> toValues: values [
  ^self subEntityRefExpressionToValues: (super toValues: values)


]
