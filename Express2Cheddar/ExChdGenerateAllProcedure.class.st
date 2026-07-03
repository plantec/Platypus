"
<ISO10303-11-EXPRESS>
PROCEDURE generate_all;
	generate_all_into ( './' );
END_PROCEDURE;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdGenerateAllProcedure',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#category : 'Express2Cheddar-Express2cheddarFacadeSchema',
	#package : 'Express2Cheddar',
	#tag : 'Express2cheddarFacadeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdGenerateAllProcedure class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdGenerateAllProcedure class >> schemaDefinition [

	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdGenerateAllProcedure class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdGenerateAllProcedure class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-invoking' }
ExChdGenerateAllProcedure >> invoke [
	" ---------- locals assignments ----------"" ---------- statements ----------"

	ExChdGenerateAllIntoProcedure invokeFromValues:
		(OrderedCollection new
			 add: './';
			 yourself)


]
