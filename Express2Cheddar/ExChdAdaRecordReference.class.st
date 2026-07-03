"
<ISO10303-11-EXPRESS>
ENTITY ada_record_reference 
	SUBTYPE OF ( ada_named_type_reference );
DERIVE
	SELF\entity_definition_reference.accepted : entity_instance := SELF.accept_ada_record_reference;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaRecordReference',
	#superclass : 'ExChdAdaNamedTypeReference',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaRecordReference class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaRecordReference class >> schemaDefinition [

	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaRecordReference class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaRecordReference class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaRecordReference class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaRecordReference >> accept: aVisitor [

	^ aVisitor acceptAdaRecordReference: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaRecordReference >> accepted [

	^ self acceptedUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaRecordReference >> acceptedUsingContext: aContext [

	^ self acceptedUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaRecordReference >> acceptedUsingContext: aContext receiver: aReceiver [

	^ aReceiver acceptAdaRecordReferenceUsingContext: aContext


]

{ #category : 'platypus-generated-copying' }
ExChdAdaRecordReference >> adaRecordReferenceCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaRecordReference >> adaRecordReferenceFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaRecordReference >> adaRecordReferenceToValues: values [

	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaRecordReference >> fromValues: values [

	^ self adaRecordReferenceFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaRecordReference >> isExChdAdaRecordReference [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaRecordReference >> localFromValues: values [

	^ self adaRecordReferenceFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaRecordReference >> localToValues: values [

	^ self adaRecordReferenceToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaRecordReference >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaRecordReference >> pltCopyTo: another [

	super pltCopyTo: another.
	self adaRecordReferenceCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaRecordReference >> pltLocalCopyTo: another [

	self adaRecordReferenceCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaRecordReference >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaRecordReference >> toValues: values [

	^ self adaRecordReferenceToValues: (super toValues: values)


]
