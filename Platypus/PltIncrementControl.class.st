"
<ISO10303-11-EXPRESS>
ENTITY increment_control 
	SUBTYPE OF ( dictionary_instance );
	variable : increment_control_variable;
	first : expression;
	last : expression;
	step : OPTIONAL expression;
	SELF\entity_instance.owner : repeat_statement;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltIncrementControl,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'identifiersCache',
		'first',
		'last',
		'variable',
		'step'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltIncrementControl class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltIncrementControl class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIncrementControl class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIncrementControl class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIncrementControl class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltIncrementControl class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltIncrementControl class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltIncrementControl >> accept: aVisitor [
  ^aVisitor acceptIncrementControl: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIncrementControl >> fastSetFirst: aPltExpression [
  first := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIncrementControl >> fastSetLast: aPltExpression [
  last := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIncrementControl >> fastSetOwner: aPltRepeatStatement [
  owner := aPltRepeatStatement


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIncrementControl >> fastSetStep: aPltExpression [
  step := aPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIncrementControl >> fastSetVariable: aPltIncrementControlVariable [
  variable := aPltIncrementControlVariable


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControl >> first [
  ^first


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControl >> first: aPltExpression [
  first := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIncrementControl >> firstUsingContext: aContext [
  ^self first


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControl >> fromValues: values [
  ^self incrementControlFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltIncrementControl >> incrementControlCopyTo: another [
  another fastSetVariable: self variable.
  another fastSetFirst: self first.
  another fastSetLast: self last.
  another fastSetStep: self step.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControl >> incrementControlFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setVariable: valuesloc removeFirst.
  self setFirst: valuesloc removeFirst.
  self setLast: valuesloc removeFirst.
  self setStep: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControl >> incrementControlToValues: values [
  values add: self variable.
  values add: self first.
  values add: self last.
  values add: self step.
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltIncrementControl >> isPltIncrementControl [
  ^true


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControl >> last [
  ^last


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControl >> last: aPltExpression [
  last := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIncrementControl >> lastUsingContext: aContext [
  ^self last


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControl >> localFromValues: values [
  ^self incrementControlFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControl >> localToValues: values [
  ^self incrementControlToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControl >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControl >> owner: aPltRepeatStatement [
  owner := aPltRepeatStatement


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIncrementControl >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltIncrementControl >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltIncrementControl >> pltCopyTo: another [
  super pltCopyTo: another.
  self incrementControlCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltIncrementControl >> pltLocalCopyTo: another [
  self incrementControlCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltIncrementControl >> setFirst: aPltExpression [
  self first: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltIncrementControl >> setLast: aPltExpression [
  self last: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltIncrementControl >> setOwner: aPltRepeatStatement [
  self owner: aPltRepeatStatement


]

{ #category : #'platypus-generated-set-accessing' }
PltIncrementControl >> setStep: aPltExpression [
  self step: aPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltIncrementControl >> setVariable: aPltIncrementControlVariable [
  self variable: aPltIncrementControlVariable


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControl >> step [
  ^step


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControl >> step: aPltExpression [
  step := aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltIncrementControl >> stepInitialize [
  super stepInitialize.
  variable := nil.
  first := nil.
  last := nil.
  step := nil.
  owner := nil


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIncrementControl >> stepUsingContext: aContext [
  ^self step


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControl >> toValues: values [
  ^self incrementControlToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControl >> variable [
  ^variable


]

{ #category : #'platypus-generated-accessing' }
PltIncrementControl >> variable: aPltIncrementControlVariable [
  variable := aPltIncrementControlVariable


]

{ #category : #'platypus-generated-group-accessing' }
PltIncrementControl >> variable: aPltIncrementControlVariable first: aPltExpression last: aPltExpression1 step: aPltExpression2 owner: aPltRepeatStatement [ 	self setVariable:aPltIncrementControlVariable.	self setFirst:aPltExpression.	self setLast:aPltExpression1.	self setStep:aPltExpression2.	self setOwner:aPltRepeatStatement.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIncrementControl >> variableUsingContext: aContext [
  ^self variable


]
