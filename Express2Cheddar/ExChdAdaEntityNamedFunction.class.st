"
<ISO10303-11-EXPRESS>
FUNCTION ada_entity_named ( name : STRING ) : ada_entity;
	LOCAL 
		entities : LIST OF ada_entity := all_ada_entities ( );
		key : STRING := Lowerize ( name );
	END_LOCAL;

	REPEAT no := LOINDEX ( entities ) TO HIINDEX ( entities );

		ALIAS curr FOR entities [ no];
			IF ( Lowerize ( curr.name ) = key ) THEN
				RETURN ( curr );
			END_IF;
		END_ALIAS;
	END_REPEAT;
	RETURN ( ? );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaEntityNamedFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'name',
		'entities',
		'key'
	],
	#category : 'Express2Cheddar-Express2cheddarFacadeSchema',
	#package : 'Express2Cheddar',
	#tag : 'Express2cheddarFacadeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityNamedFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaEntityNamedFunction class >> schemaDefinition [

	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityNamedFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntityNamedFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityNamedFunction >> entities [

	^ entities


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityNamedFunction >> entities: aListOfExChdAdaEntity [

	entities := aListOfExChdAdaEntity
		            ifNil: [ OrderedCollection new ]
		            ifNotNil: [ aListOfExChdAdaEntity as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityNamedFunction >> fromValues: values [

	self name: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaEntityNamedFunction >> invoke [
	" ---------- locals assignments ----------"

	self entities: ExChdAllAdaEntitiesFunction invoke.
	self key:
		(PTsLowerizeFunction invokeFromValues: (OrderedCollection new
				  add: self name;
				  yourself)). " ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no3003745 |
				PlatypusCoreAliasStatement
					alias: (self entities pltAt: no3003745)
					statementsBlock: [ :curr1305573 |
							(PTsLowerizeFunction invokeFromValues: (OrderedCollection new
									  add: (curr1305573 nameUsingContext: self class context);
									  yourself)) = self key ifTrue: [ ^ self return: curr1305573 ] ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self entities;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self entities;
					  yourself)).
	^ self return: nil


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityNamedFunction >> key [

	^ key


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityNamedFunction >> key: aString [

	key := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityNamedFunction >> name [

	^ name


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaEntityNamedFunction >> name: aString [

	name := aString


]
