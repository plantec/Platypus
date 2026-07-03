"
<ISO10303-11-EXPRESS>
ENTITY package_dtd_element 
	SUBTYPE OF ( composite_dtd_element );
	package : ada_package;
DERIVE
	SELF\dtd_element.tag : STRING := lowerize ( package.name );
	SELF\composite_dtd_element.subs : LIST OF dtd_element := compute_package_sub_elements ( SELF );
	SELF\dtd_element.dtd_code : STRING := compute_package_dtd_code ( SELF );
	attributes : LIST OF attribute_dtd_element := compute_package_attribute_dtd_elements ( SELF );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdPackageDtdElement',
	#superclass : 'ExChdCompositeDtdElement',
	#instVars : [
		'package'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdPackageDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdPackageDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdPackageDtdElement >> accept: aVisitor [
	^ aVisitor acceptPackageDtdElement: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageDtdElement >> attributes [
	^ self attributesUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageDtdElement >> attributesUsingContext: aContext [
	^ self attributesUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageDtdElement >> attributesUsingContext: aContext receiver: aReceiver [
	^ ExChdComputePackageAttributeDtdElementsFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageDtdElement >> dtdCode [
	^ self dtdCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageDtdElement >> dtdCodeUsingContext: aContext [
	^ self dtdCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageDtdElement >> dtdCodeUsingContext: aContext receiver: aReceiver [
	^ ExChdComputePackageDtdCodeFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdPackageDtdElement >> fastSetPackage: aExChdAdaPackage [
	package := aExChdAdaPackage


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPackageDtdElement >> fromValues: values [
	^ self packageDtdElementFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdPackageDtdElement >> isExChdPackageDtdElement [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPackageDtdElement >> localFromValues: values [
	^ self packageDtdElementFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPackageDtdElement >> localToValues: values [
	^ self packageDtdElementToValues: values


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageDtdElement >> package [
	^ package


]

{ #category : 'platypus-generated-accessing' }
ExChdPackageDtdElement >> package: aExChdAdaPackage [
	package := aExChdAdaPackage


]

{ #category : 'platypus-generated-copying' }
ExChdPackageDtdElement >> packageDtdElementCopyTo: another [
	another fastSetPackage: self package


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPackageDtdElement >> packageDtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setPackage: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPackageDtdElement >> packageDtdElementToValues: values [
	values add: self package.
	^ values


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdPackageDtdElement >> packageUsingContext: aContext [
	^ self package


]

{ #category : 'platypus-generated-copying' }
ExChdPackageDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdPackageDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self packageDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdPackageDtdElement >> pltLocalCopyTo: another [
	self packageDtdElementCopyTo: another


]

{ #category : 'platypus-generated-set-accessing' }
ExChdPackageDtdElement >> setPackage: aExChdAdaPackage [
	self package: aExChdAdaPackage


]

{ #category : 'platypus-generated-initializing' }
ExChdPackageDtdElement >> stepInitialize [
	super stepInitialize.
	package := nil


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageDtdElement >> subs [
	^ self subsUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageDtdElement >> subsUsingContext: aContext [
	^ self subsUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageDtdElement >> subsUsingContext: aContext receiver: aReceiver [
	^ ExChdComputePackageSubElementsFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageDtdElement >> tag [
	^ self tagUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageDtdElement >> tagUsingContext: aContext [
	^ self tagUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdPackageDtdElement >> tagUsingContext: aContext receiver: aReceiver [
	^ PTsLowerizeFunction
		invokeFromValues:
			(OrderedCollection new
				add: (aReceiver package nameUsingContext: self class context);
				yourself)


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPackageDtdElement >> toValues: values [
	^ self packageDtdElementToValues: (super toValues: values)


]
