"
<ISO10303-11-EXPRESS>
ENTITY statements_container 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( context_definition );
	locals : LIST OF local_variable;
	statements : LIST OF statement;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltStatementsContainer,
	#superclass : #PltContextDefinition,
	#instVars : [
		'statements',
		'locals'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltStatementsContainer class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltStatementsContainer class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltStatementsContainer class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltStatementsContainer class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltStatementsContainer class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltStatementsContainer class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltStatementsContainer class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltStatementsContainer >> accept: aVisitor [
  ^aVisitor acceptStatementsContainer: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltStatementsContainer >> fastSetLocals: aListOfPltLocalVariable [
  locals := aListOfPltLocalVariable


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltStatementsContainer >> fastSetStatements: aListOfPltStatement [
  statements := aListOfPltStatement


]

{ #category : #'platypus-generated-group-accessing' }
PltStatementsContainer >> fromValues: values [
  ^self statementsContainerFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltStatementsContainer >> isPltStatementsContainer [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltStatementsContainer >> localFromValues: values [
  ^self statementsContainerFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltStatementsContainer >> localToValues: values [
  ^self statementsContainerToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltStatementsContainer >> locals [
  ^locals


]

{ #category : #'platypus-generated-accessing' }
PltStatementsContainer >> locals: aListOfPltLocalVariable [
  locals := aListOfPltLocalVariable ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltLocalVariable as: OrderedCollection ]


]

{ #category : #'platypus-generated-group-accessing' }
PltStatementsContainer >> locals: aListOfPltLocalVariable statements: aListOfPltStatement [ 	self setLocals:aListOfPltLocalVariable.	self setStatements:aListOfPltStatement.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltStatementsContainer >> localsUsingContext: aContext [
  ^self locals


]

{ #category : #'platypus-generated-copying' }
PltStatementsContainer >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltStatementsContainer >> pltCopyTo: another [
  super pltCopyTo: another.
  self statementsContainerCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltStatementsContainer >> pltLocalCopyTo: another [
  self statementsContainerCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltStatementsContainer >> setLocals: aListOfPltLocalVariable [
  self locals: aListOfPltLocalVariable


]

{ #category : #'platypus-generated-set-accessing' }
PltStatementsContainer >> setStatements: aListOfPltStatement [
  self statements: aListOfPltStatement


]

{ #category : #'platypus-generated-accessing' }
PltStatementsContainer >> statements [
  ^statements


]

{ #category : #'platypus-generated-accessing' }
PltStatementsContainer >> statements: aListOfPltStatement [
  statements := aListOfPltStatement ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltStatement as: OrderedCollection ]


]

{ #category : #'platypus-generated-copying' }
PltStatementsContainer >> statementsContainerCopyTo: another [
  another fastSetLocals: self locals.
  another fastSetStatements: self statements


]

{ #category : #'platypus-generated-group-accessing' }
PltStatementsContainer >> statementsContainerFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setLocals: valuesloc removeFirst.
  self setStatements: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltStatementsContainer >> statementsContainerToValues: values [
  values add: self locals.
  values add: self statements.
  ^values


]

{ #category : #'platypus-generated-with-context-accessing' }
PltStatementsContainer >> statementsUsingContext: aContext [
  ^self statements


]

{ #category : #'platypus-generated-initializing' }
PltStatementsContainer >> stepInitialize [
  super stepInitialize.
  locals := OrderedCollection new.
  statements := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltStatementsContainer >> toValues: values [
  ^self statementsContainerToValues: (super toValues: values)


]
