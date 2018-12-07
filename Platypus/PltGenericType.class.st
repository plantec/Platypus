"
<ISO10303-11-EXPRESS>
ENTITY generic_type 
	SUBTYPE OF ( dictionary_instance );
	type_label : OPTIONAL STRING;
DERIVE
	accepted : entity_instance := SELF.accept_generic_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltGenericType,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'typeLabel'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltGenericType class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltGenericType class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGenericType class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGenericType class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGenericType class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltGenericType class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltGenericType class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltGenericType >> accept: aVisitor [
  ^aVisitor acceptGenericType: self


]

{ #category : #'platypus-generated-deriving' }
PltGenericType >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltGenericType >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltGenericType >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptGenericTypeUsingContext: aContext


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltGenericType >> fastSetTypeLabel: aString [
  typeLabel := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltGenericType >> fromValues: values [
  ^self genericTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltGenericType >> genericTypeCopyTo: another [
  another fastSetTypeLabel: self typeLabel


]

{ #category : #'platypus-generated-group-accessing' }
PltGenericType >> genericTypeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setTypeLabel: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltGenericType >> genericTypeToValues: values [
  values add: self typeLabel.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltGenericType >> isPltGenericType [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltGenericType >> localFromValues: values [
  ^self genericTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltGenericType >> localToValues: values [
  ^self genericTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltGenericType >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltGenericType >> pltCopyTo: another [
  super pltCopyTo: another.
  self genericTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltGenericType >> pltLocalCopyTo: another [
  self genericTypeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltGenericType >> setTypeLabel: aString [
  self typeLabel: aString


]

{ #category : #'platypus-generated-initializing' }
PltGenericType >> stepInitialize [
  super stepInitialize.
  typeLabel := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltGenericType >> toValues: values [
  ^self genericTypeToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltGenericType >> typeLabel [
  ^typeLabel


]

{ #category : #'platypus-generated-accessing' }
PltGenericType >> typeLabel: aString [
  typeLabel := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltGenericType >> typeLabelUsingContext: aContext [
  ^self typeLabel


]
