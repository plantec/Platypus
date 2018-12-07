"
<ISO10303-11-EXPRESS>
ENTITY repeat_statement 
	SUBTYPE OF ( statement );
	incr_control : OPTIONAL increment_control;
	until_control : OPTIONAL expression;
	while_control : OPTIONAL expression;
	statements : LIST OF statement;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltRepeatStatement,
	#superclass : #PltStatement,
	#instVars : [
		'incrControl',
		'statements',
		'whileControl',
		'untilControl'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltRepeatStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltRepeatStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRepeatStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRepeatStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRepeatStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltRepeatStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltRepeatStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltRepeatStatement >> accept: aVisitor [
  ^aVisitor acceptRepeatStatement: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRepeatStatement >> fastSetIncrControl: aPltIncrementControl [
  incrControl := aPltIncrementControl


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRepeatStatement >> fastSetStatements: aListOfPltStatement [
  statements := aListOfPltStatement


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRepeatStatement >> fastSetUntilControl: aPltExpression [
  untilControl := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRepeatStatement >> fastSetWhileControl: aPltExpression [
  whileControl := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltRepeatStatement >> fromValues: values [
  ^self repeatStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltRepeatStatement >> incrControl [
  ^incrControl


]

{ #category : #'platypus-generated-accessing' }
PltRepeatStatement >> incrControl: aPltIncrementControl [
  incrControl := aPltIncrementControl


]

{ #category : #'platypus-generated-group-accessing' }
PltRepeatStatement >> incrControl: aPltIncrementControl untilControl: aPltExpression whileControl: aPltExpression1 statements: aListOfPltStatement [ 	self setIncrControl:aPltIncrementControl.	self setUntilControl:aPltExpression.	self setWhileControl:aPltExpression1.	self setStatements:aListOfPltStatement.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRepeatStatement >> incrControlUsingContext: aContext [
  ^self incrControl


]

{ #category : #'platypus-generated-classifying' }
PltRepeatStatement >> isPltRepeatStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltRepeatStatement >> localFromValues: values [
  ^self repeatStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltRepeatStatement >> localToValues: values [
  ^self repeatStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltRepeatStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltRepeatStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self repeatStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRepeatStatement >> pltLocalCopyTo: another [
  self repeatStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRepeatStatement >> repeatStatementCopyTo: another [
  another fastSetIncrControl: self incrControl.
  another fastSetUntilControl: self untilControl.
  another fastSetWhileControl: self whileControl.
  another fastSetStatements: self statements


]

{ #category : #'platypus-generated-group-accessing' }
PltRepeatStatement >> repeatStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setIncrControl: valuesloc removeFirst.
  self setUntilControl: valuesloc removeFirst.
  self setWhileControl: valuesloc removeFirst.
  self setStatements: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltRepeatStatement >> repeatStatementToValues: values [
  values add: self incrControl.
  values add: self untilControl.
  values add: self whileControl.
  values add: self statements.
  ^values


]

{ #category : #'platypus-generated-set-accessing' }
PltRepeatStatement >> setIncrControl: aPltIncrementControl [
  self incrControl: aPltIncrementControl


]

{ #category : #'platypus-generated-set-accessing' }
PltRepeatStatement >> setStatements: aListOfPltStatement [
  self statements: aListOfPltStatement


]

{ #category : #'platypus-generated-set-accessing' }
PltRepeatStatement >> setUntilControl: aPltExpression [
  self untilControl: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltRepeatStatement >> setWhileControl: aPltExpression [
  self whileControl: aPltExpression


]

{ #category : #'platypus-generated-accessing' }
PltRepeatStatement >> statements [
  ^statements


]

{ #category : #'platypus-generated-accessing' }
PltRepeatStatement >> statements: aListOfPltStatement [
  statements := aListOfPltStatement ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltStatement as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRepeatStatement >> statementsUsingContext: aContext [
  ^self statements


]

{ #category : #'platypus-generated-initializing' }
PltRepeatStatement >> stepInitialize [
  super stepInitialize.
  incrControl := nil.
  untilControl := nil.
  whileControl := nil.
  statements := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltRepeatStatement >> toValues: values [
  ^self repeatStatementToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltRepeatStatement >> untilControl [
  ^untilControl


]

{ #category : #'platypus-generated-accessing' }
PltRepeatStatement >> untilControl: aPltExpression [
  untilControl := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRepeatStatement >> untilControlUsingContext: aContext [
  ^self untilControl


]

{ #category : #'platypus-generated-accessing' }
PltRepeatStatement >> whileControl [
  ^whileControl


]

{ #category : #'platypus-generated-accessing' }
PltRepeatStatement >> whileControl: aPltExpression [
  whileControl := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRepeatStatement >> whileControlUsingContext: aContext [
  ^self whileControl


]
