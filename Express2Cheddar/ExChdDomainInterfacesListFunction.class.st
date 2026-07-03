"
<ISO10303-11-EXPRESS>
FUNCTION domain_interfaces_list ( ada_domain : entity_instance; ads : BOOLEAN; pkg : schema_definition ) : LIST OF ada_interface;
	LOCAL 
		result : LIST OF ada_interface := [ ];
	END_LOCAL;

	ALIAS h FOR ada_domain.handled;

		IF ads THEN
			result := result + ada_domain.ads_interfaces_list;
		ELSE
			result := result + ada_domain.adb_interfaces_list;
			IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( h ) ) THEN
				IF ( h.owner.name <> pkg.name ) THEN
					result := result + ada_interface ( h.owner.name, ?, true, false );
					result := result + ada_interface ( h.full_io_type_name, ?, false, true );
				END_IF;
			END_IF;
		END_IF;

		IF ( 'CHEDDAR_DOMAINS.ADA_PRIMITIVE_TYPE' IN TYPEOF ( h ) ) OR ( 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE' IN TYPEOF ( h ) ) THEN
			IF ads THEN
				result := result + h.ads_interfaces_list;
			ELSE
				result := result + h.adb_interfaces_list;
			END_IF;
		END_IF;
	END_ALIAS;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDomainInterfacesListFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'adaDomain',
		'ads',
		'pkg',
		'result'
	],
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDomainInterfacesListFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDomainInterfacesListFunction class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDomainInterfacesListFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDomainInterfacesListFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDomainInterfacesListFunction >> adaDomain [
	^ adaDomain


]

{ #category : 'platypus-generated-accessing' }
ExChdDomainInterfacesListFunction >> adaDomain: aExChdEntityInstance [
	adaDomain := aExChdEntityInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdDomainInterfacesListFunction >> adaDomain: aExChdEntityInstance ads: aBoolean pkg: aExChdSchemaDefinition [
	self adaDomain: aExChdEntityInstance.
	self ads: aBoolean.
	self pkg: aExChdSchemaDefinition


]

{ #category : 'platypus-generated-accessing' }
ExChdDomainInterfacesListFunction >> ads [
	^ ads


]

{ #category : 'platypus-generated-accessing' }
ExChdDomainInterfacesListFunction >> ads: aBoolean [
	ads := aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdDomainInterfacesListFunction >> fromValues: values [
	self adaDomain: (values at: 1).
	self ads: (values at: 2).
	self pkg: (values at: 3)


]

{ #category : 'platypus-generated-invoking' }
ExChdDomainInterfacesListFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: Array new.	" ---------- statements ----------"
	PlatypusCoreAliasStatement
		alias: (self adaDomain handledUsingContext: self class context)
		statementsBlock: [ :h2553 | 
			self ads
				ifTrue: [ self result: (self result pltPlus: (self adaDomain adsInterfacesListUsingContext: self class context)) ]
				ifFalse: [ 
					self result: (self result pltPlus: (self adaDomain adbInterfacesListUsingContext: self class context)).
					((PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: h2553;
								yourself)) includes: 'CHEDDAR_DOMAINS.ADA_ENUMERATION')
						ifTrue: [ 
							((h2553 ownerUsingContext: self class context) nameUsingContext: self class context)
								~= (self pkg nameUsingContext: self class context)
								ifTrue: [ 
									self
										result:
											(self result
												pltPlus:
													(ExChdAdaInterface new
														adaInterfaceFromValues:
																(OrderedCollection new
																		add: ((h2553 ownerUsingContext: self class context) nameUsingContext: self class context);
																		add: nil;
																		add: true;
																		add: false;
																		yourself);
														yourself)).
									self
										result:
											(self result
												pltPlus:
													(ExChdAdaInterface new
														adaInterfaceFromValues:
																(OrderedCollection new
																		add: (h2553 fullIoTypeNameUsingContext: self class context);
																		add: nil;
																		add: false;
																		add: true;
																		yourself);
														yourself)) ] ] ].
			(((PltTYPEOFFunction
				invokeFromValues:
					(OrderedCollection new
						add: h2553;
						yourself)) includes: 'CHEDDAR_DOMAINS.ADA_PRIMITIVE_TYPE')
				or: [ 
					(PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: h2553;
								yourself)) includes: 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE' ])
				ifTrue: [ 
					self ads
						ifTrue: [ self result: (self result pltPlus: (h2553 adsInterfacesListUsingContext: self class context)) ]
						ifFalse: [ self result: (self result pltPlus: (h2553 adbInterfacesListUsingContext: self class context)) ] ] ].
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdDomainInterfacesListFunction >> pkg [
	^ pkg


]

{ #category : 'platypus-generated-accessing' }
ExChdDomainInterfacesListFunction >> pkg: aExChdSchemaDefinition [
	pkg := aExChdSchemaDefinition


]

{ #category : 'platypus-generated-accessing' }
ExChdDomainInterfacesListFunction >> result [
	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdDomainInterfacesListFunction >> result: aListOfExChdAdaInterface [
	result := aListOfExChdAdaInterface
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface as: OrderedCollection ]


]
