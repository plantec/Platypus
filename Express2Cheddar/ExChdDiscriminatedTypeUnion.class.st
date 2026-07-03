"
<ISO10303-11-EXPRESS>
ENTITY discriminated_type_union 
	SUBTYPE OF ( explicit_attribute );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDiscriminatedTypeUnion',
	#superclass : 'PltExplicitAttribute',
	#category : 'Express2Cheddar-DiscriminatedTypeSchema',
	#package : 'Express2Cheddar',
	#tag : 'DiscriminatedTypeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnion class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeUnion class >> schemaDefinition [

	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeUnion class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnion class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnion class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdDiscriminatedTypeUnion >> accept: aVisitor [

	^ aVisitor acceptDiscriminatedTypeUnion: self


]

{ #category : 'platypus-generated-copying' }
ExChdDiscriminatedTypeUnion >> discriminatedTypeUnionCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnion >> discriminatedTypeUnionFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnion >> discriminatedTypeUnionToValues: values [

	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnion >> fromValues: values [

	^ self discriminatedTypeUnionFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdDiscriminatedTypeUnion >> isExChdDiscriminatedTypeUnion [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnion >> localFromValues: values [

	^ self discriminatedTypeUnionFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnion >> localToValues: values [

	^ self discriminatedTypeUnionToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdDiscriminatedTypeUnion >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdDiscriminatedTypeUnion >> pltCopyTo: another [

	super pltCopyTo: another.
	self discriminatedTypeUnionCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdDiscriminatedTypeUnion >> pltLocalCopyTo: another [

	self discriminatedTypeUnionCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdDiscriminatedTypeUnion >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeUnion >> toValues: values [

	^ self discriminatedTypeUnionToValues: (super toValues: values)


]
