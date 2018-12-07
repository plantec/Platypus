"
<ISO10303-11-EXPRESS>
ENTITY increment_control_variable 
	SUBTYPE OF ( dictionary_instance );
	variable_id : STRING;
	SELF\entity_instance.owner : increment_control;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltIncrementControlVariable,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'variableId'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltIncrementControlVariable class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltIncrementControlVariable class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIncrementControlVariable class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIncrementControlVariable class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIncrementControlVariable class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltIncrementControlVariable class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltIncrementControlVariable class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltIncrementControlVariable >> accept: aVisitor [
  ^aVisitor acceptIncrementControlVariable: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIncrementControlVariable >> fastSetOwner: aPltIncrementControl [
  owner := aPltIncrementControl


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIncrementControlVariable >> fastSetVariableId: aString [
  variableId := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControlVariable >> fromValues: values [
  ^self incrementControlVariableFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltIncrementControlVariable >> incrementControlVariableCopyTo: another [
  another fastSetVariableId: self variableId.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControlVariable >> incrementControlVariableFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setVariableId: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControlVariable >> incrementControlVariableToValues: values [
  values add: self variableId.
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltIncrementControlVariable >> isPltIncrementControlVariable [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControlVariable >> localFromValues: values [
  ^self incrementControlVariableFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControlVariable >> localToValues: values [
  ^self incrementControlVariableToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControlVariable >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControlVariable >> owner: aPltIncrementControl [
  owner := aPltIncrementControl


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIncrementControlVariable >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltIncrementControlVariable >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltIncrementControlVariable >> pltCopyTo: another [
  super pltCopyTo: another.
  self incrementControlVariableCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltIncrementControlVariable >> pltLocalCopyTo: another [
  self incrementControlVariableCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltIncrementControlVariable >> setOwner: aPltIncrementControl [
  self owner: aPltIncrementControl


]

{ #category : #'platypus-generated-set-accessing' }
PltIncrementControlVariable >> setVariableId: aString [
  self variableId: aString


]

{ #category : #'platypus-generated-initializing' }
PltIncrementControlVariable >> stepInitialize [
  super stepInitialize.
  variableId := ''.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControlVariable >> toValues: values [
  ^self incrementControlVariableToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControlVariable >> variableId [
  ^variableId


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControlVariable >> variableId: aString [
  variableId := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControlVariable >> variableId: aString owner: aPltIncrementControl [ 	self setVariableId:aString.	self setOwner:aPltIncrementControl.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIncrementControlVariable >> variableIdUsingContext: aContext [
  ^self variableId


]
