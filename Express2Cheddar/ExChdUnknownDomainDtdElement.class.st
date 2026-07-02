"
<ISO10303-11-EXPRESS>
ENTITY unknown_domain_dtd_element 
	SUBTYPE OF ( domain_dtd_element );
DERIVE
	SELF\dtd_element.dtd_code : STRING := '<!ELEMENT ' + SELF.owner.tag + ' ANY>\n';
	SELF\domain_dtd_element.as_collection_element_dtd_code_tail : STRING := 'ANY>\n';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdUnknownDomainDtdElement,
	#superclass : #ExChdDomainDtdElement,
	#category : #'Express2Cheddar-CheddarDtdSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdUnknownDomainDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdUnknownDomainDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdUnknownDomainDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdUnknownDomainDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdUnknownDomainDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdUnknownDomainDtdElement >> accept: aVisitor [
	^ aVisitor acceptUnknownDomainDtdElement: self


]

{ #category : #'platypus-generated-deriving' }
ExChdUnknownDomainDtdElement >> asCollectionElementDtdCodeTail [
	^ self asCollectionElementDtdCodeTailUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdUnknownDomainDtdElement >> asCollectionElementDtdCodeTailUsingContext: aContext [
	^ self asCollectionElementDtdCodeTailUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdUnknownDomainDtdElement >> asCollectionElementDtdCodeTailUsingContext: aContext receiver: aReceiver [
	^ 'ANY>\n'


]

{ #category : #'platypus-generated-deriving' }
ExChdUnknownDomainDtdElement >> dtdCode [
	^ self dtdCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdUnknownDomainDtdElement >> dtdCodeUsingContext: aContext [
	^ self dtdCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdUnknownDomainDtdElement >> dtdCodeUsingContext: aContext receiver: aReceiver [
	^ ('<!ELEMENT ' pltPlus: ((aReceiver ownerUsingContext: aContext) tagUsingContext: aContext)) pltPlus: ' ANY>\n'


]

{ #category : #'platypus-generated-group-accessing' }
ExChdUnknownDomainDtdElement >> fromValues: values [
	^ self unknownDomainDtdElementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdUnknownDomainDtdElement >> isExChdUnknownDomainDtdElement [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdUnknownDomainDtdElement >> localFromValues: values [
	^ self unknownDomainDtdElementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdUnknownDomainDtdElement >> localToValues: values [
	^ self unknownDomainDtdElementToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdUnknownDomainDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdUnknownDomainDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self unknownDomainDtdElementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdUnknownDomainDtdElement >> pltLocalCopyTo: another [
	self unknownDomainDtdElementCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
ExChdUnknownDomainDtdElement >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdUnknownDomainDtdElement >> toValues: values [
	^ self unknownDomainDtdElementToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
ExChdUnknownDomainDtdElement >> unknownDomainDtdElementCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdUnknownDomainDtdElement >> unknownDomainDtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdUnknownDomainDtdElement >> unknownDomainDtdElementToValues: values [
	^ values


]
