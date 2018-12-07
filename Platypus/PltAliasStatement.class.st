"
<ISO10303-11-EXPRESS>
ENTITY alias_statement 
	SUBTYPE OF ( statement );
	variable : alias_statement_variable;
	statements : LIST OF statement;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAliasStatement,
	#superclass : #PltStatement,
	#instVars : [
		'identifiersCache',
		'statements',
		'variable'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAliasStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAliasStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAliasStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAliasStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAliasStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAliasStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAliasStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAliasStatement >> accept: aVisitor [
  ^aVisitor acceptAliasStatement: self


]

{ #category : #'platypus-generated-copying' }
PltAliasStatement >> aliasStatementCopyTo: another [
  another fastSetVariable: self variable.
  another fastSetStatements: self statements


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatement >> aliasStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setVariable: valuesloc removeFirst.
  self setStatements: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatement >> aliasStatementToValues: values [
  values add: self variable.
  values add: self statements.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAliasStatement >> fastSetStatements: aListOfPltStatement [
  statements := aListOfPltStatement


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAliasStatement >> fastSetVariable: aPltAliasStatementVariable [
  variable := aPltAliasStatementVariable


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatement >> fromValues: values [
  ^self aliasStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAliasStatement >> isPltAliasStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatement >> localFromValues: values [
  ^self aliasStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatement >> localToValues: values [
  ^self aliasStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAliasStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAliasStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self aliasStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAliasStatement >> pltLocalCopyTo: another [
  self aliasStatementCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltAliasStatement >> setStatements: aListOfPltStatement [
  self statements: aListOfPltStatement


]

{ #category : #'platypus-generated-set-accessing' }
PltAliasStatement >> setVariable: aPltAliasStatementVariable [
  self variable: aPltAliasStatementVariable


]

{ #category : #'platypus-generated-accessing' }
PltAliasStatement >> statements [
  ^statements


]

{ #category : #'platypus-generated-accessing' }
PltAliasStatement >> statements: aListOfPltStatement [
  statements := aListOfPltStatement ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltStatement as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAliasStatement >> statementsUsingContext: aContext [
  ^self statements


]

{ #category : #'platypus-generated-initializing' }
PltAliasStatement >> stepInitialize [
  super stepInitialize.
  variable := nil.
  statements := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatement >> toValues: values [
  ^self aliasStatementToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltAliasStatement >> variable [
  ^variable


]

{ #category : #'platypus-generated-accessing' }
PltAliasStatement >> variable: aPltAliasStatementVariable [
  variable := aPltAliasStatementVariable


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatement >> variable: aPltAliasStatementVariable statements: aListOfPltStatement [ 	self setVariable:aPltAliasStatementVariable.	self setStatements:aListOfPltStatement.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAliasStatement >> variableUsingContext: aContext [
  ^self variable


]
