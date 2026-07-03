"
<ISO10303-11-EXPRESS>
ENTITY cheddar_function_ptr 
	SUBTYPE OF ( entity_definition );
	arguments : STRING;
	returns : STRING;
DERIVE
	ads_interface_list : LIST OF ada_interface := [ ];
	adb_interface_list : LIST OF ada_interface := [ ];
	ads_code : STRING := 'Type ' + SELF.name + ' is access function (' + SELF.arguments + ') return ' + SELF.returns + ';';
	adb_code : STRING := '';
	dependencies : LIST OF dictionary_instance := [ SELF ];
	refed_by_pointer : BOOLEAN := false;
	ads_pre_def : STRING := '';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdCheddarFunctionPtr',
	#superclass : 'PltEntityDefinition',
	#instVars : [
		'returns',
		'arguments'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarFunctionPtr class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarFunctionPtr class >> schemaDefinition [

	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarFunctionPtr class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarFunctionPtr class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarFunctionPtr class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdCheddarFunctionPtr >> accept: aVisitor [

	^ aVisitor acceptCheddarFunctionPtr: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adbCode [

	^ self adbCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adbCodeUsingContext: aContext [

	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adbCodeUsingContext: aContext receiver: aReceiver [

	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adbInterfaceList [

	^ self adbInterfaceListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adbInterfaceListUsingContext: aContext [

	^ self adbInterfaceListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adbInterfaceListUsingContext: aContext receiver: aReceiver [

	^ Array new


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adsCode [

	^ self adsCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adsCodeUsingContext: aContext [

	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adsCodeUsingContext: aContext receiver: aReceiver [

	^ ((((('Type ' pltPlus: (aReceiver nameUsingContext: aContext))
		      pltPlus: ' is access function (') pltPlus:
		     (aReceiver argumentsUsingContext: aContext)) pltPlus:
		    ') return ') pltPlus: (aReceiver returnsUsingContext: aContext))
		  pltPlus: ';'


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adsInterfaceList [

	^ self adsInterfaceListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adsInterfaceListUsingContext: aContext [

	^ self adsInterfaceListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adsInterfaceListUsingContext: aContext receiver: aReceiver [

	^ Array new


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adsPreDef [

	^ self adsPreDefUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adsPreDefUsingContext: aContext [

	^ self adsPreDefUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> adsPreDefUsingContext: aContext receiver: aReceiver [

	^ ''


]

{ #category : 'platypus-generated-accessing' }
ExChdCheddarFunctionPtr >> arguments [

	^ arguments


]

{ #category : 'platypus-generated-accessing' }
ExChdCheddarFunctionPtr >> arguments: aString [

	arguments := aString


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdCheddarFunctionPtr >> argumentsUsingContext: aContext [

	^ self arguments


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarFunctionPtr >> cheddarFunctionPtrCopyTo: another [

	another fastSetArguments: self arguments.
	another fastSetReturns: self returns


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarFunctionPtr >> cheddarFunctionPtrFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setArguments: valuesloc removeFirst.
	self setReturns: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarFunctionPtr >> cheddarFunctionPtrToValues: values [

	values add: self arguments.
	values add: self returns.
	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> dependencies [

	^ self dependenciesUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> dependenciesUsingContext: aContext [

	^ self dependenciesUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> dependenciesUsingContext: aContext receiver: aReceiver [

	^ PlatypusCoreAggregateInitializer collectionFrom:
		  (OrderedCollection new
			   add: aReceiver;
			   yourself)


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdCheddarFunctionPtr >> fastSetArguments: aString [

	arguments := aString


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdCheddarFunctionPtr >> fastSetReturns: aString [

	returns := aString


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarFunctionPtr >> fromValues: values [

	^ self cheddarFunctionPtrFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdCheddarFunctionPtr >> isExChdCheddarFunctionPtr [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarFunctionPtr >> localFromValues: values [

	^ self cheddarFunctionPtrFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarFunctionPtr >> localToValues: values [

	^ self cheddarFunctionPtrToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarFunctionPtr >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarFunctionPtr >> pltCopyTo: another [

	super pltCopyTo: another.
	self cheddarFunctionPtrCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarFunctionPtr >> pltLocalCopyTo: another [

	self cheddarFunctionPtrCopyTo: another


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> refedByPointer [

	^ self refedByPointerUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> refedByPointerUsingContext: aContext [

	^ self refedByPointerUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarFunctionPtr >> refedByPointerUsingContext: aContext receiver: aReceiver [

	^ false


]

{ #category : 'platypus-generated-accessing' }
ExChdCheddarFunctionPtr >> returns [

	^ returns


]

{ #category : 'platypus-generated-accessing' }
ExChdCheddarFunctionPtr >> returns: aString [

	returns := aString


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdCheddarFunctionPtr >> returnsUsingContext: aContext [

	^ self returns


]

{ #category : 'platypus-generated-set-accessing' }
ExChdCheddarFunctionPtr >> setArguments: aString [

	self arguments: aString


]

{ #category : 'platypus-generated-set-accessing' }
ExChdCheddarFunctionPtr >> setReturns: aString [

	self returns: aString


]

{ #category : 'platypus-generated-initializing' }
ExChdCheddarFunctionPtr >> stepInitialize [

	super stepInitialize.
	arguments := ''.
	returns := ''


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarFunctionPtr >> toValues: values [

	^ self cheddarFunctionPtrToValues: (super toValues: values)


]
