"
<ISO10303-11-EXPRESS>
ENTITY collection_dtd_element 
	SUBTYPE OF ( domain_dtd_element );
	element_domain : domain_dtd_element;
DERIVE
	SELF\dtd_element.dtd_code : STRING := '<!ELEMENT ' + owner.tag + ' ' + element_domain.as_collection_element_dtd_code_tail;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdCollectionDtdElement',
	#superclass : 'ExChdDomainDtdElement',
	#instVars : [
		'elementDomain'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCollectionDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCollectionDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCollectionDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCollectionDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCollectionDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdCollectionDtdElement >> accept: aVisitor [
	^ aVisitor acceptCollectionDtdElement: self


]

{ #category : 'platypus-generated-copying' }
ExChdCollectionDtdElement >> collectionDtdElementCopyTo: another [
	another fastSetElementDomain: self elementDomain


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCollectionDtdElement >> collectionDtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setElementDomain: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCollectionDtdElement >> collectionDtdElementToValues: values [
	values add: self elementDomain.
	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdCollectionDtdElement >> dtdCode [
	^ self dtdCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCollectionDtdElement >> dtdCodeUsingContext: aContext [
	^ self dtdCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCollectionDtdElement >> dtdCodeUsingContext: aContext receiver: aReceiver [
	^ (('<!ELEMENT ' pltPlus: (aReceiver owner tagUsingContext: aContext)) pltPlus: ' ')
		pltPlus: (aReceiver elementDomain asCollectionElementDtdCodeTailUsingContext: aContext)


]

{ #category : 'platypus-generated-accessing' }
ExChdCollectionDtdElement >> elementDomain [
	^ elementDomain


]

{ #category : 'platypus-generated-accessing' }
ExChdCollectionDtdElement >> elementDomain: aExChdDomainDtdElement [
	elementDomain := aExChdDomainDtdElement


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdCollectionDtdElement >> elementDomainUsingContext: aContext [
	^ self elementDomain


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdCollectionDtdElement >> fastSetElementDomain: aExChdDomainDtdElement [
	elementDomain := aExChdDomainDtdElement


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCollectionDtdElement >> fromValues: values [
	^ self collectionDtdElementFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdCollectionDtdElement >> isExChdCollectionDtdElement [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCollectionDtdElement >> localFromValues: values [
	^ self collectionDtdElementFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCollectionDtdElement >> localToValues: values [
	^ self collectionDtdElementToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdCollectionDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdCollectionDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self collectionDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdCollectionDtdElement >> pltLocalCopyTo: another [
	self collectionDtdElementCopyTo: another


]

{ #category : 'platypus-generated-set-accessing' }
ExChdCollectionDtdElement >> setElementDomain: aExChdDomainDtdElement [
	self elementDomain: aExChdDomainDtdElement


]

{ #category : 'platypus-generated-initializing' }
ExChdCollectionDtdElement >> stepInitialize [
	super stepInitialize.
	elementDomain := nil


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCollectionDtdElement >> toValues: values [
	^ self collectionDtdElementToValues: (super toValues: values)


]
