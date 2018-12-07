"
<ISO10303-11-EXPRESS>
ENTITY remark_reference 
	SUBTYPE OF ( dictionary_instance );
	prefix : STRING;
	suffix : OPTIONAL STRING;
	inside : dictionary_instance_reference;
	referenced : dictionary_instance_reference;
	remark : remark;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltRemarkReference,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'referenced',
		'suffix',
		'prefix',
		'inside',
		'remark'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltRemarkReference class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltRemarkReference class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRemarkReference class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRemarkReference class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltRemarkReference class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltRemarkReference class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltRemarkReference class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltRemarkReference >> accept: aVisitor [
  ^aVisitor acceptRemarkReference: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRemarkReference >> fastSetInside: aPltDictionaryInstanceReference [
  inside := aPltDictionaryInstanceReference


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRemarkReference >> fastSetPrefix: aString [
  prefix := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRemarkReference >> fastSetReferenced: aPltDictionaryInstanceReference [
  referenced := aPltDictionaryInstanceReference


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRemarkReference >> fastSetRemark: aPltRemark [
  remark := aPltRemark


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltRemarkReference >> fastSetSuffix: aString [
  suffix := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltRemarkReference >> fromValues: values [
  ^self remarkReferenceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltRemarkReference >> inside [
  ^inside


]

{ #category : #'platypus-generated-accessing' }
PltRemarkReference >> inside: aPltDictionaryInstanceReference [
  inside := aPltDictionaryInstanceReference


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRemarkReference >> insideUsingContext: aContext [
  ^self inside


]

{ #category : #'platypus-generated-classifying' }
PltRemarkReference >> isPltRemarkReference [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltRemarkReference >> localFromValues: values [
  ^self remarkReferenceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltRemarkReference >> localToValues: values [
  ^self remarkReferenceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltRemarkReference >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltRemarkReference >> pltCopyTo: another [
  super pltCopyTo: another.
  self remarkReferenceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltRemarkReference >> pltLocalCopyTo: another [
  self remarkReferenceCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltRemarkReference >> prefix [
  ^prefix


]

{ #category : #'platypus-generated-accessing' }
PltRemarkReference >> prefix: aString [
  prefix := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltRemarkReference >> prefix: aString suffix: aString1 inside: aPltDictionaryInstanceReference referenced: aPltDictionaryInstanceReference1 remark: aPltRemark [ 	self setPrefix:aString.	self setSuffix:aString1.	self setInside:aPltDictionaryInstanceReference.	self setReferenced:aPltDictionaryInstanceReference1.	self setRemark:aPltRemark.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRemarkReference >> prefixUsingContext: aContext [
  ^self prefix


]

{ #category : #'platypus-generated-accessing' }
PltRemarkReference >> referenced [
  ^referenced


]

{ #category : #'platypus-generated-accessing' }
PltRemarkReference >> referenced: aPltDictionaryInstanceReference [
  referenced := aPltDictionaryInstanceReference


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRemarkReference >> referencedUsingContext: aContext [
  ^self referenced


]

{ #category : #'platypus-generated-accessing' }
PltRemarkReference >> remark [
  ^remark


]

{ #category : #'platypus-generated-accessing' }
PltRemarkReference >> remark: aPltRemark [
  remark := aPltRemark


]

{ #category : #'platypus-generated-copying' }
PltRemarkReference >> remarkReferenceCopyTo: another [
  another fastSetPrefix: self prefix.
  another fastSetSuffix: self suffix.
  another fastSetInside: self inside.
  another fastSetReferenced: self referenced.
  another fastSetRemark: self remark


]

{ #category : #'platypus-generated-group-accessing' }
PltRemarkReference >> remarkReferenceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setPrefix: valuesloc removeFirst.
  self setSuffix: valuesloc removeFirst.
  self setInside: valuesloc removeFirst.
  self setReferenced: valuesloc removeFirst.
  self setRemark: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltRemarkReference >> remarkReferenceToValues: values [
  values add: self prefix.
  values add: self suffix.
  values add: self inside.
  values add: self referenced.
  values add: self remark.
  ^values


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRemarkReference >> remarkUsingContext: aContext [
  ^self remark


]

{ #category : #'platypus-generated-set-accessing' }
PltRemarkReference >> setInside: aPltDictionaryInstanceReference [
  self inside: aPltDictionaryInstanceReference


]

{ #category : #'platypus-generated-set-accessing' }
PltRemarkReference >> setPrefix: aString [
  self prefix: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltRemarkReference >> setReferenced: aPltDictionaryInstanceReference [
  self referenced: aPltDictionaryInstanceReference


]

{ #category : #'platypus-generated-set-accessing' }
PltRemarkReference >> setRemark: aPltRemark [
  self remark: aPltRemark


]

{ #category : #'platypus-generated-set-accessing' }
PltRemarkReference >> setSuffix: aString [
  self suffix: aString


]

{ #category : #'platypus-generated-initializing' }
PltRemarkReference >> stepInitialize [
  super stepInitialize.
  prefix := ''.
  suffix := nil.
  inside := nil.
  referenced := nil.
  remark := nil


]

{ #category : #'platypus-generated-accessing' }
PltRemarkReference >> suffix [
  ^suffix


]

{ #category : #'platypus-generated-accessing' }
PltRemarkReference >> suffix: aString [
  suffix := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltRemarkReference >> suffixUsingContext: aContext [
  ^self suffix


]

{ #category : #'platypus-generated-group-accessing' }
PltRemarkReference >> toValues: values [
  ^self remarkReferenceToValues: (super toValues: values)


]
