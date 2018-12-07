"
<ISO10303-11-EXPRESS>
ENTITY application_instance 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( entity_instance );
	owning_model : model_contents;
	persistent_label : STRING;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltApplicationInstance,
	#superclass : #PltEntityInstance,
	#instVars : [
		'owningModel',
		'persistentLabel'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltApplicationInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltApplicationInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltApplicationInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltApplicationInstance class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltApplicationInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltApplicationInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltApplicationInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltApplicationInstance >> accept: aVisitor [
  ^aVisitor acceptApplicationInstance: self


]

{ #category : #'platypus-generated-copying' }
PltApplicationInstance >> applicationInstanceCopyTo: another [
  another fastSetOwningModel: self owningModel.
  another fastSetPersistentLabel: self persistentLabel


]

{ #category : #'platypus-generated-group-accessing' }
PltApplicationInstance >> applicationInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setOwningModel: valuesloc removeFirst.
  self setPersistentLabel: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltApplicationInstance >> applicationInstanceToValues: values [
  values add: self owningModel.
  values add: self persistentLabel.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltApplicationInstance >> fastSetOwningModel: aPltModelContents [
  owningModel := aPltModelContents


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltApplicationInstance >> fastSetPersistentLabel: aString [
  persistentLabel := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltApplicationInstance >> fromValues: values [
  ^self applicationInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltApplicationInstance >> isPltApplicationInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltApplicationInstance >> localFromValues: values [
  ^self applicationInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltApplicationInstance >> localToValues: values [
  ^self applicationInstanceToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltApplicationInstance >> owningModel [
  ^owningModel


]

{ #category : #'platypus-generated-accessing' }
PltApplicationInstance >> owningModel: aPltModelContents [
  owningModel := aPltModelContents


]

{ #category : #'platypus-generated-group-accessing' }
PltApplicationInstance >> owningModel: aPltModelContents persistentLabel: aString [ 	self setOwningModel:aPltModelContents.	self setPersistentLabel:aString.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltApplicationInstance >> owningModelUsingContext: aContext [
  ^self owningModel


]

{ #category : #'platypus-generated-accessing' }
PltApplicationInstance >> persistentLabel [
  ^persistentLabel


]

{ #category : #'platypus-generated-accessing' }
PltApplicationInstance >> persistentLabel: aString [
  persistentLabel := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltApplicationInstance >> persistentLabelUsingContext: aContext [
  ^self persistentLabel


]

{ #category : #'platypus-generated-copying' }
PltApplicationInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltApplicationInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self applicationInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltApplicationInstance >> pltLocalCopyTo: another [
  self applicationInstanceCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltApplicationInstance >> setOwningModel: aPltModelContents [
  self owningModel: aPltModelContents


]

{ #category : #'platypus-generated-set-accessing' }
PltApplicationInstance >> setPersistentLabel: aString [
  self persistentLabel: aString


]

{ #category : #'platypus-generated-initializing' }
PltApplicationInstance >> stepInitialize [
  super stepInitialize.
  owningModel := nil.
  persistentLabel := ''


]

{ #category : #'platypus-generated-group-accessing' }
PltApplicationInstance >> toValues: values [
  ^self applicationInstanceToValues: (super toValues: values)


]
