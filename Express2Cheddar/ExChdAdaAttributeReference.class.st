"
<ISO10303-11-EXPRESS>
ENTITY ada_attribute_reference 
	SUBTYPE OF ( ada_named_type_reference );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaAttributeReference',
	#superclass : 'ExChdAdaNamedTypeReference',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaAttributeReference class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaAttributeReference class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaAttributeReference class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaAttributeReference class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaAttributeReference class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaAttributeReference >> accept: aVisitor [
	^ aVisitor acceptAdaAttributeReference: self


]

{ #category : 'platypus-generated-copying' }
ExChdAdaAttributeReference >> adaAttributeReferenceCopyTo: another [
	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaAttributeReference >> adaAttributeReferenceFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaAttributeReference >> adaAttributeReferenceToValues: values [
	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaAttributeReference >> fromValues: values [
	^ self adaAttributeReferenceFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaAttributeReference >> isExChdAdaAttributeReference [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaAttributeReference >> localFromValues: values [
	^ self adaAttributeReferenceFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaAttributeReference >> localToValues: values [
	^ self adaAttributeReferenceToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaAttributeReference >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaAttributeReference >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaAttributeReferenceCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaAttributeReference >> pltLocalCopyTo: another [
	self adaAttributeReferenceCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaAttributeReference >> stepInitialize [
	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaAttributeReference >> toValues: values [
	^ self adaAttributeReferenceToValues: (super toValues: values)


]
