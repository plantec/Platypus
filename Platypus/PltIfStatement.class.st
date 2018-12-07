"
<ISO10303-11-EXPRESS>
ENTITY if_statement 
	SUBTYPE OF ( statement );
	selector : expression;
	then_statements : LIST OF statement;
	else_statements : OPTIONAL LIST OF statement;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltIfStatement,
	#superclass : #PltStatement,
	#instVars : [
		'elseStatements',
		'thenStatements',
		'selector'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltIfStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltIfStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIfStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIfStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIfStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltIfStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltIfStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltIfStatement >> accept: aVisitor [
  ^aVisitor acceptIfStatement: self


]

{ #category : #'platypus-generated-accessing' }
PltIfStatement >> elseStatements [
  ^elseStatements


]

{ #category : #'platypus-generated-accessing' }
PltIfStatement >> elseStatements: aListOfPltStatement [
  elseStatements := aListOfPltStatement ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltStatement as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIfStatement >> elseStatementsUsingContext: aContext [
  ^self elseStatements


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIfStatement >> fastSetElseStatements: aListOfPltStatement [
  elseStatements := aListOfPltStatement


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIfStatement >> fastSetSelector: aPltExpression [
  selector := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIfStatement >> fastSetThenStatements: aListOfPltStatement [
  thenStatements := aListOfPltStatement


]

{ #category : #'platypus-generated-group-accessing' }
PltIfStatement >> fromValues: values [
  ^self ifStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltIfStatement >> ifStatementCopyTo: another [
  another fastSetSelector: self selector.
  another fastSetThenStatements: self thenStatements.
  another fastSetElseStatements: self elseStatements


]

{ #category : #'platypus-generated-group-accessing' }
PltIfStatement >> ifStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setSelector: valuesloc removeFirst.
  self setThenStatements: valuesloc removeFirst.
  self setElseStatements: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltIfStatement >> ifStatementToValues: values [
  values add: self selector.
  values add: self thenStatements.
  values add: self elseStatements.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltIfStatement >> isPltIfStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltIfStatement >> localFromValues: values [
  ^self ifStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltIfStatement >> localToValues: values [
  ^self ifStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltIfStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltIfStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self ifStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltIfStatement >> pltLocalCopyTo: another [
  self ifStatementCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltIfStatement >> selector [
  ^selector


]

{ #category : #'platypus-generated-accessing' }
PltIfStatement >> selector: aPltExpression [
  selector := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltIfStatement >> selector: aPltExpression thenStatements: aListOfPltStatement elseStatements: aListOfPltStatement1 [ 	self setSelector:aPltExpression.	self setThenStatements:aListOfPltStatement.	self setElseStatements:aListOfPltStatement1.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIfStatement >> selectorUsingContext: aContext [
  ^self selector


]

{ #category : #'platypus-generated-set-accessing' }
PltIfStatement >> setElseStatements: aListOfPltStatement [
  self elseStatements: aListOfPltStatement


]

{ #category : #'platypus-generated-set-accessing' }
PltIfStatement >> setSelector: aPltExpression [
  self selector: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltIfStatement >> setThenStatements: aListOfPltStatement [
  self thenStatements: aListOfPltStatement


]

{ #category : #'platypus-generated-initializing' }
PltIfStatement >> stepInitialize [
  super stepInitialize.
  selector := nil.
  thenStatements := OrderedCollection new.
  elseStatements := nil


]

{ #category : #'platypus-generated-accessing' }
PltIfStatement >> thenStatements [
  ^thenStatements


]

{ #category : #'platypus-generated-accessing' }
PltIfStatement >> thenStatements: aListOfPltStatement [
  thenStatements := aListOfPltStatement ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltStatement as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIfStatement >> thenStatementsUsingContext: aContext [
  ^self thenStatements


]

{ #category : #'platypus-generated-group-accessing' }
PltIfStatement >> toValues: values [
  ^self ifStatementToValues: (super toValues: values)


]
