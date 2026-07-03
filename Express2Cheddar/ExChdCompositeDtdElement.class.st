"
<ISO10303-11-EXPRESS>
ENTITY composite_dtd_element 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( dtd_element );
DERIVE
	subs : LIST OF dtd_element := [ ];
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdCompositeDtdElement',
	#superclass : 'ExChdDtdElement',
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCompositeDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCompositeDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCompositeDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCompositeDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCompositeDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdCompositeDtdElement >> accept: aVisitor [
	^ aVisitor acceptCompositeDtdElement: self


]

{ #category : 'platypus-generated-copying' }
ExChdCompositeDtdElement >> compositeDtdElementCopyTo: another [
	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCompositeDtdElement >> compositeDtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCompositeDtdElement >> compositeDtdElementToValues: values [
	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCompositeDtdElement >> fromValues: values [
	^ self compositeDtdElementFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdCompositeDtdElement >> isExChdCompositeDtdElement [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCompositeDtdElement >> localFromValues: values [
	^ self compositeDtdElementFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCompositeDtdElement >> localToValues: values [
	^ self compositeDtdElementToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdCompositeDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdCompositeDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self compositeDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdCompositeDtdElement >> pltLocalCopyTo: another [
	self compositeDtdElementCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdCompositeDtdElement >> stepInitialize [
	super stepInitialize


]

{ #category : 'platypus-generated-deriving' }
ExChdCompositeDtdElement >> subs [
	^ self subsUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCompositeDtdElement >> subsUsingContext: aContext [
	^ self subsUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCompositeDtdElement >> subsUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCompositeDtdElement >> toValues: values [
	^ self compositeDtdElementToValues: (super toValues: values)


]
