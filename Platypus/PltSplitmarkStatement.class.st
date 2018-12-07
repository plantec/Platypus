"
<ISO10303-11-EXPRESS>
ENTITY splitmark_statement 
	SUBTYPE OF ( statement );
	filename : expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSplitmarkStatement,
	#superclass : #PltStatement,
	#instVars : [
		'append',
		'filename'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSplitmarkStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSplitmarkStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSplitmarkStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSplitmarkStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSplitmarkStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSplitmarkStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSplitmarkStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSplitmarkStatement >> accept: aVisitor [
  ^aVisitor acceptSplitmarkStatement: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSplitmarkStatement >> fastSetFilename: aPltExpression [
  filename := aPltExpression


]

{ #category : #'platypus-generated-accessing' }
PltSplitmarkStatement >> filename [
  ^filename


]

{ #category : #'platypus-generated-accessing' }
PltSplitmarkStatement >> filename: aPltExpression [
  filename := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSplitmarkStatement >> filenameUsingContext: aContext [
  ^self filename


]

{ #category : #'platypus-generated-group-accessing' }
PltSplitmarkStatement >> fromValues: values [
  ^self splitmarkStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSplitmarkStatement >> isPltSplitmarkStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSplitmarkStatement >> localFromValues: values [
  ^self splitmarkStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSplitmarkStatement >> localToValues: values [
  ^self splitmarkStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltSplitmarkStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSplitmarkStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self splitmarkStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSplitmarkStatement >> pltLocalCopyTo: another [
  self splitmarkStatementCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltSplitmarkStatement >> setFilename: aPltExpression [
  self filename: aPltExpression


]

{ #category : #'platypus-generated-copying' }
PltSplitmarkStatement >> splitmarkStatementCopyTo: another [
  another fastSetFilename: self filename


]

{ #category : #'platypus-generated-group-accessing' }
PltSplitmarkStatement >> splitmarkStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setFilename: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSplitmarkStatement >> splitmarkStatementToValues: values [
  values add: self filename.
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltSplitmarkStatement >> stepInitialize [
  super stepInitialize.
  filename := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltSplitmarkStatement >> toValues: values [
  ^self splitmarkStatementToValues: (super toValues: values)


]
