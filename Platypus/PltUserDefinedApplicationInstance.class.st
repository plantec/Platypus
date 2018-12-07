"
<ISO10303-11-EXPRESS>
ENTITY user_defined_application_instance 
	SUBTYPE OF ( application_instance );
	name : STRING;
	parameters : LIST OF primitive;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltUserDefinedApplicationInstance,
	#superclass : #PltApplicationInstance,
	#instVars : [
		'parameters',
		'name'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltUserDefinedApplicationInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltUserDefinedApplicationInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUserDefinedApplicationInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUserDefinedApplicationInstance class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUserDefinedApplicationInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltUserDefinedApplicationInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltUserDefinedApplicationInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltUserDefinedApplicationInstance >> accept: aVisitor [
  ^aVisitor acceptUserDefinedApplicationInstance: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltUserDefinedApplicationInstance >> fastSetName: aString [
  name := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltUserDefinedApplicationInstance >> fastSetParameters: aListOfPltExpression [
  parameters := aListOfPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedApplicationInstance >> fromValues: values [
  ^self userDefinedApplicationInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltUserDefinedApplicationInstance >> isPltUserDefinedApplicationInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedApplicationInstance >> localFromValues: values [
  ^self userDefinedApplicationInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedApplicationInstance >> localToValues: values [
  ^self userDefinedApplicationInstanceToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltUserDefinedApplicationInstance >> name [
  ^name


]

{ #category : #'platypus-generated-accessing' }
PltUserDefinedApplicationInstance >> name: aString [
  name := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedApplicationInstance >> name: aString parameters: aListOfPltExpression [ 	self setName:aString.	self setParameters:aListOfPltExpression.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltUserDefinedApplicationInstance >> nameUsingContext: aContext [
  ^self name


]

{ #category : #'platypus-generated-accessing' }
PltUserDefinedApplicationInstance >> parameters [
  ^parameters


]

{ #category : #'platypus-generated-accessing' }
PltUserDefinedApplicationInstance >> parameters: aListOfPltExpression [
  parameters := aListOfPltExpression ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltExpression as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltUserDefinedApplicationInstance >> parametersUsingContext: aContext [
  ^self parameters


]

{ #category : #'platypus-generated-copying' }
PltUserDefinedApplicationInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltUserDefinedApplicationInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self userDefinedApplicationInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltUserDefinedApplicationInstance >> pltLocalCopyTo: another [
  self userDefinedApplicationInstanceCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltUserDefinedApplicationInstance >> setName: aString [
  self name: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltUserDefinedApplicationInstance >> setParameters: aListOfPltExpression [
  self parameters: aListOfPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltUserDefinedApplicationInstance >> stepInitialize [
  super stepInitialize.
  name := ''.
  parameters := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedApplicationInstance >> toValues: values [
  ^self userDefinedApplicationInstanceToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltUserDefinedApplicationInstance >> userDefinedApplicationInstanceCopyTo: another [
  another fastSetName: self name.
  another fastSetParameters: self parameters


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedApplicationInstance >> userDefinedApplicationInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setName: valuesloc removeFirst.
  self setParameters: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltUserDefinedApplicationInstance >> userDefinedApplicationInstanceToValues: values [
  values add: self name.
  values add: self parameters.
  ^values


]
