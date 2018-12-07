"
<ISO10303-11-EXPRESS>
ENTITY alias_statement_variable 
	SUBTYPE OF ( dictionary_instance );
	alias_ident : STRING;
	ref : assignable;
	SELF\entity_instance.owner : alias_statement;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAliasStatementVariable,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'aliasIdent',
		'ref'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAliasStatementVariable class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAliasStatementVariable class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAliasStatementVariable class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAliasStatementVariable class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAliasStatementVariable class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAliasStatementVariable class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAliasStatementVariable class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAliasStatementVariable >> accept: aVisitor [
  ^aVisitor acceptAliasStatementVariable: self


]

{ #category : #'platypus-generated-accessing' }
PltAliasStatementVariable >> aliasIdent [
  ^aliasIdent


]

{ #category : #'platypus-generated-accessing' }
PltAliasStatementVariable >> aliasIdent: aString [
  aliasIdent := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatementVariable >> aliasIdent: aString ref: aPltAssignable owner: aPltAliasStatement [ 	self setAliasIdent:aString.	self setRef:aPltAssignable.	self setOwner:aPltAliasStatement.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAliasStatementVariable >> aliasIdentUsingContext: aContext [
  ^self aliasIdent


]

{ #category : #'platypus-generated-copying' }
PltAliasStatementVariable >> aliasStatementVariableCopyTo: another [
  another fastSetAliasIdent: self aliasIdent.
  another fastSetRef: self ref.
  another fastSetOwner: self owner


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatementVariable >> aliasStatementVariableFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setAliasIdent: valuesloc removeFirst.
  self setRef: valuesloc removeFirst.
  self setOwner: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatementVariable >> aliasStatementVariableToValues: values [
  values add: self aliasIdent.
  values add: self ref.
  values add: self owner.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAliasStatementVariable >> fastSetAliasIdent: aString [
  aliasIdent := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAliasStatementVariable >> fastSetOwner: aPltAliasStatement [
  owner := aPltAliasStatement


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAliasStatementVariable >> fastSetRef: aPltAssignable [
  ref := aPltAssignable


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatementVariable >> fromValues: values [
  ^self aliasStatementVariableFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAliasStatementVariable >> isPltAliasStatementVariable [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatementVariable >> localFromValues: values [
  ^self aliasStatementVariableFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatementVariable >> localToValues: values [
  ^self aliasStatementVariableToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltAliasStatementVariable >> owner [
  ^owner


]

{ #category : #'platypus-generated-accessing' }
PltAliasStatementVariable >> owner: aPltAliasStatement [
  owner := aPltAliasStatement


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAliasStatementVariable >> ownerUsingContext: aContext [
  ^self owner


]

{ #category : #'platypus-generated-copying' }
PltAliasStatementVariable >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAliasStatementVariable >> pltCopyTo: another [
  super pltCopyTo: another.
  self aliasStatementVariableCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAliasStatementVariable >> pltLocalCopyTo: another [
  self aliasStatementVariableCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltAliasStatementVariable >> ref [
  ^ref


]

{ #category : #'platypus-generated-accessing' }
PltAliasStatementVariable >> ref: aPltAssignable [
  ref := aPltAssignable


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAliasStatementVariable >> refUsingContext: aContext [
  ^self ref


]

{ #category : #'platypus-generated-set-accessing' }
PltAliasStatementVariable >> setAliasIdent: aString [
  self aliasIdent: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltAliasStatementVariable >> setOwner: aPltAliasStatement [
  self owner: aPltAliasStatement


]

{ #category : #'platypus-generated-set-accessing' }
PltAliasStatementVariable >> setRef: aPltAssignable [
  self ref: aPltAssignable


]

{ #category : #'platypus-generated-initializing' }
PltAliasStatementVariable >> stepInitialize [
  super stepInitialize.
  aliasIdent := ''.
  ref := nil.
  owner := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltAliasStatementVariable >> toValues: values [
  ^self aliasStatementVariableToValues: (super toValues: values)


]
