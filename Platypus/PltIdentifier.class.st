"
<ISO10303-11-EXPRESS>
ENTITY identifier 
	SUBTYPE OF ( unary_expression );
	name : STRING;
	ref : dictionary_instance;
	parameters : OPTIONAL LIST OF expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltIdentifier,
	#superclass : #PltUnaryExpression,
	#instVars : [
		'parameters',
		'contextsStack',
		'name',
		'ref'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltIdentifier class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltIdentifier class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIdentifier class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIdentifier class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltIdentifier class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltIdentifier class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltIdentifier class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltIdentifier >> accept: aVisitor [
  ^aVisitor acceptIdentifier: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIdentifier >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIdentifier >> fastSetParameters: aListOfPltExpression [
  parameters := aListOfPltExpression


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltIdentifier >> fastSetRef: aPltDictionaryInstance [
  ref := aPltDictionaryInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltIdentifier >> fromValues: values [
  ^self identifierFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltIdentifier >> identifierCopyTo: another [
  another fastSetName: self name.
  another fastSetRef: self ref.
  another fastSetParameters: self parameters


]

{ #category : #'platypus-generated-group-accessing' }
PltIdentifier >> identifierFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setName: valuesloc removeFirst.
  self setRef: valuesloc removeFirst.
  self setParameters: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltIdentifier >> identifierToValues: values [
  values add: self name.
  values add: self ref.
  values add: self parameters.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltIdentifier >> isPltIdentifier [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltIdentifier >> localFromValues: values [
  ^self identifierFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltIdentifier >> localToValues: values [
  ^self identifierToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltIdentifier >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltIdentifier >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltIdentifier >> name: aString ref: aPltDictionaryInstance parameters: aListOfPltExpression [ 	self setName:aString.	self setRef:aPltDictionaryInstance.	self setParameters:aListOfPltExpression.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIdentifier >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-accessing' }
PltIdentifier >> parameters [
  ^parameters


]

{ #category : #'platypus-generated-accessing' }
PltIdentifier >> parameters: aListOfPltExpression [
  parameters := aListOfPltExpression ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltExpression as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIdentifier >> parametersUsingContext: aContext [
  ^self parameters


]

{ #category : #'platypus-generated-copying' }
PltIdentifier >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltIdentifier >> pltCopyTo: another [
  super pltCopyTo: another.
  self identifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltIdentifier >> pltLocalCopyTo: another [
  self identifierCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltIdentifier >> ref [
  ^ref


]

{ #category : #'platypus-generated-accessing' }
PltIdentifier >> ref: aPltDictionaryInstance [
  ref := aPltDictionaryInstance


]

{ #category : #'platypus-generated-with-context-accessing' }
PltIdentifier >> refUsingContext: aContext [
  ^self ref


]

{ #category : #'platypus-generated-set-accessing' }
PltIdentifier >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltIdentifier >> setParameters: aListOfPltExpression [
  self parameters: aListOfPltExpression


]

{ #category : #'platypus-generated-set-accessing' }
PltIdentifier >> setRef: aPltDictionaryInstance [
  self ref: aPltDictionaryInstance


]

{ #category : #'platypus-generated-initializing' }
PltIdentifier >> stepInitialize [
  super stepInitialize.
  name := ''.
  ref := nil.
  parameters := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltIdentifier >> toValues: values [
  ^self identifierToValues: (super toValues: values)


]
