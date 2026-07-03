"
<ISO10303-11-EXPRESS>
ENTITY ada_interface;
	prefix : STRING;
	suffix : OPTIONAL STRING;
	with_it : BOOLEAN;
	use_it : BOOLEAN;
DERIVE
	full_name : STRING := ada_interface_path ( SELF );
	declaration : STRING := ada_interface_declaration ( SELF );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaInterface',
	#superclass : 'ExChdCoreEntity',
	#instVars : [
		'useIt',
		'withIt',
		'prefix',
		'suffix'
	],
	#category : 'Express2Cheddar-AdaInterfaceSchema',
	#package : 'Express2Cheddar',
	#tag : 'AdaInterfaceSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaInterface class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaInterface class >> schemaDefinition [

	^ ExChdAdaInterfaceSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaInterface class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaInterface class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaInterface class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaInterface >> accept: aVisitor [

	^ aVisitor acceptAdaInterface: self


]

{ #category : 'platypus-generated-copying' }
ExChdAdaInterface >> adaInterfaceCopyTo: another [

	another fastSetPrefix: self prefix.
	another fastSetSuffix: self suffix.
	another fastSetWithIt: self withIt.
	another fastSetUseIt: self useIt


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaInterface >> adaInterfaceFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setPrefix: valuesloc removeFirst.
	self setSuffix: valuesloc removeFirst.
	self setWithIt: valuesloc removeFirst.
	self setUseIt: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaInterface >> adaInterfaceToValues: values [

	values add: self prefix.
	values add: self suffix.
	values add: self withIt.
	values add: self useIt.
	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaInterface >> declaration [

	^ self declarationUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaInterface >> declarationUsingContext: aContext [

	^ self declarationUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaInterface >> declarationUsingContext: aContext receiver: aReceiver [

	^ ExChdAdaInterfaceDeclarationFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdAdaInterface >> fastSetPrefix: aString [

	prefix := aString


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdAdaInterface >> fastSetSuffix: aString [

	suffix := aString


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdAdaInterface >> fastSetUseIt: aBoolean [

	useIt := aBoolean


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdAdaInterface >> fastSetWithIt: aBoolean [

	withIt := aBoolean


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaInterface >> fromValues: values [

	^ self adaInterfaceFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaInterface >> fullName [

	^ self fullNameUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaInterface >> fullNameUsingContext: aContext [

	^ self fullNameUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaInterface >> fullNameUsingContext: aContext receiver: aReceiver [

	^ ExChdAdaInterfacePathFunction invokeFromValues:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaInterface >> isExChdAdaInterface [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaInterface >> localFromValues: values [

	^ self adaInterfaceFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaInterface >> localToValues: values [

	^ self adaInterfaceToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaInterface >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaInterface >> pltCopyTo: another [

	super pltCopyTo: another.
	self adaInterfaceCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaInterface >> pltLocalCopyTo: another [

	self adaInterfaceCopyTo: another


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterface >> prefix [

	^ prefix


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterface >> prefix: aString [

	prefix := aString


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdAdaInterface >> prefixUsingContext: aContext [

	^ self prefix


]

{ #category : 'platypus-generated-set-accessing' }
ExChdAdaInterface >> setPrefix: aString [

	self prefix: aString


]

{ #category : 'platypus-generated-set-accessing' }
ExChdAdaInterface >> setSuffix: aString [

	self suffix: aString


]

{ #category : 'platypus-generated-set-accessing' }
ExChdAdaInterface >> setUseIt: aBoolean [

	self useIt: aBoolean


]

{ #category : 'platypus-generated-set-accessing' }
ExChdAdaInterface >> setWithIt: aBoolean [

	self withIt: aBoolean


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaInterface >> stepInitialize [

	super stepInitialize.
	prefix := ''.
	suffix := nil.
	withIt := false.
	useIt := false


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterface >> suffix [

	^ suffix


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterface >> suffix: aString [

	suffix := aString


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdAdaInterface >> suffixUsingContext: aContext [

	^ self suffix


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaInterface >> toValues: values [

	^ self adaInterfaceToValues: (super toValues: values)


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterface >> useIt [

	^ useIt


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterface >> useIt: aBoolean [

	useIt := aBoolean


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdAdaInterface >> useItUsingContext: aContext [

	^ self useIt


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterface >> withIt [

	^ withIt


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterface >> withIt: aBoolean [

	withIt := aBoolean


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdAdaInterface >> withItUsingContext: aContext [

	^ self withIt


]
