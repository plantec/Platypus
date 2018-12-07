"
<ISO10303-11-EXPRESS>
ENTITY null_statement 
	SUBTYPE OF ( statement );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNullStatement,
	#superclass : #PltStatement,
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltNullStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltNullStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNullStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNullStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNullStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNullStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNullStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltNullStatement >> accept: aVisitor [
  ^aVisitor acceptNullStatement: self


]

{ #category : #'platypus-generated-group-accessing' }
PltNullStatement >> fromValues: values [
  ^self nullStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltNullStatement >> isPltNullStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltNullStatement >> localFromValues: values [
  ^self nullStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltNullStatement >> localToValues: values [
  ^self nullStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltNullStatement >> nullStatementCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltNullStatement >> nullStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltNullStatement >> nullStatementToValues: values [
  ^values


]

{ #category : #'platypus-generated-copying' }
PltNullStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltNullStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self nullStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltNullStatement >> pltLocalCopyTo: another [
  self nullStatementCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltNullStatement >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltNullStatement >> toValues: values [
  ^self nullStatementToValues: (super toValues: values)


]
