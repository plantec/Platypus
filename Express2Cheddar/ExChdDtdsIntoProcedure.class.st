"
<ISO10303-11-EXPRESS>
PROCEDURE dtds_Into ( dir : STRING );
	LOCAL 
		roots : LIST OF root_dtd_element := root_dtds ( );
		path : STRING;
	END_LOCAL;
	prepare_root_ada_classes;

	IF EXISTS ( dir ) THEN
		path := dir;
	ELSE
		path := '.';
	END_IF;

	REPEAT no := LOINDEX ( roots ) TO HIINDEX ( roots );

		ALIAS curr FOR roots [ no];
			WriteFile ( path + '/' + curr.tag + '.dtd', curr.dtd_code );
		END_ALIAS;
	END_REPEAT;
END_PROCEDURE;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDtdsIntoProcedure',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'dir',
		'roots',
		'path'
	],
	#category : 'Express2Cheddar-Express2cheddarFacadeSchema',
	#package : 'Express2Cheddar',
	#tag : 'Express2cheddarFacadeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDtdsIntoProcedure class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDtdsIntoProcedure class >> schemaDefinition [

	^ ExChdExpress2cheddarFacadeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDtdsIntoProcedure class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDtdsIntoProcedure class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDtdsIntoProcedure >> dir [

	^ dir


]

{ #category : 'platypus-generated-accessing' }
ExChdDtdsIntoProcedure >> dir: aString [

	dir := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdDtdsIntoProcedure >> fromValues: values [

	self dir: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdDtdsIntoProcedure >> invoke [
	" ---------- locals assignments ----------"

	self roots: ExChdRootDtdsFunction invoke. " ---------- statements ----------"
	ExChdPrepareRootAdaClassesProcedure invoke.
	(PltEXISTSFunction invokeFromValues: (OrderedCollection new
			  add: self dir;
			  yourself))
		ifTrue: [ self path: self dir ]
		ifFalse: [ self path: '.' ].
	PlatypusCoreRepeatStatement
		repeat: [ :no2192789 |
				PlatypusCoreAliasStatement
					alias: (self roots pltAt: no2192789)
					statementsBlock: [ :curr3060283 |
							PTsWriteFileProcedure invokeFromValues: (OrderedCollection new
									 add: (((self path pltPlus: '/') pltPlus:
												   (curr3060283 tagUsingContext: self class context))
											  pltPlus: '.dtd');
									 add: (curr3060283 dtdCodeUsingContext: self class context);
									 yourself) ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self roots;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self roots;
					  yourself))


]

{ #category : 'platypus-generated-accessing' }
ExChdDtdsIntoProcedure >> path [

	^ path


]

{ #category : 'platypus-generated-accessing' }
ExChdDtdsIntoProcedure >> path: aString [

	path := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdDtdsIntoProcedure >> roots [

	^ roots


]

{ #category : 'platypus-generated-accessing' }
ExChdDtdsIntoProcedure >> roots: aListOfExChdRootDtdElement [

	roots := aListOfExChdRootDtdElement
		         ifNil: [ OrderedCollection new ]
		         ifNotNil: [
		         aListOfExChdRootDtdElement as: OrderedCollection ]


]
