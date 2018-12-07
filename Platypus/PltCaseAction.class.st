"
<ISO10303-11-EXPRESS>
ENTITY case_action 
	SUBTYPE OF ( dictionary_instance );
	labels : LIST OF expression;
	action : statement;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltCaseAction,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'action',
		'labels'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltCaseAction class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltCaseAction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltCaseAction class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltCaseAction class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltCaseAction class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltCaseAction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltCaseAction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltCaseAction >> accept: aVisitor [
  ^aVisitor acceptCaseAction: self


]

{ #category : #'platypus-generated-accessing' }
PltCaseAction >> action [
  ^action


]

{ #category : #'platypus-generated-accessing' }
PltCaseAction >> action: aPltStatement [
  action := aPltStatement


]

{ #category : #'platypus-generated-with-context-accessing' }
PltCaseAction >> actionUsingContext: aContext [
  ^self action


]

{ #category : #'platypus-generated-copying' }
PltCaseAction >> caseActionCopyTo: another [
  another fastSetLabels: self labels.
  another fastSetAction: self action


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseAction >> caseActionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setLabels: valuesloc removeFirst.
  self setAction: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseAction >> caseActionToValues: values [
  values add: self labels.
  values add: self action.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltCaseAction >> fastSetAction: aPltStatement [
  action := aPltStatement


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltCaseAction >> fastSetLabels: aListOfPltExpression [
  labels := aListOfPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseAction >> fromValues: values [
  ^self caseActionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltCaseAction >> isPltCaseAction [
  ^true


]

{ #category : #'platypus-generated-accessing' }
PltCaseAction >> labels [
  ^labels


]

{ #category : #'platypus-generated-accessing' }
PltCaseAction >> labels: aListOfPltExpression [
  labels := aListOfPltExpression ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltExpression as: OrderedCollection ]


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseAction >> labels: aListOfPltExpression action: aPltStatement [ 	self setLabels:aListOfPltExpression.	self setAction:aPltStatement.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltCaseAction >> labelsUsingContext: aContext [
  ^self labels


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseAction >> localFromValues: values [
  ^self caseActionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseAction >> localToValues: values [
  ^self caseActionToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltCaseAction >> owner [
	^owner
]

{ #category : #'platypus-generated-group-accessing' }
PltCaseAction >> owner: aPltCaseStatement labels: aListOfPltExpression action: aPltStatement [
	self setOwner:aPltCaseStatement.
	self setLabels:aListOfPltExpression.
	self setAction:aPltStatement.

]

{ #category : #'platypus-generated-copying' }
PltCaseAction >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltCaseAction >> pltCopyTo: another [
  super pltCopyTo: another.
  self caseActionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltCaseAction >> pltLocalCopyTo: another [
  self caseActionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltCaseAction >> setAction: aPltStatement [
  self action: aPltStatement


]

{ #category : #'platypus-generated-set-accessing' }
PltCaseAction >> setLabels: aListOfPltExpression [
  self labels: aListOfPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltCaseAction >> stepInitialize [
  super stepInitialize.
  labels := OrderedCollection new.
  action := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseAction >> toValues: values [
  ^self caseActionToValues: (super toValues: values)


]
