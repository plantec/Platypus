"
<ISO10303-11-EXPRESS>
ENTITY return_statement 
	SUBTYPE OF ( statement );
	returned : OPTIONAL expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltReturnStatement,
	#superclass : #PltStatement,
	#instVars : [
		'returned'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltReturnStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltReturnStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltReturnStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltReturnStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltReturnStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltReturnStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltReturnStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltReturnStatement >> accept: aVisitor [
  ^aVisitor acceptReturnStatement: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltReturnStatement >> fastSetReturned: aPltExpression [
  returned := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltReturnStatement >> fromValues: values [
  ^self returnStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltReturnStatement >> isPltReturnStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltReturnStatement >> localFromValues: values [
  ^self returnStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltReturnStatement >> localToValues: values [
  ^self returnStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltReturnStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltReturnStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self returnStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltReturnStatement >> pltLocalCopyTo: another [
  self returnStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltReturnStatement >> returnStatementCopyTo: another [
  another fastSetReturned: self returned


]

{ #category : #'platypus-generated-group-accessing' }
PltReturnStatement >> returnStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setReturned: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltReturnStatement >> returnStatementToValues: values [
  values add: self returned.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltReturnStatement >> returned [
  ^returned


]

{ #category : #'platypus-generated-accessing' }
PltReturnStatement >> returned: aPltExpression [
  returned := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltReturnStatement >> returnedUsingContext: aContext [
  ^self returned


]

{ #category : #'platypus-generated-set-accessing' }
PltReturnStatement >> setReturned: aPltExpression [
  self returned: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltReturnStatement >> stepInitialize [
  super stepInitialize.
  returned := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltReturnStatement >> toValues: values [
  ^self returnStatementToValues: (super toValues: values)


]
