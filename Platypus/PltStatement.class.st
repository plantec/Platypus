"
<ISO10303-11-EXPRESS>
ENTITY statement 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( dictionary_instance );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltStatement,
	#superclass : #PltDictionaryInstance,
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltStatement >> accept: aVisitor [
  ^aVisitor acceptStatement: self


]

{ #category : #'platypus-generated-group-accessing' }
PltStatement >> fromValues: values [
  ^self statementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltStatement >> isPltStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltStatement >> localFromValues: values [
  ^self statementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltStatement >> localToValues: values [
  ^self statementToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltStatement >> owner [
	^ owner


]

{ #category : #'platypus-generated-copying' }
PltStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self statementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltStatement >> pltLocalCopyTo: another [
  self statementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltStatement >> statementCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltStatement >> statementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltStatement >> statementToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltStatement >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltStatement >> toValues: values [
  ^self statementToValues: (super toValues: values)


]
