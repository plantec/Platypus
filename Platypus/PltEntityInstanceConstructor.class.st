"
<ISO10303-11-EXPRESS>
ENTITY entity_instance_constructor 
	SUBTYPE OF ( unary_expression );
	decl : entity_definition_reference;
	parameters : LIST OF expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEntityInstanceConstructor,
	#superclass : #PltUnaryExpression,
	#instVars : [
		'parameters',
		'decl'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEntityInstanceConstructor class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstanceConstructor class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstanceConstructor class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstanceConstructor class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstanceConstructor class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstanceConstructor class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstanceConstructor class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEntityInstanceConstructor >> accept: aVisitor [
  ^aVisitor acceptEntityInstanceConstructor: self


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstanceConstructor >> decl [
  ^decl


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstanceConstructor >> decl: aPltEntityDefinitionReference [
  decl := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceConstructor >> decl: aPltEntityDefinitionReference parameters: aListOfPltExpression [ 	self setDecl:aPltEntityDefinitionReference.	self setParameters:aListOfPltExpression.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityInstanceConstructor >> declUsingContext: aContext [
  ^self decl


]

{ #category : #'platypus-generated-copying' }
PltEntityInstanceConstructor >> entityInstanceConstructorCopyTo: another [
  another fastSetDecl: self decl.
  another fastSetParameters: self parameters


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceConstructor >> entityInstanceConstructorFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setDecl: valuesloc removeFirst.
  self setParameters: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceConstructor >> entityInstanceConstructorToValues: values [
  values add: self decl.
  values add: self parameters.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityInstanceConstructor >> fastSetDecl: aPltEntityDefinitionReference [
  decl := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityInstanceConstructor >> fastSetParameters: aListOfPltExpression [
  parameters := aListOfPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceConstructor >> fromValues: values [
  ^self entityInstanceConstructorFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltEntityInstanceConstructor >> isPltEntityInstanceConstructor [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceConstructor >> localFromValues: values [
  ^self entityInstanceConstructorFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceConstructor >> localToValues: values [
  ^self entityInstanceConstructorToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstanceConstructor >> parameters [
  ^parameters


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstanceConstructor >> parameters: aListOfPltExpression [
  parameters := aListOfPltExpression ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltExpression as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityInstanceConstructor >> parametersUsingContext: aContext [
  ^self parameters


]

{ #category : #'platypus-generated-copying' }
PltEntityInstanceConstructor >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEntityInstanceConstructor >> pltCopyTo: another [
  super pltCopyTo: another.
  self entityInstanceConstructorCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEntityInstanceConstructor >> pltLocalCopyTo: another [
  self entityInstanceConstructorCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityInstanceConstructor >> setDecl: aPltEntityDefinitionReference [
  self decl: aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityInstanceConstructor >> setParameters: aListOfPltExpression [
  self parameters: aListOfPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltEntityInstanceConstructor >> stepInitialize [
  super stepInitialize.
  decl := nil.
  parameters := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceConstructor >> toValues: values [
  ^self entityInstanceConstructorToValues: (super toValues: values)


]
