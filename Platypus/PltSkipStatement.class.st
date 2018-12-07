"
<ISO10303-11-EXPRESS>
ENTITY skip_statement 
	SUBTYPE OF ( statement );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSkipStatement,
	#superclass : #PltStatement,
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSkipStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSkipStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSkipStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSkipStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSkipStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSkipStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSkipStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSkipStatement >> accept: aVisitor [
  ^aVisitor acceptSkipStatement: self


]

{ #category : #'platypus-generated-group-accessing' }
PltSkipStatement >> fromValues: values [
  ^self skipStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSkipStatement >> isPltSkipStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSkipStatement >> localFromValues: values [
  ^self skipStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSkipStatement >> localToValues: values [
  ^self skipStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltSkipStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSkipStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self skipStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSkipStatement >> pltLocalCopyTo: another [
  self skipStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSkipStatement >> skipStatementCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltSkipStatement >> skipStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSkipStatement >> skipStatementToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltSkipStatement >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltSkipStatement >> toValues: values [
  ^self skipStatementToValues: (super toValues: values)


]
