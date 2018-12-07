"
<ISO10303-11-EXPRESS>
ENTITY end_splitmark_statement 
	SUBTYPE OF ( statement );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEndSplitmarkStatement,
	#superclass : #PltStatement,
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEndSplitmarkStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEndSplitmarkStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEndSplitmarkStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEndSplitmarkStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEndSplitmarkStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEndSplitmarkStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEndSplitmarkStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEndSplitmarkStatement >> accept: aVisitor [
  ^aVisitor acceptEndSplitmarkStatement: self


]

{ #category : #'platypus-generated-copying' }
PltEndSplitmarkStatement >> endSplitmarkStatementCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltEndSplitmarkStatement >> endSplitmarkStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEndSplitmarkStatement >> endSplitmarkStatementToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltEndSplitmarkStatement >> fromValues: values [
  ^self endSplitmarkStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltEndSplitmarkStatement >> isPltEndSplitmarkStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEndSplitmarkStatement >> localFromValues: values [
  ^self endSplitmarkStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEndSplitmarkStatement >> localToValues: values [
  ^self endSplitmarkStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltEndSplitmarkStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEndSplitmarkStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self endSplitmarkStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEndSplitmarkStatement >> pltLocalCopyTo: another [
  self endSplitmarkStatementCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltEndSplitmarkStatement >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltEndSplitmarkStatement >> toValues: values [
  ^self endSplitmarkStatementToValues: (super toValues: values)


]
