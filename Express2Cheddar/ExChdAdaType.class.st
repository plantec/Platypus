"
<ISO10303-11-EXPRESS>
ENTITY ada_type 
	SUBTYPE OF ( defined_type );
DERIVE
	ada_ident : STRING := name;
	ada_ref_ident : STRING := name;
	init_value : STRING := ?;
	dependencies : LIST OF dictionary_instance := dependencies_of ( SELF.owner, SELF.domain.handled );
	refed_by_pointer : BOOLEAN := false;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaType',
	#superclass : 'PltDefinedType',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaType class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaType class >> schemaDefinition [

	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaType class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaType class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaType class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaType >> accept: aVisitor [

	^ aVisitor acceptAdaType: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> adaIdent [

	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> adaIdentUsingContext: aContext [

	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> adaIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver name


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> adaRefIdent [

	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> adaRefIdentUsingContext: aContext [

	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> adaRefIdentUsingContext: aContext receiver: aReceiver [

	^ aReceiver name


]

{ #category : 'platypus-generated-copying' }
ExChdAdaType >> adaTypeCopyTo: another [

	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaType >> adaTypeFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaType >> adaTypeToValues: values [

	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> dependencies [

	^ self dependenciesUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> dependenciesUsingContext: aContext [

	^ self dependenciesUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> dependenciesUsingContext: aContext receiver: aReceiver [

	^ ExChdDependenciesOfFunction invokeFromValues:
		  (OrderedCollection new
			   add: (aReceiver ownerUsingContext: self class context);
			   add: ((aReceiver domainUsingContext: self class context)
					    handledUsingContext: self class context);
			   yourself)


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaType >> fromValues: values [

	^ self adaTypeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> initValue [

	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> initValueUsingContext: aContext [

	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> initValueUsingContext: aContext receiver: aReceiver [

	^ nil


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaType >> isExChdAdaType [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaType >> localFromValues: values [

	^ self adaTypeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaType >> localToValues: values [

	^ self adaTypeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaType >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaType >> pltCopyTo: another [

	super pltCopyTo: another.
	self adaTypeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaType >> pltLocalCopyTo: another [

	self adaTypeCopyTo: another


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> refedByPointer [

	^ self refedByPointerUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> refedByPointerUsingContext: aContext [

	^ self refedByPointerUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaType >> refedByPointerUsingContext: aContext receiver: aReceiver [

	^ false


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaType >> stepInitialize [

	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaType >> toValues: values [

	^ self adaTypeToValues: (super toValues: values)


]
