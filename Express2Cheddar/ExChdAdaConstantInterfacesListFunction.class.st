"
<ISO10303-11-EXPRESS>
FUNCTION ada_constant_interfaces_list ( r : ada_constant; ads : BOOLEAN ) : LIST OF ada_interface;
	LOCAL 
		result : LIST OF ada_interface := [ ];
		ada_domain : entity_instance;
	END_LOCAL;
	ada_domain := basic_ada_domain ( r.domain );
	result := domain_interfaces_list ( ada_domain, ads, r.owner );
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaConstantInterfacesListFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'r',
		'ads',
		'result',
		'adaDomain'
	],
	#category : 'Express2Cheddar-CheddarConstantsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarConstantsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaConstantInterfacesListFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaConstantInterfacesListFunction class >> schemaDefinition [
	^ ExChdCheddarConstantsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaConstantInterfacesListFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaConstantInterfacesListFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantInterfacesListFunction >> adaDomain [
	^ adaDomain


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantInterfacesListFunction >> adaDomain: aExChdEntityInstance [
	adaDomain := aExChdEntityInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantInterfacesListFunction >> ads [
	^ ads


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantInterfacesListFunction >> ads: aBoolean [
	ads := aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantInterfacesListFunction >> fromValues: values [
	self r: (values at: 1).
	self ads: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaConstantInterfacesListFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: Array new.	" ---------- statements ----------"
	self
		adaDomain:
			(ExChdBasicAdaDomainFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self r domainUsingContext: self class context);
						yourself)).
	self
		result:
			(ExChdDomainInterfacesListFunction
				invokeFromValues:
					(OrderedCollection new
						add: self adaDomain;
						add: self ads;
						add: (self r ownerUsingContext: self class context);
						yourself)).
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantInterfacesListFunction >> r [
	^ r


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantInterfacesListFunction >> r: aExChdAdaConstant [
	r := aExChdAdaConstant


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantInterfacesListFunction >> r: aExChdAdaConstant ads: aBoolean [
	self r: aExChdAdaConstant.
	self ads: aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantInterfacesListFunction >> result [
	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaConstantInterfacesListFunction >> result: aListOfExChdAdaInterface [
	result := aListOfExChdAdaInterface
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface as: OrderedCollection ]


]
