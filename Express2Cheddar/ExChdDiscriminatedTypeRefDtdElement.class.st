"
<ISO10303-11-EXPRESS>
ENTITY discriminated_type_ref_dtd_element 
	SUBTYPE OF ( entity_ref_dtd_element );
DERIVE
	SELF\entity_ref_dtd_element.infered_element : entity_dtd_element := dtd_element ( ?, ? ) || composite_dtd_element ( ) || entity_dtd_element ( domain ) || discriminated_type_dtd_element ( );
	SELF\domain_dtd_element.as_collection_element_dtd_code_tail : STRING := '(' + lowerize ( domain.handled.name ) + ')*>\n';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdDiscriminatedTypeRefDtdElement,
	#superclass : #ExChdEntityRefDtdElement,
	#category : #'Express2Cheddar-CheddarDtdSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeRefDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeRefDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeRefDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeRefDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeRefDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdDiscriminatedTypeRefDtdElement >> accept: aVisitor [
	^ aVisitor acceptDiscriminatedTypeRefDtdElement: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeRefDtdElement >> asCollectionElementDtdCodeTail [
	^ self asCollectionElementDtdCodeTailUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeRefDtdElement >> asCollectionElementDtdCodeTailUsingContext: aContext [
	^ self asCollectionElementDtdCodeTailUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeRefDtdElement >> asCollectionElementDtdCodeTailUsingContext: aContext receiver: aReceiver [
	^ ('('
		pltPlus:
			(PTsLowerizeFunction
				invokeFromValues:
					(OrderedCollection new
						add: ((aReceiver domain handledUsingContext: self class context) nameUsingContext: self class context);
						yourself))) pltPlus: ')*>\n'


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeRefDtdElement >> discriminatedTypeRefDtdElementCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeRefDtdElement >> discriminatedTypeRefDtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeRefDtdElement >> discriminatedTypeRefDtdElementToValues: values [
	^ values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeRefDtdElement >> fromValues: values [
	^ self discriminatedTypeRefDtdElementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeRefDtdElement >> inferedElement [
	^ self inferedElementUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeRefDtdElement >> inferedElementUsingContext: aContext [
	^ self inferedElementUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdDiscriminatedTypeRefDtdElement >> inferedElementUsingContext: aContext receiver: aReceiver [
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
				add: ExChdDiscriminatedTypeDtdElement new;
				yourself)) pltAsObject


]

{ #category : #'platypus-generated-classifying' }
ExChdDiscriminatedTypeRefDtdElement >> isExChdDiscriminatedTypeRefDtdElement [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeRefDtdElement >> localFromValues: values [
	^ self discriminatedTypeRefDtdElementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeRefDtdElement >> localToValues: values [
	^ self discriminatedTypeRefDtdElementToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeRefDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeRefDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self discriminatedTypeRefDtdElementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeRefDtdElement >> pltLocalCopyTo: another [
	self discriminatedTypeRefDtdElementCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
ExChdDiscriminatedTypeRefDtdElement >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeRefDtdElement >> toValues: values [
	^ self discriminatedTypeRefDtdElementToValues: (super toValues: values)


]
