"
<ISO10303-11-EXPRESS>
ENTITY escape_statement 
	SUBTYPE OF ( statement );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEscapeStatement,
	#superclass : #PltStatement,
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEscapeStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEscapeStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEscapeStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEscapeStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEscapeStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEscapeStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEscapeStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEscapeStatement >> accept: aVisitor [
  ^aVisitor acceptEscapeStatement: self


]

{ #category : #'platypus-generated-copying' }
PltEscapeStatement >> escapeStatementCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltEscapeStatement >> escapeStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEscapeStatement >> escapeStatementToValues: values [
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltEscapeStatement >> fromValues: values [
  ^self escapeStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltEscapeStatement >> isPltEscapeStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEscapeStatement >> localFromValues: values [
  ^self escapeStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEscapeStatement >> localToValues: values [
  ^self escapeStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltEscapeStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEscapeStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self escapeStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEscapeStatement >> pltLocalCopyTo: another [
  self escapeStatementCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltEscapeStatement >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltEscapeStatement >> toValues: values [
  ^self escapeStatementToValues: (super toValues: values)


]
