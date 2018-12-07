"
<ISO10303-11-EXPRESS>
ENTITY case_statement 
	SUBTYPE OF ( statement );
	selector : expression;
	case_actions : LIST OF case_action;
	case_otherwise : OPTIONAL statement;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltCaseStatement,
	#superclass : #PltStatement,
	#instVars : [
		'caseActions',
		'caseOtherwise',
		'selector'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltCaseStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltCaseStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltCaseStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltCaseStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltCaseStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltCaseStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltCaseStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltCaseStatement >> accept: aVisitor [
  ^aVisitor acceptCaseStatement: self


]

{ #category : #'platypus-generated-accessing' }
PltCaseStatement >> caseActions [
  ^caseActions


]

{ #category : #'platypus-generated-accessing' }
PltCaseStatement >> caseActions: aListOfPltCaseAction [
  caseActions := aListOfPltCaseAction ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltCaseAction as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltCaseStatement >> caseActionsUsingContext: aContext [
  ^self caseActions


]

{ #category : #'platypus-generated-accessing' }
PltCaseStatement >> caseOtherwise [
  ^caseOtherwise


]

{ #category : #'platypus-generated-accessing' }
PltCaseStatement >> caseOtherwise: aPltStatement [
  caseOtherwise := aPltStatement


]

{ #category : #'platypus-generated-with-context-accessing' }
PltCaseStatement >> caseOtherwiseUsingContext: aContext [
  ^self caseOtherwise


]

{ #category : #'platypus-generated-copying' }
PltCaseStatement >> caseStatementCopyTo: another [
  another fastSetSelector: self selector.
  another fastSetCaseActions: self caseActions.
  another fastSetCaseOtherwise: self caseOtherwise


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseStatement >> caseStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setSelector: valuesloc removeFirst.
  self setCaseActions: valuesloc removeFirst.
  self setCaseOtherwise: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseStatement >> caseStatementToValues: values [
  values add: self selector.
  values add: self caseActions.
  values add: self caseOtherwise.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltCaseStatement >> fastSetCaseActions: aListOfPltCaseAction [
  caseActions := aListOfPltCaseAction


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltCaseStatement >> fastSetCaseOtherwise: aPltStatement [
  caseOtherwise := aPltStatement


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltCaseStatement >> fastSetSelector: aPltExpression [
  selector := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseStatement >> fromValues: values [
  ^self caseStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltCaseStatement >> isPltCaseStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseStatement >> localFromValues: values [
  ^self caseStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseStatement >> localToValues: values [
  ^self caseStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltCaseStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltCaseStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self caseStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltCaseStatement >> pltLocalCopyTo: another [
  self caseStatementCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltCaseStatement >> selector [
  ^selector


]

{ #category : #'platypus-generated-accessing' }
PltCaseStatement >> selector: aPltExpression [
  selector := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseStatement >> selector: aPltExpression caseActions: aListOfPltCaseAction caseOtherwise: aPltStatement [ 	self setSelector:aPltExpression.	self setCaseActions:aListOfPltCaseAction.	self setCaseOtherwise:aPltStatement.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltCaseStatement >> selectorUsingContext: aContext [
  ^self selector


]

{ #category : #'platypus-generated-set-accessing' }
PltCaseStatement >> setCaseActions: aListOfPltCaseAction [
  self caseActions: aListOfPltCaseAction


]

{ #category : #'platypus-generated-set-accessing' }
PltCaseStatement >> setCaseOtherwise: aPltStatement [
  self caseOtherwise: aPltStatement


]

{ #category : #'platypus-generated-set-accessing' }
PltCaseStatement >> setSelector: aPltExpression [
  self selector: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltCaseStatement >> stepInitialize [
  super stepInitialize.
  selector := nil.
  caseActions := OrderedCollection new.
  caseOtherwise := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltCaseStatement >> toValues: values [
  ^self caseStatementToValues: (super toValues: values)


]
