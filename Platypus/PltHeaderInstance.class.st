"
<ISO10303-11-EXPRESS>
ENTITY header_instance 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( entity_instance );
	owning_model : model_contents;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltHeaderInstance,
	#superclass : #PltEntityInstance,
	#instVars : [
		'owningModel'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltHeaderInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltHeaderInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltHeaderInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltHeaderInstance class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltHeaderInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltHeaderInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltHeaderInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltHeaderInstance >> accept: aVisitor [
  ^aVisitor acceptHeaderInstance: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltHeaderInstance >> fastSetOwningModel: aPltModelContents [
  owningModel := aPltModelContents


]

{ #category : #'platypus-generated-group-accessing' }
PltHeaderInstance >> fromValues: values [
  ^self headerInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltHeaderInstance >> headerInstanceCopyTo: another [
  another fastSetOwningModel: self owningModel


]

{ #category : #'platypus-generated-group-accessing' }
PltHeaderInstance >> headerInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setOwningModel: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltHeaderInstance >> headerInstanceToValues: values [
  values add: self owningModel.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltHeaderInstance >> isPltHeaderInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltHeaderInstance >> localFromValues: values [
  ^self headerInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltHeaderInstance >> localToValues: values [
  ^self headerInstanceToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltHeaderInstance >> owningModel [
  ^owningModel


]

{ #category : #'platypus-generated-accessing' }
PltHeaderInstance >> owningModel: aPltModelContents [
  owningModel := aPltModelContents


]

{ #category : #'platypus-generated-with-context-accessing' }
PltHeaderInstance >> owningModelUsingContext: aContext [
  ^self owningModel


]

{ #category : #'platypus-generated-copying' }
PltHeaderInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltHeaderInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self headerInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltHeaderInstance >> pltLocalCopyTo: another [
  self headerInstanceCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltHeaderInstance >> setOwningModel: aPltModelContents [
  self owningModel: aPltModelContents


]

{ #category : #'platypus-generated-initializing' }
PltHeaderInstance >> stepInitialize [
  super stepInitialize.
  owningModel := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltHeaderInstance >> toValues: values [
  ^self headerInstanceToValues: (super toValues: values)


]
