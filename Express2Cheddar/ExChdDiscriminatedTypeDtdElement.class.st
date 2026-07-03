"
<ISO10303-11-EXPRESS>
ENTITY discriminated_type_dtd_element 
	SUBTYPE OF ( entity_dtd_element );
DERIVE
	SELF\entity_dtd_element.subs : LIST OF dtd_element := compute_discriminated_type_sub_elements ( SELF );
	SELF\entity_dtd_element.dtd_code : STRING := compute_discriminated_type_code ( SELF );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDiscriminatedTypeDtdElement',
	#superclass : 'ExChdEntityDtdElement',
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdDiscriminatedTypeDtdElement >> accept: aVisitor [
	^ aVisitor acceptDiscriminatedTypeDtdElement: self


]

{ #category : 'platypus-generated-copying' }
ExChdDiscriminatedTypeDtdElement >> discriminatedTypeDtdElementCopyTo: another [
	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeDtdElement >> discriminatedTypeDtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeDtdElement >> discriminatedTypeDtdElementToValues: values [
	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedTypeDtdElement >> dtdCode [
	^ self dtdCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedTypeDtdElement >> dtdCodeUsingContext: aContext [
	^ self dtdCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedTypeDtdElement >> dtdCodeUsingContext: aContext receiver: aReceiver [
	^ ExChdComputeDiscriminatedTypeCodeFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeDtdElement >> fromValues: values [
	^ self discriminatedTypeDtdElementFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdDiscriminatedTypeDtdElement >> isExChdDiscriminatedTypeDtdElement [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeDtdElement >> localFromValues: values [
	^ self discriminatedTypeDtdElementFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeDtdElement >> localToValues: values [
	^ self discriminatedTypeDtdElementToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdDiscriminatedTypeDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdDiscriminatedTypeDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self discriminatedTypeDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdDiscriminatedTypeDtdElement >> pltLocalCopyTo: another [
	self discriminatedTypeDtdElementCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdDiscriminatedTypeDtdElement >> stepInitialize [
	super stepInitialize


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedTypeDtdElement >> subs [
	^ self subsUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedTypeDtdElement >> subsUsingContext: aContext [
	^ self subsUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDiscriminatedTypeDtdElement >> subsUsingContext: aContext receiver: aReceiver [
	^ ExChdComputeDiscriminatedTypeSubElementsFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeDtdElement >> toValues: values [
	^ self discriminatedTypeDtdElementToValues: (super toValues: values)


]
