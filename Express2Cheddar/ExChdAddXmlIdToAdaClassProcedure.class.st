"
<ISO10303-11-EXPRESS>
PROCEDURE add_xml_id_to_ada_class ( VAR cls : ada_class );
	LOCAL 
		idtype : cheddar_xml_id_type := entity_instance ( ? ) || sdai_instance ( ) || dictionary_instance ( ) || simple_type ( ) || string_type ( ?, false ) || cheddar_xml_id_type ( );
		idattr : explicit_attribute := entity_instance ( cls ) || sdai_instance ( ) || dictionary_instance ( ) || attribute ( xml_id_name, cls, idtype, ? ) || explicit_attribute ( false );
	END_LOCAL;
	idtype.owner := idattr;
	INSERT ( cls.attributes, idattr, 0 );
END_PROCEDURE;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAddXmlIdToAdaClassProcedure,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'cls',
		'idtype',
		'idattr'
	],
	#category : #'Express2Cheddar-Express2cheddarFacadeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAddXmlIdToAdaClassProcedure class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAddXmlIdToAdaClassProcedure class >> schemaDefinition [
	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAddXmlIdToAdaClassProcedure class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAddXmlIdToAdaClassProcedure class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAddXmlIdToAdaClassProcedure >> cls [
	^ cls


]

{ #category : #'platypus-generated-accessing' }
ExChdAddXmlIdToAdaClassProcedure >> cls: aExChdAdaClass [
	cls := aExChdAdaClass


]

{ #category : #'platypus-generated-accessing' }
ExChdAddXmlIdToAdaClassProcedure >> fromValues: values [
	self cls: (values at: 1)


]

{ #category : #'platypus-generated-accessing' }
ExChdAddXmlIdToAdaClassProcedure >> idattr [
	^ idattr


]

{ #category : #'platypus-generated-accessing' }
ExChdAddXmlIdToAdaClassProcedure >> idattr: aExChdExplicitAttribute [
	idattr := aExChdExplicitAttribute


]

{ #category : #'platypus-generated-accessing' }
ExChdAddXmlIdToAdaClassProcedure >> idtype [
	^ idtype


]

{ #category : #'platypus-generated-accessing' }
ExChdAddXmlIdToAdaClassProcedure >> idtype: aExChdCheddarXmlIdType [
	idtype := aExChdCheddarXmlIdType


]

{ #category : #'platypus-generated-invoking' }
ExChdAddXmlIdToAdaClassProcedure >> invoke [
	" ---------- locals assignments ----------"

	self
		idtype:
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
																		add:
																				(PlatypusComplexInstance
																						fromRecords:
																							(OrderedCollection new
																								add:
																										(PlatypusComplexInstance
																												fromRecords:
																													(OrderedCollection new
																														add:
																																(PltEntityInstance new
																																		entityInstanceFromValues:
																																				(OrderedCollection new
																																						add: nil;
																																						yourself);
																																		yourself);
																														add: PltSdaiInstance new;
																														yourself)) pltAsObject;
																								add: PltDictionaryInstance new;
																								yourself)) pltAsObject;
																		add: PltSimpleType new;
																		yourself)) pltAsObject;
												add:
														(PltStringType new
																stringTypeFromValues:
																		(OrderedCollection new
																				add: nil;
																				add: false;
																				yourself);
																yourself);
												yourself)) pltAsObject;
						add: ExChdCheddarXmlIdType new;
						yourself)) pltAsObject.
	self
		idattr:
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
																		add:
																				(PlatypusComplexInstance
																						fromRecords:
																							(OrderedCollection new
																								add:
																										(PltEntityInstance new
																												entityInstanceFromValues:
																														(OrderedCollection new
																																add: self cls;
																																yourself);
																												yourself);
																								add: PltSdaiInstance new;
																								yourself)) pltAsObject;
																		add: PltDictionaryInstance new;
																		yourself)) pltAsObject;
												add:
														(PltAttribute new
																attributeFromValues:
																		(OrderedCollection new
																				add: 'cheddar_private_id';
																				add: self cls;
																				add: self idtype;
																				add: nil;
																				yourself);
																yourself);
												yourself)) pltAsObject;
						add:
								(PltExplicitAttribute new
										explicitAttributeFromValues:
												(OrderedCollection new
														add: false;
														yourself);
										yourself);
						yourself)) pltAsObject.	" ---------- statements ----------"
	self idtype owner: self idattr.
	PltINSERTProcedure
		invokeFromValues:
			(OrderedCollection new
				add: (self cls attributesUsingContext: self class context);
				add: self idattr;
				add: 0;
				yourself)


]
