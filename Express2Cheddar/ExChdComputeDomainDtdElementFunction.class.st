"
<ISO10303-11-EXPRESS>
FUNCTION compute_domain_dtd_element ( owner : dtd_element; domain : entity_instance ) : domain_dtd_element;
	LOCAL 
		sub_domain : entity_instance;
		element_domain : entity_instance;
		result : domain_dtd_element;
	END_LOCAL;

	IF ( 'PLATYPUS_DICTIONARY_SCHEMA.DICTIONARY_INSTANCE_REFERENCE' IN TYPEOF ( domain ) ) THEN
		RETURN ( compute_domain_dtd_element ( owner, domain.ref ) );
	ELSE

		IF ( 'CHEDDAR_DOMAINS.ADA_PRIMITIVE_TYPE' IN TYPEOF ( domain ) ) THEN
			RETURN ( simple_domain_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
		ELSE
			IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( domain ) ) THEN
				RETURN ( simple_domain_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
			ELSE
				IF ( 'CHEDDAR_DOMAINS.CHEDDAR_PRIORITY_RANGE' IN TYPEOF ( domain ) ) THEN
					RETURN ( simple_domain_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
				ELSE
					IF ( 'RECORD_AND_CLASS.RECORD' IN TYPEOF ( domain ) ) THEN
						RETURN ( record_ref_dtd_element ( ) || entity_ref_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
					ELSE
						IF ( 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE' IN TYPEOF ( domain ) ) THEN
							RETURN ( discriminated_type_ref_dtd_element ( ) || entity_ref_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
						ELSE
							IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( domain ) ) THEN
								RETURN ( ada_class_ref_dtd_element ( ) || entity_ref_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
							ELSE
								IF ( 'PLATYPUS_DICTIONARY_SCHEMA.DEFINED_TYPE' IN TYPEOF ( domain ) ) THEN
									sub_domain := basic_ada_domain ( domain.domain );
									IF ( 'PLATYPUS_DICTIONARY_SCHEMA.AGGREGATION_TYPE' IN TYPEOF ( sub_domain ) ) THEN
										element_domain := basic_ada_domain ( sub_domain.element_type );
										result := collection_dtd_element ( ? ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain );
										result.element_domain := compute_domain_dtd_element ( result, element_domain );
										RETURN ( result );
									END_IF;
								END_IF;
							END_IF;
						END_IF;
					END_IF;
				END_IF;
			END_IF;
		END_IF;
	END_IF;
	println ( domain );
	RETURN ( unknown_domain_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdComputeDomainDtdElementFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'owner',
		'domain',
		'subDomain',
		'elementDomain',
		'result'
	],
	#category : #'Express2Cheddar-CheddarDtdSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeDomainDtdElementFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdComputeDomainDtdElementFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeDomainDtdElementFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeDomainDtdElementFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeDomainDtdElementFunction >> domain [
	^ domain


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeDomainDtdElementFunction >> domain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeDomainDtdElementFunction >> elementDomain [
	^ elementDomain


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeDomainDtdElementFunction >> elementDomain: aExChdEntityInstance1 [
	elementDomain := aExChdEntityInstance1


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeDomainDtdElementFunction >> fromValues: values [
	self owner: (values at: 1).
	self domain: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
ExChdComputeDomainDtdElementFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self domain;
				yourself)) includes: 'PLATYPUS_DICTIONARY_SCHEMA.DICTIONARY_INSTANCE_REFERENCE')
		ifTrue: [ 
			^ self
				return:
					(ExChdComputeDomainDtdElementFunction
						invokeFromValues:
							(OrderedCollection new
								add: self owner;
								add: (self domain refUsingContext: self class context);
								yourself)) ]
		ifFalse: [ 
			((PltTYPEOFFunction
				invokeFromValues:
					(OrderedCollection new
						add: self domain;
						yourself)) includes: 'CHEDDAR_DOMAINS.ADA_PRIMITIVE_TYPE')
				ifTrue: [ 
					^ self
						return:
							(PlatypusComplexInstance
								fromRecords:
									(OrderedCollection new
										add:
												(PlatypusComplexInstance
														fromRecords:
															(OrderedCollection new
																add: ExChdSimpleDomainDtdElement new;
																add:
																		(ExChdDtdElement new
																				dtdElementFromValues:
																						(OrderedCollection new
																								add: self owner;
																								add: nil;
																								yourself);
																				yourself);
																yourself)) pltAsObject;
										add:
												(ExChdDomainDtdElement new
														domainDtdElementFromValues:
																(OrderedCollection new
																		add: self domain;
																		yourself);
														yourself);
										yourself)) pltAsObject ]
				ifFalse: [ 
					((PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: self domain;
								yourself)) includes: 'CHEDDAR_DOMAINS.ADA_ENUMERATION')
						ifTrue: [ 
							^ self
								return:
									(PlatypusComplexInstance
										fromRecords:
											(OrderedCollection new
												add:
														(PlatypusComplexInstance
																fromRecords:
																	(OrderedCollection new
																		add: ExChdSimpleDomainDtdElement new;
																		add:
																				(ExChdDtdElement new
																						dtdElementFromValues:
																								(OrderedCollection new
																										add: self owner;
																										add: nil;
																										yourself);
																						yourself);
																		yourself)) pltAsObject;
												add:
														(ExChdDomainDtdElement new
																domainDtdElementFromValues:
																		(OrderedCollection new
																				add: self domain;
																				yourself);
																yourself);
												yourself)) pltAsObject ]
						ifFalse: [ 
							((PltTYPEOFFunction
								invokeFromValues:
									(OrderedCollection new
										add: self domain;
										yourself)) includes: 'CHEDDAR_DOMAINS.CHEDDAR_PRIORITY_RANGE')
								ifTrue: [ 
									^ self
										return:
											(PlatypusComplexInstance
												fromRecords:
													(OrderedCollection new
														add:
																(PlatypusComplexInstance
																		fromRecords:
																			(OrderedCollection new
																				add: ExChdSimpleDomainDtdElement new;
																				add:
																						(ExChdDtdElement new
																								dtdElementFromValues:
																										(OrderedCollection new
																												add: self owner;
																												add: nil;
																												yourself);
																								yourself);
																				yourself)) pltAsObject;
														add:
																(ExChdDomainDtdElement new
																		domainDtdElementFromValues:
																				(OrderedCollection new
																						add: self domain;
																						yourself);
																		yourself);
														yourself)) pltAsObject ]
								ifFalse: [ 
									((PltTYPEOFFunction
										invokeFromValues:
											(OrderedCollection new
												add: self domain;
												yourself)) includes: 'RECORD_AND_CLASS.RECORD')
										ifTrue: [ 
											^ self
												return:
													(PlatypusComplexInstance
														fromRecords:
															(OrderedCollection new
																add:
																		(PlatypusComplexInstance
																				fromRecords:
																					(OrderedCollection new
																						add:
																								(PlatypusComplexInstance
																										fromRecords:
																											(OrderedCollection new
																												add: ExChdRecordRefDtdElement new;
																												add: ExChdEntityRefDtdElement new;
																												yourself)) pltAsObject;
																						add:
																								(ExChdDtdElement new
																										dtdElementFromValues:
																												(OrderedCollection new
																														add: self owner;
																														add: nil;
																														yourself);
																										yourself);
																						yourself)) pltAsObject;
																add:
																		(ExChdDomainDtdElement new
																				domainDtdElementFromValues:
																						(OrderedCollection new
																								add: self domain;
																								yourself);
																				yourself);
																yourself)) pltAsObject ]
										ifFalse: [ 
											((PltTYPEOFFunction
												invokeFromValues:
													(OrderedCollection new
														add: self domain;
														yourself)) includes: 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE')
												ifTrue: [ 
													^ self
														return:
															(PlatypusComplexInstance
																fromRecords:
																	(OrderedCollection new
																		add:
																				(PlatypusComplexInstance
																						fromRecords:
																							(OrderedCollection new
																								add:
																										(PlatypusComplexInstance
																												fromRecords:
																													(OrderedCollection new
																														add: ExChdDiscriminatedTypeRefDtdElement new;
																														add: ExChdEntityRefDtdElement new;
																														yourself)) pltAsObject;
																								add:
																										(ExChdDtdElement new
																												dtdElementFromValues:
																														(OrderedCollection new
																																add: self owner;
																																add: nil;
																																yourself);
																												yourself);
																								yourself)) pltAsObject;
																		add:
																				(ExChdDomainDtdElement new
																						domainDtdElementFromValues:
																								(OrderedCollection new
																										add: self domain;
																										yourself);
																						yourself);
																		yourself)) pltAsObject ]
												ifFalse: [ 
													((PltTYPEOFFunction
														invokeFromValues:
															(OrderedCollection new
																add: self domain;
																yourself)) includes: 'RECORD_AND_CLASS.ADA_CLASS')
														ifTrue: [ 
															^ self
																return:
																	(PlatypusComplexInstance
																		fromRecords:
																			(OrderedCollection new
																				add:
																						(PlatypusComplexInstance
																								fromRecords:
																									(OrderedCollection new
																										add:
																												(PlatypusComplexInstance
																														fromRecords:
																															(OrderedCollection new
																																add: ExChdAdaClassRefDtdElement new;
																																add: ExChdEntityRefDtdElement new;
																																yourself)) pltAsObject;
																										add:
																												(ExChdDtdElement new
																														dtdElementFromValues:
																																(OrderedCollection new
																																		add: self owner;
																																		add: nil;
																																		yourself);
																														yourself);
																										yourself)) pltAsObject;
																				add:
																						(ExChdDomainDtdElement new
																								domainDtdElementFromValues:
																										(OrderedCollection new
																												add: self domain;
																												yourself);
																								yourself);
																				yourself)) pltAsObject ]
														ifFalse: [ 
															((PltTYPEOFFunction
																invokeFromValues:
																	(OrderedCollection new
																		add: self domain;
																		yourself)) includes: 'PLATYPUS_DICTIONARY_SCHEMA.DEFINED_TYPE')
																ifTrue: [ 
																	self
																		subDomain:
																			(ExChdBasicAdaDomainFunction
																				invokeFromValues:
																					(OrderedCollection new
																						add: (self domain domainUsingContext: self class context);
																						yourself)).
																	((PltTYPEOFFunction
																		invokeFromValues:
																			(OrderedCollection new
																				add: self subDomain;
																				yourself)) includes: 'PLATYPUS_DICTIONARY_SCHEMA.AGGREGATION_TYPE')
																		ifTrue: [ 
																			self
																				elementDomain:
																					(ExChdBasicAdaDomainFunction
																						invokeFromValues:
																							(OrderedCollection new
																								add: (self subDomain elementTypeUsingContext: self class context);
																								yourself)).
																			self
																				result:
																					(PlatypusComplexInstance
																						fromRecords:
																							(OrderedCollection new
																								add:
																										(PlatypusComplexInstance
																												fromRecords:
																													(OrderedCollection new
																														add:
																																(ExChdCollectionDtdElement new
																																		collectionDtdElementFromValues:
																																				(OrderedCollection new
																																						add: nil;
																																						yourself);
																																		yourself);
																														add:
																																(ExChdDtdElement new
																																		dtdElementFromValues:
																																				(OrderedCollection new
																																						add: self owner;
																																						add: nil;
																																						yourself);
																																		yourself);
																														yourself)) pltAsObject;
																								add:
																										(ExChdDomainDtdElement new
																												domainDtdElementFromValues:
																														(OrderedCollection new
																																add: self domain;
																																yourself);
																												yourself);
																								yourself)) pltAsObject.
																			self result
																				elementDomain:
																					(ExChdComputeDomainDtdElementFunction
																						invokeFromValues:
																							(OrderedCollection new
																								add: self result;
																								add: self elementDomain;
																								yourself)).
																			^ self return: self result ] ] ] ] ] ] ] ] ].
	PTsPrintLnProcedure
		invokeFromValues:
			(OrderedCollection new
				add: self domain;
				yourself).
	^ self
		return:
			(PlatypusComplexInstance
				fromRecords:
					(OrderedCollection new
						add:
								(PlatypusComplexInstance
										fromRecords:
											(OrderedCollection new
												add: ExChdUnknownDomainDtdElement new;
												add:
														(ExChdDtdElement new
																dtdElementFromValues:
																		(OrderedCollection new
																				add: self owner;
																				add: nil;
																				yourself);
																yourself);
												yourself)) pltAsObject;
						add:
								(ExChdDomainDtdElement new
										domainDtdElementFromValues:
												(OrderedCollection new
														add: self domain;
														yourself);
										yourself);
						yourself)) pltAsObject


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeDomainDtdElementFunction >> owner [
	^ owner


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeDomainDtdElementFunction >> owner: aExChdDtdElement [
	owner := aExChdDtdElement


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeDomainDtdElementFunction >> owner: aExChdDtdElement domain: aExChdEntityInstance [
	self owner: aExChdDtdElement.
	self domain: aExChdEntityInstance


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeDomainDtdElementFunction >> result [
	^ result


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeDomainDtdElementFunction >> result: aExChdDomainDtdElement [
	result := aExChdDomainDtdElement


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeDomainDtdElementFunction >> subDomain [
	^ subDomain


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeDomainDtdElementFunction >> subDomain: aExChdEntityInstance [
	subDomain := aExChdEntityInstance


]
