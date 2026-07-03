"
<ISO10303-11-EXPRESS>
ENTITY ada_class_ref_dtd_element 
	SUBTYPE OF ( entity_ref_dtd_element );
DERIVE
	SELF\entity_ref_dtd_element.infered_element : entity_dtd_element := dtd_element ( ?, ? ) || composite_dtd_element ( ) || entity_dtd_element ( domain ) || ada_class_dtd_element ( );
	SELF\entity_ref_dtd_element.dtd_code : STRING := '<!ELEMENT ' + owner.tag + ' EMPTY>\n' 
	+ '<!ATTLIST ' + owner.tag + ' ref IDREF #REQUIRED>\n';
	SELF\entity_ref_dtd_element.as_collection_element_dtd_code_tail : STRING := ' EMPTY>\n' 
	+ '<!ATTLIST ' + owner.owner.tag + ' refs IDREFS #REQUIRED>\n';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaClassRefDtdElement',
	#superclass : 'ExChdEntityRefDtdElement',
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassRefDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaClassRefDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaClassRefDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassRefDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassRefDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaClassRefDtdElement >> accept: aVisitor [
	^ aVisitor acceptAdaClassRefDtdElement: self


]

{ #category : 'platypus-generated-copying' }
ExChdAdaClassRefDtdElement >> adaClassRefDtdElementCopyTo: another [
	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClassRefDtdElement >> adaClassRefDtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClassRefDtdElement >> adaClassRefDtdElementToValues: values [
	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClassRefDtdElement >> asCollectionElementDtdCodeTail [
	^ self asCollectionElementDtdCodeTailUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClassRefDtdElement >> asCollectionElementDtdCodeTailUsingContext: aContext [
	^ self asCollectionElementDtdCodeTailUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClassRefDtdElement >> asCollectionElementDtdCodeTailUsingContext: aContext receiver: aReceiver [
	^ ((' EMPTY>\n' pltPlus: '<!ATTLIST ')
		pltPlus: ((aReceiver owner ownerUsingContext: aContext) tagUsingContext: aContext))
		pltPlus: ' refs IDREFS #REQUIRED>\n'


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClassRefDtdElement >> dtdCode [
	^ self dtdCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClassRefDtdElement >> dtdCodeUsingContext: aContext [
	^ self dtdCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClassRefDtdElement >> dtdCodeUsingContext: aContext receiver: aReceiver [
	^ (((('<!ELEMENT ' pltPlus: (aReceiver owner tagUsingContext: aContext)) pltPlus: ' EMPTY>\n') pltPlus: '<!ATTLIST ')
		pltPlus: (aReceiver owner tagUsingContext: aContext)) pltPlus: ' ref IDREF #REQUIRED>\n'


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClassRefDtdElement >> fromValues: values [
	^ self adaClassRefDtdElementFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClassRefDtdElement >> inferedElement [
	^ self inferedElementUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClassRefDtdElement >> inferedElementUsingContext: aContext [
	^ self inferedElementUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaClassRefDtdElement >> inferedElementUsingContext: aContext receiver: aReceiver [
	^ (PlatypusComplexInstance
		fromRecords:
			(OrderedCollection new
				add:
						(PlatypusComplexInstance
								fromRecords:
									(OrderedCollection new
										add:
												(PlatypusComplexInstance
														fromRecords:
															(OrderedCollection new
																add:
																		(ExChdDtdElement new
																				dtdElementFromValues:
																						(OrderedCollection new
																								add: nil;
																								add: nil;
																								yourself);
																				yourself);
																add: ExChdCompositeDtdElement new;
																yourself)) pltAsObject;
										add:
												(ExChdEntityDtdElement new
														entityDtdElementFromValues:
																(OrderedCollection new
																		add: aReceiver domain;
																		yourself);
														yourself);
										yourself)) pltAsObject;
				add: ExChdAdaClassDtdElement new;
				yourself)) pltAsObject


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaClassRefDtdElement >> isExChdAdaClassRefDtdElement [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClassRefDtdElement >> localFromValues: values [
	^ self adaClassRefDtdElementFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClassRefDtdElement >> localToValues: values [
	^ self adaClassRefDtdElementToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaClassRefDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaClassRefDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaClassRefDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaClassRefDtdElement >> pltLocalCopyTo: another [
	self adaClassRefDtdElementCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaClassRefDtdElement >> stepInitialize [
	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaClassRefDtdElement >> toValues: values [
	^ self adaClassRefDtdElementToValues: (super toValues: values)


]
