"
<ISO10303-11-EXPRESS>
FUNCTION get_referenced_entity_domains ( pkgs : LIST OF package_dtd_element ) : LIST OF entity_ref_dtd_element;
	LOCAL 
		attributes : LIST OF attribute_dtd_element := [ ];
		domains : LIST OF entity_ref_dtd_element := [ ];
		names : LIST OF STRING := [ ];
		curr : domain_dtd_element;
	END_LOCAL;

	REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );
		attributes := attributes + compute_package_attribute_dtd_elements ( pkgs [ no] );
	END_REPEAT;

	REPEAT noi := LOINDEX ( attributes ) TO HIINDEX ( attributes );
		curr := ?;

		ALIAS dom FOR attributes [ noi].domain;
			IF ( 'CHEDDAR_DTD.ENTITY_REF_DTD_ELEMENT' IN TYPEOF ( dom ) ) THEN
				curr := dom;
			END_IF;
			IF ( ( 'CHEDDAR_DTD.COLLECTION_DTD_ELEMENT' IN TYPEOF ( dom ) ) AND ( 'CHEDDAR_DTD.ENTITY_REF_DTD_ELEMENT' IN TYPEOF ( dom.element_domain ) ) ) THEN
				curr := dom.element_domain;
			END_IF;
			IF EXISTS ( curr ) THEN
				IF NOT ( lowerize ( curr.domain.name ) IN names ) THEN
					domains := domains + curr;
					names := names + lowerize ( curr.domain.name );
				END_IF;
			END_IF;
		END_ALIAS;
	END_REPEAT;
	RETURN ( domains );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdGetReferencedEntityDomainsFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'pkgs',
		'attributes',
		'domains',
		'names',
		'curr'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdGetReferencedEntityDomainsFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdGetReferencedEntityDomainsFunction class >> schemaDefinition [

	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdGetReferencedEntityDomainsFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdGetReferencedEntityDomainsFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdGetReferencedEntityDomainsFunction >> attributes [

	^ attributes


]

{ #category : 'platypus-generated-accessing' }
ExChdGetReferencedEntityDomainsFunction >> attributes: aListOfExChdAttributeDtdElement [

	attributes := aListOfExChdAttributeDtdElement
		              ifNil: [ OrderedCollection new ]
		              ifNotNil: [
		              aListOfExChdAttributeDtdElement as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdGetReferencedEntityDomainsFunction >> curr [

	^ curr


]

{ #category : 'platypus-generated-accessing' }
ExChdGetReferencedEntityDomainsFunction >> curr: aExChdDomainDtdElement [

	curr := aExChdDomainDtdElement


]

{ #category : 'platypus-generated-accessing' }
ExChdGetReferencedEntityDomainsFunction >> domains [

	^ domains


]

{ #category : 'platypus-generated-accessing' }
ExChdGetReferencedEntityDomainsFunction >> domains: aListOfExChdEntityRefDtdElement [

	domains := aListOfExChdEntityRefDtdElement
		           ifNil: [ OrderedCollection new ]
		           ifNotNil: [
		           aListOfExChdEntityRefDtdElement as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdGetReferencedEntityDomainsFunction >> fromValues: values [

	self pkgs: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdGetReferencedEntityDomainsFunction >> invoke [
	" ---------- locals assignments ----------"

	self attributes: Array new.
	self domains: Array new.
	self names: Array new. " ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no2161667 |
				self attributes: (self attributes pltPlus:
						 (ExChdComputePackageAttributeDtdElementsFunction
							  invokeFromValues: (OrderedCollection new
									   add: (self pkgs pltAt: no2161667);
									   yourself))) ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self pkgs;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self pkgs;
					  yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :noi3002793 |
				self curr: nil.
				PlatypusCoreAliasStatement
					alias: ((self attributes pltAt: noi3002793) domainUsingContext:
							 self class context)
					statementsBlock: [ :dom3051247 |
							((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
									   add: dom3051247;
									   yourself)) includes: 'CHEDDAR_DTD.ENTITY_REF_DTD_ELEMENT')
								ifTrue: [ self curr: dom3051247 ].
							(((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
									    add: dom3051247;
									    yourself)) includes: 'CHEDDAR_DTD.COLLECTION_DTD_ELEMENT')
								 and: [
										 (PltTYPEOFFunction invokeFromValues:
											  (OrderedCollection new
												   add:
													   (dom3051247 elementDomainUsingContext:
															    self class context);
												   yourself)) includes:
											 'CHEDDAR_DTD.ENTITY_REF_DTD_ELEMENT' ]) ifTrue: [
								self curr:
									(dom3051247 elementDomainUsingContext: self class context) ].
							(PltEXISTSFunction invokeFromValues: (OrderedCollection new
									  add: self curr;
									  yourself)) ifTrue: [
									(self names includes:
										 (PTsLowerizeFunction invokeFromValues:
											  (OrderedCollection new
												   add:
													   ((self curr domainUsingContext: self class context)
														    nameUsingContext: self class context);
												   yourself))) not ifTrue: [
											self domains: (self domains pltPlus: self curr).
											self names: (self names pltPlus:
													 (PTsLowerizeFunction invokeFromValues:
														  (OrderedCollection new
															   add:
																   ((self curr domainUsingContext: self class context)
																	    nameUsingContext: self class context);
															   yourself))) ] ] ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self attributes;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self attributes;
					  yourself)).
	^ self return: self domains


]

{ #category : 'platypus-generated-accessing' }
ExChdGetReferencedEntityDomainsFunction >> names [

	^ names


]

{ #category : 'platypus-generated-accessing' }
ExChdGetReferencedEntityDomainsFunction >> names: aListOfString [

	names := aListOfString
		         ifNil: [ OrderedCollection new ]
		         ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdGetReferencedEntityDomainsFunction >> pkgs [

	^ pkgs


]

{ #category : 'platypus-generated-accessing' }
ExChdGetReferencedEntityDomainsFunction >> pkgs: aListOfExChdPackageDtdElement [

	pkgs := aListOfExChdPackageDtdElement
		        ifNil: [ OrderedCollection new ]
		        ifNotNil: [
		        aListOfExChdPackageDtdElement as: OrderedCollection ]


]
