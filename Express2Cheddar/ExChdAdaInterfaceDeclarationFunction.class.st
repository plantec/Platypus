"
<ISO10303-11-EXPRESS>
FUNCTION ada_interface_declaration ( int : ada_interface ) : STRING;
	LOCAL 
		s : STRING := '';
		name : STRING := ada_interface_path ( int );
	END_LOCAL;

	IF int.with_it THEN
		s := s + 'with ' + name + ';\n';
	END_IF;

	IF int.use_it THEN
		s := s + 'use ' + name + ';\n';
	END_IF;
	RETURN ( s );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaInterfaceDeclarationFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'int',
		's',
		'name'
	],
	#category : 'Express2Cheddar-AdaInterfaceSchema',
	#package : 'Express2Cheddar',
	#tag : 'AdaInterfaceSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaInterfaceDeclarationFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaInterfaceDeclarationFunction class >> schemaDefinition [

	^ ExChdAdaInterfaceSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaInterfaceDeclarationFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaInterfaceDeclarationFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfaceDeclarationFunction >> fromValues: values [

	self int: (values at: 1)


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfaceDeclarationFunction >> int [

	^ int


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfaceDeclarationFunction >> int: aExChdAdaInterface [

	int := aExChdAdaInterface


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaInterfaceDeclarationFunction >> invoke [
	" ---------- locals assignments ----------"

	self s: ''.
	self name: (ExChdAdaInterfacePathFunction invokeFromValues:
			 (OrderedCollection new
				  add: self int;
				  yourself)). " ---------- statements ----------"
	(self int withItUsingContext: self class context) ifTrue: [
			self s:
				(((self s pltPlus: 'with ') pltPlus: self name) pltPlus: ';\n') ].
	(self int useItUsingContext: self class context) ifTrue: [
		self s:
			(((self s pltPlus: 'use ') pltPlus: self name) pltPlus: ';\n') ].
	^ self return: self s


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfaceDeclarationFunction >> name [

	^ name


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfaceDeclarationFunction >> name: aString1 [

	name := aString1


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfaceDeclarationFunction >> s [

	^ s


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfaceDeclarationFunction >> s: aString [

	s := aString


]
