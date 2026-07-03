"
<ISO10303-11-EXPRESS>
FUNCTION concept_in_list ( c : dictionary_instance; l : LIST OF dictionary_instance ) : BOOLEAN;
	LOCAL 
		key : STRING := upperize ( c.name );
	END_LOCAL;

	REPEAT no := LOINDEX ( l ) TO HIINDEX ( l );

		IF ( upperize ( l [ no].name ) = key ) THEN
			RETURN ( true );
		END_IF;
	END_REPEAT;
	RETURN ( false );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdConceptInListFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'c',
		'l',
		'key'
	],
	#category : 'Express2Cheddar-PackageSchema',
	#package : 'Express2Cheddar',
	#tag : 'PackageSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdConceptInListFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdConceptInListFunction class >> schemaDefinition [
	^ ExChdPackageSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdConceptInListFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdConceptInListFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptInListFunction >> c [
	^ c


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptInListFunction >> c: aExChdDictionaryInstance [
	c := aExChdDictionaryInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptInListFunction >> c: aExChdDictionaryInstance l: aListOfExChdDictionaryInstance [
	self c: aExChdDictionaryInstance.
	self l: aListOfExChdDictionaryInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptInListFunction >> fromValues: values [
	self c: (values at: 1).
	self l: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
ExChdConceptInListFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		key:
			(PTsUpperizeFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self c nameUsingContext: self class context);
						yourself)).	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no1795 | 
			(PTsUpperizeFunction
				invokeFromValues:
					(OrderedCollection new
						add: ((self l pltAt: no1795) nameUsingContext: self class context);
						yourself)) = self key
				ifTrue: [ ^ self return: true ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self l;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self l;
						yourself)).
	^ self return: false


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptInListFunction >> key [
	^ key


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptInListFunction >> key: aString [
	key := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptInListFunction >> l [
	^ l


]

{ #category : 'platypus-generated-accessing' }
ExChdConceptInListFunction >> l: aListOfExChdDictionaryInstance [
	l := aListOfExChdDictionaryInstance
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDictionaryInstance as: OrderedCollection ]


]
