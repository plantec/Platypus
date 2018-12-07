"
<ISO10303-11-EXPRESS>
ENTITY entity_instances_set 
	SUBTYPE OF ( unary_expression );
	entity_ref : entity_definition_reference;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEntityInstancesSet,
	#superclass : #PltUnaryExpression,
	#instVars : [
		'entityRef'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEntityInstancesSet class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstancesSet class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstancesSet class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstancesSet class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstancesSet class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstancesSet class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstancesSet class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEntityInstancesSet >> accept: aVisitor [
  ^aVisitor acceptEntityInstancesSet: self


]

{ #category : #'platypus-generated-copying' }
PltEntityInstancesSet >> entityInstancesSetCopyTo: another [
  another fastSetEntityRef: self entityRef


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstancesSet >> entityInstancesSetFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setEntityRef: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstancesSet >> entityInstancesSetToValues: values [
  values add: self entityRef.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstancesSet >> entityRef [
  ^entityRef


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstancesSet >> entityRef: aPltEntityDefinitionReference [
  entityRef := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityInstancesSet >> entityRefUsingContext: aContext [
  ^self entityRef


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityInstancesSet >> fastSetEntityRef: aPltEntityDefinitionReference [
  entityRef := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstancesSet >> fromValues: values [
  ^self entityInstancesSetFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltEntityInstancesSet >> isPltEntityInstancesSet [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstancesSet >> localFromValues: values [
  ^self entityInstancesSetFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstancesSet >> localToValues: values [
  ^self entityInstancesSetToValues: values


]

{ #category : #'platypus-generated-copying' }
PltEntityInstancesSet >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEntityInstancesSet >> pltCopyTo: another [
  super pltCopyTo: another.
  self entityInstancesSetCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEntityInstancesSet >> pltLocalCopyTo: another [
  self entityInstancesSetCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityInstancesSet >> setEntityRef: aPltEntityDefinitionReference [
  self entityRef: aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-initializing' }
PltEntityInstancesSet >> stepInitialize [
  super stepInitialize.
  entityRef := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstancesSet >> toValues: values [
  ^self entityInstancesSetToValues: (super toValues: values)


]
