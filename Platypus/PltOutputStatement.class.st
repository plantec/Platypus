"
<ISO10303-11-EXPRESS>
ENTITY output_statement 
	SUBTYPE OF ( statement );
	output : expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltOutputStatement,
	#superclass : #PltStatement,
	#instVars : [
		'output'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltOutputStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltOutputStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltOutputStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltOutputStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltOutputStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltOutputStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltOutputStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltOutputStatement >> accept: aVisitor [
  ^aVisitor acceptOutputStatement: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltOutputStatement >> fastSetOutput: aPltExpression [
  output := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltOutputStatement >> fromValues: values [
  ^self outputStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltOutputStatement >> isPltOutputStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltOutputStatement >> localFromValues: values [
  ^self outputStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltOutputStatement >> localToValues: values [
  ^self outputStatementToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltOutputStatement >> output [
  ^output


]

{ #category : #'platypus-generated-accessing' }
PltOutputStatement >> output: aPltExpression [
  output := aPltExpression


]

{ #category : #'platypus-generated-copying' }
PltOutputStatement >> outputStatementCopyTo: another [
  another fastSetOutput: self output


]

{ #category : #'platypus-generated-group-accessing' }
PltOutputStatement >> outputStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setOutput: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltOutputStatement >> outputStatementToValues: values [
  values add: self output.
  ^values


]

{ #category : #'platypus-generated-with-context-accessing' }
PltOutputStatement >> outputUsingContext: aContext [
  ^self output


]

{ #category : #'platypus-generated-copying' }
PltOutputStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltOutputStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self outputStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltOutputStatement >> pltLocalCopyTo: another [
  self outputStatementCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltOutputStatement >> setOutput: aPltExpression [
  self output: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltOutputStatement >> stepInitialize [
  super stepInitialize.
  output := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltOutputStatement >> toValues: values [
  ^self outputStatementToValues: (super toValues: values)


]
