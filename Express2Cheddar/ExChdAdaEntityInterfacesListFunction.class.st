"
<ISO10303-11-EXPRESS>
FUNCTION ada_entity_interfaces_list ( r : ada_entity; ads : BOOLEAN ) : LIST OF ada_interface;
	LOCAL 
		result : LIST OF ada_interface := entity_definition_interfaces_list ( r, ads );
	END_LOCAL;

	IF ads THEN

		IF 'PACKAGE.ADA_PACKAGE' IN TYPEOF ( r.owner ) THEN
			result := result + ada_interface ( r.owner.name, ?, true, true );
		END_IF;

		IF ( SIZEOF ( r.supertypes ) > 0 ) THEN
			ALIAS supref FOR r.supertypes [ 1 ].ref;
				IF 'PACKAGE.ADA_PACKAGE' IN TYPEOF ( supref.owner ) THEN
					result := result + ada_interface ( supref.owner.name, ?, true, true );
				END_IF;
			END_ALIAS;
		END_IF;
		result := result + ada_interface ( 'Ada.Finalization', ?, true, false );
		result := result + ada_interface ( 'unbounded_strings', ?, true, true );
		result := result + ada_interface ( 'ada.strings', 'unbounded', true, true );
		result := result + ada_interface ( 'unbounded_strings', 'Unbounded_String_List_Package', false, true );
		result := result + ada_interface ( 'Unchecked_Deallocation', ?, true, false );
		result := result + ada_interface ( 'Primitive_XML_Strings', ?, true, true );
	ELSE

		IF has_attribute_named ( r, xml_id_name ) THEN
			result := result + ada_interface ( 'framework', ?, true, true );
			result := result + ada_interface ( 'id_generators', ?, true, true );
		END_IF;
	END_IF;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaEntityInterfacesListFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'r',
		'ads',
		'result'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityInterfacesListFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaEntityInterfacesListFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityInterfacesListFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityInterfacesListFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityInterfacesListFunction >> ads [
	^ ads


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityInterfacesListFunction >> ads: aBoolean [
	ads := aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityInterfacesListFunction >> fromValues: values [
	self r: (values at: 1).
	self ads: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaEntityInterfacesListFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		result:
			(ExChdEntityDefinitionInterfacesListFunction
				invokeFromValues:
					(OrderedCollection new
						add: self r;
						add: self ads;
						yourself)).	" ---------- statements ----------"
	self ads
		ifTrue: [ 
			((PltTYPEOFFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self r ownerUsingContext: self class context);
						yourself)) includes: 'PACKAGE.ADA_PACKAGE')
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
			(PltSIZEOFFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self r supertypesUsingContext: self class context);
						yourself)) > 0
				ifTrue: [ 
					PlatypusCoreAliasStatement
						alias: (((self r supertypesUsingContext: self class context) pltAt: 1) refUsingContext: self class context)
						statementsBlock: [ :supref3513 | 
							((PltTYPEOFFunction
								invokeFromValues:
									(OrderedCollection new
										add: (supref3513 ownerUsingContext: self class context);
										yourself)) includes: 'PACKAGE.ADA_PACKAGE')
								ifTrue: [ 
									self
										result:
											(self result
												pltPlus:
													(ExChdAdaInterface new
														adaInterfaceFromValues:
																(OrderedCollection new
																		add: ((supref3513 ownerUsingContext: self class context) nameUsingContext: self class context);
																		add: nil;
																		add: true;
																		add: true;
																		yourself);
														yourself)) ] ] ].
			self
				result:
					(self result
						pltPlus:
							(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Ada.Finalization';
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
												add: 'unbounded_strings';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself)).
			self
				result:
					(self result
						pltPlus:
							(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'ada.strings';
												add: 'unbounded';
												add: true;
												add: true;
												yourself);
								yourself)).
			self
				result:
					(self result
						pltPlus:
							(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'unbounded_strings';
												add: 'Unbounded_String_List_Package';
												add: false;
												add: true;
												yourself);
								yourself)).
			self
				result:
					(self result
						pltPlus:
							(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'Unchecked_Deallocation';
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
												add: 'Primitive_XML_Strings';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself)) ]
		ifFalse: [ 
			(PTsHasAttributeNamedFunction
				invokeFromValues:
					(OrderedCollection new
						add: self r;
						add: 'cheddar_private_id';
						yourself))
				ifTrue: [ 
					self
						result:
							(self result
								pltPlus:
									(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'framework';
														add: nil;
														add: true;
														add: true;
														yourself);
										yourself)).
					self
						result:
							(self result
								pltPlus:
									(ExChdAdaInterface new
										adaInterfaceFromValues:
												(OrderedCollection new
														add: 'id_generators';
														add: nil;
														add: true;
														add: true;
														yourself);
										yourself)) ] ].
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityInterfacesListFunction >> r [
	^ r


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityInterfacesListFunction >> r: aExChdAdaEntity [
	r := aExChdAdaEntity


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityInterfacesListFunction >> r: aExChdAdaEntity ads: aBoolean [
	self r: aExChdAdaEntity.
	self ads: aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityInterfacesListFunction >> result [
	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityInterfacesListFunction >> result: aListOfExChdAdaInterface [
	result := aListOfExChdAdaInterface
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface as: OrderedCollection ]


]
