"
<ISO10303-11-EXPRESS>
FUNCTION entity_definition_interfaces_list ( r : entity_definition; ads : BOOLEAN ) : LIST OF ada_interface;
	LOCAL 
		result : LIST OF ada_interface := [ ];
		ada_domain : entity_instance;
	END_LOCAL;

	REPEAT no := LOINDEX ( r.explicit_attributes ) TO HIINDEX ( r.explicit_attributes );

		ALIAS curr FOR r.explicit_attributes [ no];
			ada_domain := basic_ada_domain ( curr.domain );
			result := result + domain_interfaces_list ( ada_domain, ads, r.owner );
		END_ALIAS;
	END_REPEAT;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdEntityDefinitionInterfacesListFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'r',
		'ads',
		'result',
		'adaDomain'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdEntityDefinitionInterfacesListFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdEntityDefinitionInterfacesListFunction class >> schemaDefinition [

	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdEntityDefinitionInterfacesListFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdEntityDefinitionInterfacesListFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdEntityDefinitionInterfacesListFunction >> adaDomain [

	^ adaDomain


]

{ #category : 'platypus-generated-accessing' }
ExChdEntityDefinitionInterfacesListFunction >> adaDomain: aExChdEntityInstance [

	adaDomain := aExChdEntityInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdEntityDefinitionInterfacesListFunction >> ads [

	^ ads


]

{ #category : 'platypus-generated-accessing' }
ExChdEntityDefinitionInterfacesListFunction >> ads: aBoolean [

	ads := aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdEntityDefinitionInterfacesListFunction >> fromValues: values [

	self r: (values at: 1).
	self ads: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
ExChdEntityDefinitionInterfacesListFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: Array new. " ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no1660123 |
				PlatypusCoreAliasStatement
					alias:
						((self r explicitAttributesUsingContext: self class context)
							 pltAt: no1660123)
					statementsBlock: [ :curr1183355 |
							self adaDomain:
								(ExChdBasicAdaDomainFunction invokeFromValues:
									 (OrderedCollection new
										  add: (curr1183355 domainUsingContext: self class context);
										  yourself)).
							self result: (self result pltPlus:
									 (ExChdDomainInterfacesListFunction invokeFromValues:
										  (OrderedCollection new
											   add: self adaDomain;
											   add: self ads;
											   add: (self r ownerUsingContext: self class context);
											   yourself))) ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add:
						  (self r explicitAttributesUsingContext: self class context);
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add:
						  (self r explicitAttributesUsingContext: self class context);
					  yourself)).
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdEntityDefinitionInterfacesListFunction >> r [

	^ r


]

{ #category : 'platypus-generated-accessing' }
ExChdEntityDefinitionInterfacesListFunction >> r: aExChdEntityDefinition [

	r := aExChdEntityDefinition


]

{ #category : 'platypus-generated-accessing' }
ExChdEntityDefinitionInterfacesListFunction >> r: aExChdEntityDefinition ads: aBoolean [

	self r: aExChdEntityDefinition.
	self ads: aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdEntityDefinitionInterfacesListFunction >> result [

	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdEntityDefinitionInterfacesListFunction >> result: aListOfExChdAdaInterface [

	result := aListOfExChdAdaInterface
		          ifNil: [ OrderedCollection new ]
		          ifNotNil: [
		          aListOfExChdAdaInterface as: OrderedCollection ]


]
