"
<ISO10303-11-EXPRESS>
ENTITY local_variable 
	SUBTYPE OF ( dictionary_instance );
	SELF\entity_instance.owner : statements_container;
	name : STRING;
	domain : parameter_type;
	initializer : OPTIONAL expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltLocalVariable,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'domain',
		'initializer',
		'name'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltLocalVariable class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltLocalVariable class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLocalVariable class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLocalVariable class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLocalVariable class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltLocalVariable class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltLocalVariable class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltLocalVariable >> accept: aVisitor [
  ^aVisitor acceptLocalVariable: self


]

{ #category : #'platypus-generated-accessing' }
PltLocalVariable >> domain [
  ^domain


]

{ #category : #'platypus-generated-accessing' }
PltLocalVariable >> domain: aPltParameterType [
  domain := aPltParameterType


]

{ #category : #'platypus-generated-with-context-accessing' }
PltLocalVariable >> domainUsingContext: aContext [
  ^self domain


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltLocalVariable >> fastSetDomain: aPltParameterType [
  domain := aPltParameterType


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltLocalVariable >> fastSetInitializer: aPltExpression [
  initializer := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltLocalVariable >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltLocalVariable >> fastSetOwner: aPltStatementsContainer [
  owner := aPltStatementsContainer


]

{ #category : #'platypus-generated-group-accessing' }
PltLocalVariable >> fromValues: values [
  ^self localVariableFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltLocalVariable >> initializer [
  ^initializer


]

{ #category : #'platypus-generated-accessing' }
PltLocalVariable >> initializer: aPltExpression [
  initializer := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltLocalVariable >> initializerUsingContext: aContext [
  ^self initializer


]

{ #category : #'platypus-generated-classifying' }
PltLocalVariable >> isPltLocalVariable [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltLocalVariable >> localFromValues: values [
  ^self localVariableFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltLocalVariable >> localToValues: values [
  ^self localVariableToValues: values


]

{ #category : #'platypus-generated-copying' }
PltLocalVariable >> localVariableCopyTo: another [
  another fastSetOwner: self owner.
  another fastSetName: self name.
  another fastSetDomain: self domain.
  another fastSetInitializer: self initializer


]

{ #category : #'platypus-generated-group-accessing' }
PltLocalVariable >> localVariableFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setOwner: valuesloc removeFirst.
  self setName: valuesloc removeFirst.
  self setDomain: valuesloc removeFirst.
  self setInitializer: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltLocalVariable >> localVariableToValues: values [
  values add: self owner.
  values add: self name.
  values add: self domain.
  values add: self initializer.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltLocalVariable >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltLocalVariable >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltLocalVariable >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-accessing' }
PltLocalVariable >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltLocalVariable >> owner: aPltStatementsContainer [
  owner := aPltStatementsContainer


]

{ #category : #'platypus-generated-group-accessing' }
PltLocalVariable >> owner: aPltStatementsContainer name: aString domain: aPltParameterType initializer: aPltExpression [ 	self setOwner:aPltStatementsContainer.	self setName:aString.	self setDomain:aPltParameterType.	self setInitializer:aPltExpression.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltLocalVariable >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltLocalVariable >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltLocalVariable >> pltCopyTo: another [
  super pltCopyTo: another.
  self localVariableCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltLocalVariable >> pltLocalCopyTo: another [
  self localVariableCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltLocalVariable >> setDomain: aPltParameterType [
  self domain: aPltParameterType


]

{ #category : #'platypus-generated-set-accessing' }
PltLocalVariable >> setInitializer: aPltExpression [
  self initializer: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltLocalVariable >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltLocalVariable >> setOwner: aPltStatementsContainer [
  self owner: aPltStatementsContainer


]

{ #category : #'platypus-generated-initializing' }
PltLocalVariable >> stepInitialize [
  super stepInitialize.
  owner := nil.
  name := ''.
  domain := nil.
  initializer := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltLocalVariable >> toValues: values [
  ^self localVariableToValues: (super toValues: values)


]
