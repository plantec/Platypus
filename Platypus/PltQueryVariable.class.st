"
<ISO10303-11-EXPRESS>
ENTITY query_variable 
	SUBTYPE OF ( dictionary_instance );
	variable_id : STRING;
	SELF\entity_instance.owner : query_expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltQueryVariable,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'variableId'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltQueryVariable class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltQueryVariable class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltQueryVariable class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltQueryVariable class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltQueryVariable class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltQueryVariable class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltQueryVariable class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltQueryVariable >> accept: aVisitor [
  ^aVisitor acceptQueryVariable: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltQueryVariable >> fastSetOwner: aPltQueryExpression [
  owner := aPltQueryExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltQueryVariable >> fastSetVariableId: aString [
  variableId := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryVariable >> fromValues: values [
  ^self queryVariableFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltQueryVariable >> isPltQueryVariable [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryVariable >> localFromValues: values [
  ^self queryVariableFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryVariable >> localToValues: values [
  ^self queryVariableToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltQueryVariable >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltQueryVariable >> owner: aPltQueryExpression [
  owner := aPltQueryExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltQueryVariable >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltQueryVariable >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltQueryVariable >> pltCopyTo: another [
  super pltCopyTo: another.
  self queryVariableCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltQueryVariable >> pltLocalCopyTo: another [
  self queryVariableCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltQueryVariable >> queryVariableCopyTo: another [
  another fastSetVariableId: self variableId.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryVariable >> queryVariableFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setVariableId: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryVariable >> queryVariableToValues: values [
  values add: self variableId.
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-set-accessing' }
PltQueryVariable >> setOwner: aPltQueryExpression [
  self owner: aPltQueryExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltQueryVariable >> setVariableId: aString [
  self variableId: aString


]

{ #category : #'platypus-generated-initializing' }
PltQueryVariable >> stepInitialize [
  super stepInitialize.
  variableId := ''.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryVariable >> toValues: values [
  ^self queryVariableToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltQueryVariable >> variableId [
  ^variableId


]

{ #category : #'platypus-generated-accessing' }
PltQueryVariable >> variableId: aString [
  variableId := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltQueryVariable >> variableId: aString owner: aPltQueryExpression [ 	self setVariableId:aString.	self setOwner:aPltQueryExpression.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltQueryVariable >> variableIdUsingContext: aContext [
  ^self variableId


]
