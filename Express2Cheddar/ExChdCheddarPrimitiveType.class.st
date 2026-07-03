"
<ISO10303-11-EXPRESS>
ENTITY cheddar_primitive_type 
	SUBTYPE OF ( ada_primitive_type );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdCheddarPrimitiveType',
	#superclass : 'ExChdAdaPrimitiveType',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarPrimitiveType class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarPrimitiveType class >> schemaDefinition [

	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarPrimitiveType class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarPrimitiveType class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarPrimitiveType class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdCheddarPrimitiveType >> accept: aVisitor [

	^ aVisitor acceptCheddarPrimitiveType: self


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarPrimitiveType >> cheddarPrimitiveTypeCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarPrimitiveType >> cheddarPrimitiveTypeFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarPrimitiveType >> cheddarPrimitiveTypeToValues: values [

	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarPrimitiveType >> fromValues: values [

	^ self cheddarPrimitiveTypeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdCheddarPrimitiveType >> isExChdCheddarPrimitiveType [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarPrimitiveType >> localFromValues: values [

	^ self cheddarPrimitiveTypeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarPrimitiveType >> localToValues: values [

	^ self cheddarPrimitiveTypeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarPrimitiveType >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarPrimitiveType >> pltCopyTo: another [

	super pltCopyTo: another.
	self cheddarPrimitiveTypeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarPrimitiveType >> pltLocalCopyTo: another [

	self cheddarPrimitiveTypeCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdCheddarPrimitiveType >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarPrimitiveType >> toValues: values [

	^ self cheddarPrimitiveTypeToValues: (super toValues: values)


]
