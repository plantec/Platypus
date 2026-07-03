"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_union_type_interfaces_list ( d : discriminated_type_union_type; isAds : BOOLEAN ) : LIST OF ada_interface;
	LOCAL 
		l : LIST OF ada_interface := [ ];
	END_LOCAL;

	REPEAT no := LOINDEX ( d.attributes ) TO HIINDEX ( d.attributes );

		ALIAS curr FOR d.attributes [ no];
			l := l + entity_definition_interfaces_list ( curr.domain.handled, isAds );
		END_ALIAS;
	END_REPEAT;
	RETURN ( l );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDiscriminatedTypeUnionTypeInterfacesListFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'd',
		'isAds',
		'l'
	],
	#category : 'Express2Cheddar-DiscriminatedTypeSchema',
	#package : 'Express2Cheddar',
	#tag : 'DiscriminatedTypeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction >> d [
	^ d


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction >> d: aExChdDiscriminatedTypeUnionType [
	d := aExChdDiscriminatedTypeUnionType


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction >> d: aExChdDiscriminatedTypeUnionType isAds: aBoolean [
	self d: aExChdDiscriminatedTypeUnionType.
	self isAds: aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction >> fromValues: values [
	self d: (values at: 1).
	self isAds: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction >> invoke [
	" ---------- locals assignments ----------"

	self l: Array new.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no657 | 
			PlatypusCoreAliasStatement
				alias: ((self d attributesUsingContext: self class context) pltAt: no657)
				statementsBlock: [ :curr2607 | 
					self
						l:
							(self l
								pltPlus:
									(ExChdEntityDefinitionInterfacesListFunction
										invokeFromValues:
											(OrderedCollection new
												add: ((curr2607 domainUsingContext: self class context) handledUsingContext: self class context);
												add: self isAds;
												yourself))) ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self d attributesUsingContext: self class context);
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self d attributesUsingContext: self class context);
						yourself)).
	^ self return: self l


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction >> isAds [
	^ isAds


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction >> isAds: aBoolean [
	isAds := aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction >> l [
	^ l


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeUnionTypeInterfacesListFunction >> l: aListOfExChdAdaInterface [
	l := aListOfExChdAdaInterface
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface as: OrderedCollection ]


]
