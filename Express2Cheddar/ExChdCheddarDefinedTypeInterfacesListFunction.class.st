"
<ISO10303-11-EXPRESS>
FUNCTION cheddar_defined_type_interfaces_list ( r : cheddar_defined_type; ads : BOOLEAN ) : LIST OF ada_interface;
	LOCAL 
		result : LIST OF ada_interface := [ ];
	END_LOCAL;

	IF ads THEN
		result := result + ada_interface ( r.owner.name, ?, true, true );
	END_IF;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdCheddarDefinedTypeInterfacesListFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'r',
		'ads',
		'result'
	],
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarDefinedTypeInterfacesListFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarDefinedTypeInterfacesListFunction class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarDefinedTypeInterfacesListFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarDefinedTypeInterfacesListFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdCheddarDefinedTypeInterfacesListFunction >> ads [
	^ ads


]

{ #category : 'platypus-generated-accessing' }
ExChdCheddarDefinedTypeInterfacesListFunction >> ads: aBoolean [
	ads := aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdCheddarDefinedTypeInterfacesListFunction >> fromValues: values [
	self r: (values at: 1).
	self ads: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
ExChdCheddarDefinedTypeInterfacesListFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: Array new.	" ---------- statements ----------"
	self ads
		ifTrue: [ 
			self
				result:
					(self result
						pltPlus:
							(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: ((self r ownerUsingContext: self class context) nameUsingContext: self class context);
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself)) ].
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdCheddarDefinedTypeInterfacesListFunction >> r [
	^ r


]

{ #category : 'platypus-generated-accessing' }
ExChdCheddarDefinedTypeInterfacesListFunction >> r: aExChdCheddarDefinedType [
	r := aExChdCheddarDefinedType


]

{ #category : 'platypus-generated-accessing' }
ExChdCheddarDefinedTypeInterfacesListFunction >> r: aExChdCheddarDefinedType ads: aBoolean [
	self r: aExChdCheddarDefinedType.
	self ads: aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdCheddarDefinedTypeInterfacesListFunction >> result [
	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdCheddarDefinedTypeInterfacesListFunction >> result: aListOfExChdAdaInterface [
	result := aListOfExChdAdaInterface
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface as: OrderedCollection ]


]
