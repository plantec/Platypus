"
<ISO10303-11-EXPRESS>
ENTITY attribute_dtd_element 
	SUBTYPE OF ( dtd_element );
	attribute : attribute;
	domain : domain_dtd_element;
DERIVE
	SELF\dtd_element.tag : STRING := lowerize ( attribute.name );
	SELF\dtd_element.dtd_code : STRING := domain.dtd_code;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAttributeDtdElement',
	#superclass : 'ExChdDtdElement',
	#instVars : [
		'domain',
		'attribute'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAttributeDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAttributeDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAttributeDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAttributeDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAttributeDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAttributeDtdElement >> accept: aVisitor [
	^ aVisitor acceptAttributeDtdElement: self


]

{ #category : 'platypus-generated-accessing' }
ExChdAttributeDtdElement >> attribute [
	^ attribute


]

{ #category : 'platypus-generated-accessing' }
ExChdAttributeDtdElement >> attribute: aExChdAttribute [
	attribute := aExChdAttribute


]

{ #category : 'platypus-generated-copying' }
ExChdAttributeDtdElement >> attributeDtdElementCopyTo: another [
	another fastSetAttribute: self attribute.
	another fastSetDomain: self domain


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAttributeDtdElement >> attributeDtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setAttribute: valuesloc removeFirst.
	self setDomain: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAttributeDtdElement >> attributeDtdElementToValues: values [
	values add: self attribute.
	values add: self domain.
	^ values


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdAttributeDtdElement >> attributeUsingContext: aContext [
	^ self attribute


]

{ #category : 'platypus-generated-accessing' }
ExChdAttributeDtdElement >> domain [
	^ domain


]

{ #category : 'platypus-generated-accessing' }
ExChdAttributeDtdElement >> domain: aExChdDomainDtdElement [
	domain := aExChdDomainDtdElement


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdAttributeDtdElement >> domainUsingContext: aContext [
	^ self domain


]

{ #category : 'platypus-generated-deriving' }
ExChdAttributeDtdElement >> dtdCode [
	^ self dtdCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAttributeDtdElement >> dtdCodeUsingContext: aContext [
	^ self dtdCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAttributeDtdElement >> dtdCodeUsingContext: aContext receiver: aReceiver [
	^ aReceiver domain dtdCodeUsingContext: aContext


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdAttributeDtdElement >> fastSetAttribute: aExChdAttribute [
	attribute := aExChdAttribute


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdAttributeDtdElement >> fastSetDomain: aExChdDomainDtdElement [
	domain := aExChdDomainDtdElement


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAttributeDtdElement >> fromValues: values [
	^ self attributeDtdElementFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdAttributeDtdElement >> isExChdAttributeDtdElement [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAttributeDtdElement >> localFromValues: values [
	^ self attributeDtdElementFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAttributeDtdElement >> localToValues: values [
	^ self attributeDtdElementToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAttributeDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAttributeDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self attributeDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAttributeDtdElement >> pltLocalCopyTo: another [
	self attributeDtdElementCopyTo: another


]

{ #category : 'platypus-generated-set-accessing' }
ExChdAttributeDtdElement >> setAttribute: aExChdAttribute [
	self attribute: aExChdAttribute


]

{ #category : 'platypus-generated-set-accessing' }
ExChdAttributeDtdElement >> setDomain: aExChdDomainDtdElement [
	self domain: aExChdDomainDtdElement


]

{ #category : 'platypus-generated-initializing' }
ExChdAttributeDtdElement >> stepInitialize [
	super stepInitialize.
	attribute := nil.
	domain := nil


]

{ #category : 'platypus-generated-deriving' }
ExChdAttributeDtdElement >> tag [
	^ self tagUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAttributeDtdElement >> tagUsingContext: aContext [
	^ self tagUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAttributeDtdElement >> tagUsingContext: aContext receiver: aReceiver [
	^ PTsLowerizeFunction
		invokeFromValues:
			(OrderedCollection new
				add: (aReceiver attribute nameUsingContext: self class context);
				yourself)


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAttributeDtdElement >> toValues: values [
	^ self attributeDtdElementToValues: (super toValues: values)


]
