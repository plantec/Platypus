"
<ISO10303-11-EXPRESS>
ENTITY in_scope_attribute;
DERIVE
	init_code : STRING := in_scope_attribute_init_code ( SELF );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdInScopeAttribute',
	#superclass : 'ExChdCoreEntity',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdInScopeAttribute class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdInScopeAttribute class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdInScopeAttribute class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdInScopeAttribute class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdInScopeAttribute class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdInScopeAttribute >> accept: aVisitor [
	^ aVisitor acceptInScopeAttribute: self


]

{ #category : 'platypus-generated-group-accessing' }
ExChdInScopeAttribute >> fromValues: values [
	^ self inScopeAttributeFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-copying' }
ExChdInScopeAttribute >> inScopeAttributeCopyTo: another [
	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdInScopeAttribute >> inScopeAttributeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdInScopeAttribute >> inScopeAttributeToValues: values [
	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdInScopeAttribute >> initCode [
	^ self initCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdInScopeAttribute >> initCodeUsingContext: aContext [
	^ self initCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdInScopeAttribute >> initCodeUsingContext: aContext receiver: aReceiver [
	^ ExChdInScopeAttributeInitCodeFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : 'platypus-generated-classifying' }
ExChdInScopeAttribute >> isExChdInScopeAttribute [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdInScopeAttribute >> localFromValues: values [
	^ self inScopeAttributeFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdInScopeAttribute >> localToValues: values [
	^ self inScopeAttributeToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdInScopeAttribute >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdInScopeAttribute >> pltCopyTo: another [
	super pltCopyTo: another.
	self inScopeAttributeCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdInScopeAttribute >> pltLocalCopyTo: another [
	self inScopeAttributeCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdInScopeAttribute >> stepInitialize [
	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdInScopeAttribute >> toValues: values [
	^ self inScopeAttributeToValues: (super toValues: values)


]
