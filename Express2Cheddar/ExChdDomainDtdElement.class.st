"
<ISO10303-11-EXPRESS>
ENTITY domain_dtd_element 
	SUBTYPE OF ( dtd_element );
	domain : entity_instance;
DERIVE
	as_collection_element_dtd_code_tail : STRING := '';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdDomainDtdElement,
	#superclass : #ExChdDtdElement,
	#instVars : [
		'domain'
	],
	#category : #'Express2Cheddar-CheddarDtdSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdDomainDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDomainDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDomainDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDomainDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDomainDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdDomainDtdElement >> accept: aVisitor [
	^ aVisitor acceptDomainDtdElement: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDomainDtdElement >> asCollectionElementDtdCodeTail [
	^ self asCollectionElementDtdCodeTailUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDomainDtdElement >> asCollectionElementDtdCodeTailUsingContext: aContext [
	^ self asCollectionElementDtdCodeTailUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDomainDtdElement >> asCollectionElementDtdCodeTailUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-accessing' }
ExChdDomainDtdElement >> domain [
	^ domain


]

{ #category : #'platypus-generated-accessing' }
ExChdDomainDtdElement >> domain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : #'platypus-generated-copying' }
ExChdDomainDtdElement >> domainDtdElementCopyTo: another [
	another fastSetDomain: self domain


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDomainDtdElement >> domainDtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setDomain: valuesloc removeFirst.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDomainDtdElement >> domainDtdElementToValues: values [
	values add: self domain.
	^ values


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdDomainDtdElement >> domainUsingContext: aContext [
	^ self domain


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdDomainDtdElement >> fastSetDomain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDomainDtdElement >> fromValues: values [
	^ self domainDtdElementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdDomainDtdElement >> isExChdDomainDtdElement [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDomainDtdElement >> localFromValues: values [
	^ self domainDtdElementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDomainDtdElement >> localToValues: values [
	^ self domainDtdElementToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdDomainDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdDomainDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self domainDtdElementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdDomainDtdElement >> pltLocalCopyTo: another [
	self domainDtdElementCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
ExChdDomainDtdElement >> setDomain: aExChdEntityInstance [
	self domain: aExChdEntityInstance


]

{ #category : #'platypus-generated-initializing' }
ExChdDomainDtdElement >> stepInitialize [
	super stepInitialize.
	domain := nil


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDomainDtdElement >> toValues: values [
	^ self domainDtdElementToValues: (super toValues: values)


]
