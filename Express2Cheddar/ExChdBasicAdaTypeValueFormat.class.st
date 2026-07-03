"
<ISO10303-11-EXPRESS>
ENTITY basic_ada_type_value_format 
	SUBTYPE OF ( dictionary_instance );
	val : expression;
	basic_ada_type : OPTIONAL dictionary_instance;
DERIVE
	formated : STRING := basic_ada_expression_value_string ( SELF.val );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdBasicAdaTypeValueFormat',
	#superclass : 'PltDictionaryInstance',
	#instVars : [
		'basicAdaType',
		'val'
	],
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdBasicAdaTypeValueFormat class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdBasicAdaTypeValueFormat class >> schemaDefinition [

	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdBasicAdaTypeValueFormat class >> schemaInstance [

	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdBasicAdaTypeValueFormat class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdBasicAdaTypeValueFormat class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdBasicAdaTypeValueFormat >> accept: aVisitor [

	^ aVisitor acceptBasicAdaTypeValueFormat: self


]

{ #category : 'platypus-generated-accessing' }
ExChdBasicAdaTypeValueFormat >> basicAdaType [

	^ basicAdaType


]

{ #category : 'platypus-generated-accessing' }
ExChdBasicAdaTypeValueFormat >> basicAdaType: aExChdDictionaryInstance [

	basicAdaType := aExChdDictionaryInstance


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdBasicAdaTypeValueFormat >> basicAdaTypeUsingContext: aContext [

	^ self basicAdaType


]

{ #category : 'platypus-generated-copying' }
ExChdBasicAdaTypeValueFormat >> basicAdaTypeValueFormatCopyTo: another [

	another fastSetVal: self val.
	another fastSetBasicAdaType: self basicAdaType


]

{ #category : 'platypus-generated-group-accessing' }
ExChdBasicAdaTypeValueFormat >> basicAdaTypeValueFormatFromValues: values [

	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setVal: valuesloc removeFirst.
	self setBasicAdaType: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdBasicAdaTypeValueFormat >> basicAdaTypeValueFormatToValues: values [

	values add: self val.
	values add: self basicAdaType.
	^ values


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdBasicAdaTypeValueFormat >> fastSetBasicAdaType: aExChdDictionaryInstance [

	basicAdaType := aExChdDictionaryInstance


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdBasicAdaTypeValueFormat >> fastSetVal: aExChdExpression [

	val := aExChdExpression


]

{ #category : 'platypus-generated-deriving' }
ExChdBasicAdaTypeValueFormat >> formated [

	^ self formatedUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdBasicAdaTypeValueFormat >> formatedUsingContext: aContext [

	^ self formatedUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdBasicAdaTypeValueFormat >> formatedUsingContext: aContext receiver: aReceiver [

	^ ExChdBasicAdaExpressionValueStringFunction invokeFromValues:
		  (OrderedCollection new
			   add: (aReceiver valUsingContext: self class context);
			   yourself)


]

{ #category : 'platypus-generated-group-accessing' }
ExChdBasicAdaTypeValueFormat >> fromValues: values [

	^ self basicAdaTypeValueFormatFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdBasicAdaTypeValueFormat >> isExChdBasicAdaTypeValueFormat [

	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdBasicAdaTypeValueFormat >> localFromValues: values [

	^ self basicAdaTypeValueFormatFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdBasicAdaTypeValueFormat >> localToValues: values [

	^ self basicAdaTypeValueFormatToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdBasicAdaTypeValueFormat >> pltCopyGroup: aClassSymbol to: anObject [

	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdBasicAdaTypeValueFormat >> pltCopyTo: another [

	super pltCopyTo: another.
	self basicAdaTypeValueFormatCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdBasicAdaTypeValueFormat >> pltLocalCopyTo: another [

	self basicAdaTypeValueFormatCopyTo: another


]

{ #category : 'platypus-generated-set-accessing' }
ExChdBasicAdaTypeValueFormat >> setBasicAdaType: aExChdDictionaryInstance [

	self basicAdaType: aExChdDictionaryInstance


]

{ #category : 'platypus-generated-set-accessing' }
ExChdBasicAdaTypeValueFormat >> setVal: aExChdExpression [

	self val: aExChdExpression


]

{ #category : 'platypus-generated-initializing' }
ExChdBasicAdaTypeValueFormat >> stepInitialize [

	super stepInitialize.
	val := nil.
	basicAdaType := nil


]

{ #category : 'platypus-generated-group-accessing' }
ExChdBasicAdaTypeValueFormat >> toValues: values [

	^ self basicAdaTypeValueFormatToValues: (super toValues: values)


]

{ #category : 'platypus-generated-accessing' }
ExChdBasicAdaTypeValueFormat >> val [

	^ val


]

{ #category : 'platypus-generated-accessing' }
ExChdBasicAdaTypeValueFormat >> val: aExChdExpression [

	val := aExChdExpression


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdBasicAdaTypeValueFormat >> valUsingContext: aContext [

	^ self val


]
