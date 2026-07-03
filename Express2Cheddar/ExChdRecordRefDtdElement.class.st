"
<ISO10303-11-EXPRESS>
ENTITY record_ref_dtd_element 
	SUBTYPE OF ( entity_ref_dtd_element );
DERIVE
	SELF\entity_ref_dtd_element.infered_element : entity_dtd_element := dtd_element ( ?, ? ) || composite_dtd_element ( ) || entity_dtd_element ( domain ) || record_dtd_element ( );
	SELF\domain_dtd_element.as_collection_element_dtd_code_tail : STRING := '(' + lowerize ( domain.handled.name ) + ')*>\n';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdRecordRefDtdElement',
	#superclass : 'ExChdEntityRefDtdElement',
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordRefDtdElement class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRecordRefDtdElement class >> schemaDefinition [

	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRecordRefDtdElement class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordRefDtdElement class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordRefDtdElement class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdRecordRefDtdElement >> accept: aVisitor [

	^ aVisitor acceptRecordRefDtdElement: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRecordRefDtdElement >> asCollectionElementDtdCodeTail [

	^ self asCollectionElementDtdCodeTailUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRecordRefDtdElement >> asCollectionElementDtdCodeTailUsingContext: aContext [

	^ self
		  asCollectionElementDtdCodeTailUsingContext: aContext
		  receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRecordRefDtdElement >> asCollectionElementDtdCodeTailUsingContext: aContext receiver: aReceiver [

	^ ('(' pltPlus:
		   (PTsLowerizeFunction invokeFromValues: (OrderedCollection new
				     add:
					     ((aReceiver domain handledUsingContext: self class context)
						      nameUsingContext: self class context);
				     yourself))) pltPlus: ')*>\n'


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRecordRefDtdElement >> fromValues: values [

	^ self recordRefDtdElementFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdRecordRefDtdElement >> inferedElement [

	^ self inferedElementUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRecordRefDtdElement >> inferedElementUsingContext: aContext [

	^ self inferedElementUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRecordRefDtdElement >> inferedElementUsingContext: aContext receiver: aReceiver [

	^ (PlatypusComplexInstance fromRecords: (OrderedCollection new
			    add:
				    (PlatypusComplexInstance fromRecords: (OrderedCollection new
							      add:
								      (PlatypusComplexInstance fromRecords:
										       (OrderedCollection new
											        add: (ExChdDtdElement new
													         dtdElementFromValues: (OrderedCollection new
															          add: nil;
															          add: nil;
															          yourself);
													         yourself);
											        add: ExChdCompositeDtdElement new;
											        yourself)) pltAsObject;
							      add: (ExChdEntityDtdElement new
									       entityDtdElementFromValues: (OrderedCollection new
											        add: aReceiver domain;
											        yourself);
									       yourself);
							      yourself)) pltAsObject;
			    add: ExChdRecordDtdElement new;
			    yourself)) pltAsObject


]

{ #category : 'platypus-generated-classifying' }
ExChdRecordRefDtdElement >> isExChdRecordRefDtdElement [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRecordRefDtdElement >> localFromValues: values [

	^ self recordRefDtdElementFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRecordRefDtdElement >> localToValues: values [

	^ self recordRefDtdElementToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdRecordRefDtdElement >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdRecordRefDtdElement >> pltCopyTo: another [

	super pltCopyTo: another.
	self recordRefDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdRecordRefDtdElement >> pltLocalCopyTo: another [

	self recordRefDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdRecordRefDtdElement >> recordRefDtdElementCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRecordRefDtdElement >> recordRefDtdElementFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRecordRefDtdElement >> recordRefDtdElementToValues: values [

	^ values


]

{ #category : 'platypus-generated-initializing' }
ExChdRecordRefDtdElement >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRecordRefDtdElement >> toValues: values [

	^ self recordRefDtdElementToValues: (super toValues: values)


]
