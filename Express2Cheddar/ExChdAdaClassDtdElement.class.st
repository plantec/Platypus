"
<ISO10303-11-EXPRESS>
ENTITY ada_class_dtd_element 
	SUBTYPE OF ( entity_dtd_element );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaClassDtdElement',
	#superclass : 'ExChdEntityDtdElement',
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassDtdElement class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaClassDtdElement class >> schemaDefinition [

	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaClassDtdElement class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassDtdElement class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassDtdElement class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaClassDtdElement >> accept: aVisitor [

	^ aVisitor acceptAdaClassDtdElement: self


]

{ #category : 'platypus-generated-copying' }
ExChdAdaClassDtdElement >> adaClassDtdElementCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClassDtdElement >> adaClassDtdElementFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClassDtdElement >> adaClassDtdElementToValues: values [

	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClassDtdElement >> fromValues: values [

	^ self adaClassDtdElementFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaClassDtdElement >> isExChdAdaClassDtdElement [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClassDtdElement >> localFromValues: values [

	^ self adaClassDtdElementFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClassDtdElement >> localToValues: values [

	^ self adaClassDtdElementToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaClassDtdElement >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaClassDtdElement >> pltCopyTo: another [

	super pltCopyTo: another.
	self adaClassDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaClassDtdElement >> pltLocalCopyTo: another [

	self adaClassDtdElementCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaClassDtdElement >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClassDtdElement >> toValues: values [

	^ self adaClassDtdElementToValues: (super toValues: values)


]
