"
<ISO10303-11-EXPRESS>
ENTITY procedure_call_statement 
	SUBTYPE OF ( statement );
	call : identifier;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltProcedureCallStatement,
	#superclass : #PltStatement,
	#instVars : [
		'call'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltProcedureCallStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltProcedureCallStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltProcedureCallStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltProcedureCallStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltProcedureCallStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltProcedureCallStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltProcedureCallStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltProcedureCallStatement >> accept: aVisitor [
  ^aVisitor acceptProcedureCallStatement: self


]

{ #category : #'platypus-generated-accessing' }
PltProcedureCallStatement >> call [
  ^call


]

{ #category : #'platypus-generated-accessing' }
PltProcedureCallStatement >> call: aPltIdentifier [
  call := aPltIdentifier


]

{ #category : #'platypus-generated-with-context-accessing' }
PltProcedureCallStatement >> callUsingContext: aContext [
  ^self call


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltProcedureCallStatement >> fastSetCall: aPltIdentifier [
  call := aPltIdentifier


]

{ #category : #'platypus-generated-group-accessing' }
PltProcedureCallStatement >> fromValues: values [
  ^self procedureCallStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltProcedureCallStatement >> isPltProcedureCallStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltProcedureCallStatement >> localFromValues: values [
  ^self procedureCallStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltProcedureCallStatement >> localToValues: values [
  ^self procedureCallStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltProcedureCallStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltProcedureCallStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self procedureCallStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltProcedureCallStatement >> pltLocalCopyTo: another [
  self procedureCallStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltProcedureCallStatement >> procedureCallStatementCopyTo: another [
  another fastSetCall: self call


]

{ #category : #'platypus-generated-group-accessing' }
PltProcedureCallStatement >> procedureCallStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setCall: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltProcedureCallStatement >> procedureCallStatementToValues: values [
  values add: self call.
  ^values


]

{ #category : #'platypus-generated-set-accessing' }
PltProcedureCallStatement >> setCall: aPltIdentifier [
  self call: aPltIdentifier


]

{ #category : #'platypus-generated-initializing' }
PltProcedureCallStatement >> stepInitialize [
  super stepInitialize.
  call := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltProcedureCallStatement >> toValues: values [
  ^self procedureCallStatementToValues: (super toValues: values)


]
