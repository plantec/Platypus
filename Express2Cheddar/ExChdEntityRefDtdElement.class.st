"
<ISO10303-11-EXPRESS>
ENTITY entity_ref_dtd_element 
	SUBTYPE OF ( domain_dtd_element );
DERIVE
	infered_element : entity_dtd_element := ?;
	SELF\dtd_element.dtd_code : STRING := '<!ELEMENT ' + owner.tag + ' (' + lowerize ( domain.name ) + ')>\n';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdEntityRefDtdElement',
	#superclass : 'ExChdDomainDtdElement',
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdEntityRefDtdElement class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdEntityRefDtdElement class >> schemaDefinition [

	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdEntityRefDtdElement class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdEntityRefDtdElement class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdEntityRefDtdElement class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdEntityRefDtdElement >> accept: aVisitor [

	^ aVisitor acceptEntityRefDtdElement: self


]

{ #category : 'platypus-generated-deriving' }
ExChdEntityRefDtdElement >> dtdCode [

	^ self dtdCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdEntityRefDtdElement >> dtdCodeUsingContext: aContext [

	^ self dtdCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdEntityRefDtdElement >> dtdCodeUsingContext: aContext receiver: aReceiver [

	^ ((('<!ELEMENT ' pltPlus:
		     (aReceiver owner tagUsingContext: aContext)) pltPlus: ' (')
		   pltPlus:
			   (PTsLowerizeFunction invokeFromValues: (OrderedCollection new
					     add: (aReceiver domain nameUsingContext: self class context);
					     yourself))) pltPlus: ')>\n'


]

{ #category : 'platypus-generated-copying' }
ExChdEntityRefDtdElement >> entityRefDtdElementCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdEntityRefDtdElement >> entityRefDtdElementFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdEntityRefDtdElement >> entityRefDtdElementToValues: values [

	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdEntityRefDtdElement >> fromValues: values [

	^ self entityRefDtdElementFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdEntityRefDtdElement >> inferedElement [

	^ self inferedElementUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdEntityRefDtdElement >> inferedElementUsingContext: aContext [

	^ self inferedElementUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdEntityRefDtdElement >> inferedElementUsingContext: aContext receiver: aReceiver [

	^ nil


]

{ #category : 'platypus-generated-classifying' }
ExChdEntityRefDtdElement >> isExChdEntityRefDtdElement [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdEntityRefDtdElement >> localFromValues: values [

	^ self entityRefDtdElementFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdEntityRefDtdElement >> localToValues: values [

	^ self entityRefDtdElementToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdEntityRefDtdElement >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdEntityRefDtdElement >> pltCopyTo: another [

	super pltCopyTo: another.
	self entityRefDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdEntityRefDtdElement >> pltLocalCopyTo: another [

	self entityRefDtdElementCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdEntityRefDtdElement >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdEntityRefDtdElement >> toValues: values [

	^ self entityRefDtdElementToValues: (super toValues: values)


]
