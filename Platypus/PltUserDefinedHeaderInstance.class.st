"
<ISO10303-11-EXPRESS>
ENTITY user_defined_header_instance 
	SUBTYPE OF ( header_instance );
	name : STRING;
	parameters : LIST OF primitive;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltUserDefinedHeaderInstance,
	#superclass : #PltHeaderInstance,
	#instVars : [
		'parameters',
		'name'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltUserDefinedHeaderInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltUserDefinedHeaderInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUserDefinedHeaderInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUserDefinedHeaderInstance class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUserDefinedHeaderInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltUserDefinedHeaderInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltUserDefinedHeaderInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltUserDefinedHeaderInstance >> accept: aVisitor [
  ^aVisitor acceptUserDefinedHeaderInstance: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltUserDefinedHeaderInstance >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltUserDefinedHeaderInstance >> fastSetParameters: aListOfPltExpression [
  parameters := aListOfPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedHeaderInstance >> fromValues: values [
  ^self userDefinedHeaderInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltUserDefinedHeaderInstance >> isPltUserDefinedHeaderInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedHeaderInstance >> localFromValues: values [
  ^self userDefinedHeaderInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedHeaderInstance >> localToValues: values [
  ^self userDefinedHeaderInstanceToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltUserDefinedHeaderInstance >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltUserDefinedHeaderInstance >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedHeaderInstance >> name: aString parameters: aListOfPltExpression [ 	self setName:aString.	self setParameters:aListOfPltExpression.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltUserDefinedHeaderInstance >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-accessing' }
PltUserDefinedHeaderInstance >> parameters [
  ^parameters


]

{ #category : #'platypus-generated-accessing' }
PltUserDefinedHeaderInstance >> parameters: aListOfPltExpression [
  parameters := aListOfPltExpression ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltExpression as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltUserDefinedHeaderInstance >> parametersUsingContext: aContext [
  ^self parameters


]

{ #category : #'platypus-generated-copying' }
PltUserDefinedHeaderInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltUserDefinedHeaderInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self userDefinedHeaderInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltUserDefinedHeaderInstance >> pltLocalCopyTo: another [
  self userDefinedHeaderInstanceCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltUserDefinedHeaderInstance >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltUserDefinedHeaderInstance >> setParameters: aListOfPltExpression [
  self parameters: aListOfPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltUserDefinedHeaderInstance >> stepInitialize [
  super stepInitialize.
  name := ''.
  parameters := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedHeaderInstance >> toValues: values [
  ^self userDefinedHeaderInstanceToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltUserDefinedHeaderInstance >> userDefinedHeaderInstanceCopyTo: another [
  another fastSetName: self name.
  another fastSetParameters: self parameters


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedHeaderInstance >> userDefinedHeaderInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setName: valuesloc removeFirst.
  self setParameters: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedHeaderInstance >> userDefinedHeaderInstanceToValues: values [
  values add: self name.
  values add: self parameters.
  ^values


]
