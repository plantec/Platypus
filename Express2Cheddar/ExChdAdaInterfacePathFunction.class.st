"
<ISO10303-11-EXPRESS>
FUNCTION ada_interface_path ( i : ada_interface ) : STRING;
	LOCAL 
		name : STRING := i.prefix;
	END_LOCAL;

	IF EXISTS ( i.suffix ) THEN
		name := name + '.' + i.suffix;
	END_IF;
	RETURN ( name );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaInterfacePathFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'i',
		'name'
	],
	#category : #'Express2Cheddar-AdaInterfaceSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaInterfacePathFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaInterfacePathFunction class >> schemaDefinition [
	^ ExChdAdaInterfaceSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaInterfacePathFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaInterfacePathFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaInterfacePathFunction >> fromValues: values [
	self i: (values at: 1)


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaInterfacePathFunction >> i [
	^ i


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaInterfacePathFunction >> i: aExChdAdaInterface [
	i := aExChdAdaInterface


]

{ #category : #'platypus-generated-invoking' }
ExChdAdaInterfacePathFunction >> invoke [
	" ---------- locals assignments ----------"

	self name: (self i prefixUsingContext: self class context).	" ---------- statements ----------"
	(PltEXISTSFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self i suffixUsingContext: self class context);
				yourself))
		ifTrue: [ self name: ((self name pltPlus: '.') pltPlus: (self i suffixUsingContext: self class context)) ].
	^ self return: self name


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaInterfacePathFunction >> name [
	^ name


]

{ #category : #'platypus-generated-accessing' }
ExChdAdaInterfacePathFunction >> name: aString [
	name := aString


]
