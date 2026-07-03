"
<ISO10303-11-EXPRESS>
FUNCTION get_declared_entity_domains ( pkgs : LIST OF package_dtd_element ) : LIST OF dtd_element;
	LOCAL 
		result : LIST OF dtd_element := [ ];
	END_LOCAL;

	REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );
		result := result + pkgs [ no].subs;
	END_REPEAT;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdGetDeclaredEntityDomainsFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'pkgs',
		'result'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdGetDeclaredEntityDomainsFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdGetDeclaredEntityDomainsFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdGetDeclaredEntityDomainsFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdGetDeclaredEntityDomainsFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdGetDeclaredEntityDomainsFunction >> fromValues: values [
	self pkgs: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdGetDeclaredEntityDomainsFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: Array new.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no597 | self result: (self result pltPlus: ((self pkgs pltAt: no597) subsUsingContext: self class context)) ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self pkgs;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self pkgs;
						yourself)).
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdGetDeclaredEntityDomainsFunction >> pkgs [
	^ pkgs


]

{ #category : 'platypus-generated-accessing' }
ExChdGetDeclaredEntityDomainsFunction >> pkgs: aListOfExChdPackageDtdElement [
	pkgs := aListOfExChdPackageDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdPackageDtdElement as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdGetDeclaredEntityDomainsFunction >> result [
	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdGetDeclaredEntityDomainsFunction >> result: aListOfExChdDtdElement [
	result := aListOfExChdDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDtdElement as: OrderedCollection ]


]
