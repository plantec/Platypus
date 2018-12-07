"
<ISO10303-11-EXPRESS>
ENTITY compound_statement 
	SUBTYPE OF ( statement );
	statements : LIST OF statement;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltCompoundStatement,
	#superclass : #PltStatement,
	#instVars : [
		'statements'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltCompoundStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltCompoundStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltCompoundStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltCompoundStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltCompoundStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltCompoundStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltCompoundStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltCompoundStatement >> accept: aVisitor [
  ^aVisitor acceptCompoundStatement: self


]

{ #category : #'platypus-generated-copying' }
PltCompoundStatement >> compoundStatementCopyTo: another [
  another fastSetStatements: self statements


]

{ #category : #'platypus-generated-group-accessing' }
PltCompoundStatement >> compoundStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setStatements: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltCompoundStatement >> compoundStatementToValues: values [
  values add: self statements.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltCompoundStatement >> fastSetStatements: aListOfPltStatement [
  statements := aListOfPltStatement


]

{ #category : #'platypus-generated-group-accessing' }
PltCompoundStatement >> fromValues: values [
  ^self compoundStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltCompoundStatement >> isPltCompoundStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltCompoundStatement >> localFromValues: values [
  ^self compoundStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltCompoundStatement >> localToValues: values [
  ^self compoundStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltCompoundStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltCompoundStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self compoundStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltCompoundStatement >> pltLocalCopyTo: another [
  self compoundStatementCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltCompoundStatement >> setStatements: aListOfPltStatement [
  self statements: aListOfPltStatement


]

{ #category : #'platypus-generated-accessing' }
PltCompoundStatement >> statements [
  ^statements


]

{ #category : #'platypus-generated-accessing' }
PltCompoundStatement >> statements: aListOfPltStatement [
  statements := aListOfPltStatement ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltStatement as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltCompoundStatement >> statementsUsingContext: aContext [
  ^self statements


]

{ #category : #'platypus-generated-initializing' }
PltCompoundStatement >> stepInitialize [
  super stepInitialize.
  statements := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltCompoundStatement >> toValues: values [
  ^self compoundStatementToValues: (super toValues: values)


]
