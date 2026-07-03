"
<ISO10303-11-EXPRESS>
ENTITY simple_domain_dtd_element 
	SUBTYPE OF ( domain_dtd_element );
DERIVE
	SELF\dtd_element.dtd_code : STRING := '<!ELEMENT ' + SELF.owner.tag + ' (#PCDATA)>\n';
	SELF\domain_dtd_element.as_collection_element_dtd_code_tail : STRING := '(#PCDATA)>\n';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdSimpleDomainDtdElement',
	#superclass : 'ExChdDomainDtdElement',
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdSimpleDomainDtdElement class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdSimpleDomainDtdElement class >> schemaDefinition [

	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdSimpleDomainDtdElement class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdSimpleDomainDtdElement class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdSimpleDomainDtdElement class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdSimpleDomainDtdElement >> accept: aVisitor [

	^ aVisitor acceptSimpleDomainDtdElement: self


]

{ #category : 'platypus-generated-deriving' }
ExChdSimpleDomainDtdElement >> asCollectionElementDtdCodeTail [

	^ self asCollectionElementDtdCodeTailUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdSimpleDomainDtdElement >> asCollectionElementDtdCodeTailUsingContext: aContext [

	^ self
		  asCollectionElementDtdCodeTailUsingContext: aContext
		  receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdSimpleDomainDtdElement >> asCollectionElementDtdCodeTailUsingContext: aContext receiver: aReceiver [

	^ '(#PCDATA)>\n'


]

{ #category : 'platypus-generated-deriving' }
ExChdSimpleDomainDtdElement >> dtdCode [

	^ self dtdCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdSimpleDomainDtdElement >> dtdCodeUsingContext: aContext [

	^ self dtdCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdSimpleDomainDtdElement >> dtdCodeUsingContext: aContext receiver: aReceiver [

	^ ('<!ELEMENT ' pltPlus:
		   ((aReceiver ownerUsingContext: aContext) tagUsingContext:
			    aContext)) pltPlus: ' (#PCDATA)>\n'


]

{ #category : 'platypus-generated-group-accessing' }
ExChdSimpleDomainDtdElement >> fromValues: values [

	^ self simpleDomainDtdElementFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdSimpleDomainDtdElement >> isExChdSimpleDomainDtdElement [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdSimpleDomainDtdElement >> localFromValues: values [

	^ self simpleDomainDtdElementFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdSimpleDomainDtdElement >> localToValues: values [

	^ self simpleDomainDtdElementToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdSimpleDomainDtdElement >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdSimpleDomainDtdElement >> pltCopyTo: another [

	super pltCopyTo: another.
	self simpleDomainDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdSimpleDomainDtdElement >> pltLocalCopyTo: another [

	self simpleDomainDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdSimpleDomainDtdElement >> simpleDomainDtdElementCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdSimpleDomainDtdElement >> simpleDomainDtdElementFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdSimpleDomainDtdElement >> simpleDomainDtdElementToValues: values [

	^ values


]

{ #category : 'platypus-generated-initializing' }
ExChdSimpleDomainDtdElement >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdSimpleDomainDtdElement >> toValues: values [

	^ self simpleDomainDtdElementToValues: (super toValues: values)


]
