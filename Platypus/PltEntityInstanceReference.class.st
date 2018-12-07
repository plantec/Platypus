"
<ISO10303-11-EXPRESS>
ENTITY entity_instance_reference 
	SUBTYPE OF ( expression );
	persistent_label : STRING;
	ref : entity_instance;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEntityInstanceReference,
	#superclass : #PltExpression,
	#instVars : [
		'persistentLabel',
		'ref'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltEntityInstanceReference class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstanceReference class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstanceReference class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstanceReference class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEntityInstanceReference class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstanceReference class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEntityInstanceReference class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltEntityInstanceReference >> accept: aVisitor [
  ^aVisitor acceptEntityInstanceReference: self


]

{ #category : #'platypus-generated-copying' }
PltEntityInstanceReference >> entityInstanceReferenceCopyTo: another [
  another fastSetPersistentLabel: self persistentLabel.
  another fastSetRef: self ref


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceReference >> entityInstanceReferenceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setPersistentLabel: valuesloc removeFirst.
  self setRef: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceReference >> entityInstanceReferenceToValues: values [
  values add: self persistentLabel.
  values add: self ref.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityInstanceReference >> fastSetPersistentLabel: aString [
  persistentLabel := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltEntityInstanceReference >> fastSetRef: aPltEntityInstance [
  ref := aPltEntityInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceReference >> fromValues: values [
  ^self entityInstanceReferenceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltEntityInstanceReference >> isPltEntityInstanceReference [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceReference >> localFromValues: values [
  ^self entityInstanceReferenceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceReference >> localToValues: values [
  ^self entityInstanceReferenceToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstanceReference >> persistentLabel [
  ^persistentLabel


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstanceReference >> persistentLabel: aString [
  persistentLabel := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceReference >> persistentLabel: aString ref: aPltEntityInstance [ 	self setPersistentLabel:aString.	self setRef:aPltEntityInstance.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityInstanceReference >> persistentLabelUsingContext: aContext [
  ^self persistentLabel


]

{ #category : #'platypus-generated-copying' }
PltEntityInstanceReference >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltEntityInstanceReference >> pltCopyTo: another [
  super pltCopyTo: another.
  self entityInstanceReferenceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltEntityInstanceReference >> pltLocalCopyTo: another [
  self entityInstanceReferenceCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstanceReference >> ref [
  ^ref


]

{ #category : #'platypus-generated-accessing' }
PltEntityInstanceReference >> ref: aPltEntityInstance [
  ref := aPltEntityInstance


]

{ #category : #'platypus-generated-with-context-accessing' }
PltEntityInstanceReference >> refUsingContext: aContext [
  ^self ref


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityInstanceReference >> setPersistentLabel: aString [
  self persistentLabel: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltEntityInstanceReference >> setRef: aPltEntityInstance [
  self ref: aPltEntityInstance


]

{ #category : #'platypus-generated-initializing' }
PltEntityInstanceReference >> stepInitialize [
  super stepInitialize.
  persistentLabel := ''.
  ref := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltEntityInstanceReference >> toValues: values [
  ^self entityInstanceReferenceToValues: (super toValues: values)


]
