"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_interfaces_list ( r : discriminated_type; ads : BOOLEAN ) : LIST OF ada_interface;
	RETURN ( ada_entity_interfaces_list ( r, ads ) );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdDiscriminatedTypeInterfacesListFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'r',
		'ads'
	],
	#category : #'Express2Cheddar-DiscriminatedTypeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeInterfacesListFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeInterfacesListFunction class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeInterfacesListFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeInterfacesListFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeInterfacesListFunction >> ads [
	^ ads


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeInterfacesListFunction >> ads: aBoolean [
	ads := aBoolean


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeInterfacesListFunction >> fromValues: values [
	self r: (values at: 1).
	self ads: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
ExChdDiscriminatedTypeInterfacesListFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			(ExChdAdaEntityInterfacesListFunction
				invokeFromValues:
					(OrderedCollection new
						add: self r;
						add: self ads;
						yourself))


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeInterfacesListFunction >> r [
	^ r


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeInterfacesListFunction >> r: aExChdDiscriminatedType [
	r := aExChdDiscriminatedType


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeInterfacesListFunction >> r: aExChdDiscriminatedType ads: aBoolean [
	self r: aExChdDiscriminatedType.
	self ads: aBoolean


]
