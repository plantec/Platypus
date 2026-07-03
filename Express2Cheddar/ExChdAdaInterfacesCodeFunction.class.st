"
<ISO10303-11-EXPRESS>
FUNCTION ada_interfaces_code ( from_pkg : ada_package; l : LIST OF ada_interface ) : STRING;
	LOCAL 
		found : SET OF STRING := [ ];
		with_suffix : LIST OF ada_interface := [ ];
		with_prefix_only : LIST OF ada_interface := [ ];
		cleaned : LIST OF ada_interface := [ ];
		inserted : BOOLEAN;
		s : STRING := '';
	END_LOCAL;

	REPEAT no := LOINDEX ( l ) TO HIINDEX ( l );

		ALIAS curr FOR l [ no];
			IF NOT EXISTS ( from_pkg ) OR ( upperize ( from_pkg.name ) <> upperize ( curr.prefix ) ) THEN
				IF NOT ( upperize ( curr.full_name ) IN found ) THEN
					found := found + upperize ( curr.full_name );
					cleaned := cleaned + curr;
				END_IF;
			END_IF;
		END_ALIAS;
	END_REPEAT;

	REPEAT no := LOINDEX ( cleaned ) TO HIINDEX ( cleaned );

		ALIAS curr FOR cleaned [ no];
			IF EXISTS ( curr.suffix ) THEN
				with_suffix := with_suffix + curr;
			ELSE
				with_prefix_only := with_prefix_only + curr;
			END_IF;
		END_ALIAS;
	END_REPEAT;
	cleaned := [ ];

	REPEAT no := LOINDEX ( with_prefix_only ) TO HIINDEX ( with_prefix_only );
		cleaned := cleaned + with_prefix_only [ no];
	END_REPEAT;

	REPEAT no := LOINDEX ( with_suffix ) TO HIINDEX ( with_suffix );

		ALIAS curr FOR with_suffix [ no];
			inserted := false;
			REPEAT noi := LOINDEX ( cleaned ) TO HIINDEX ( cleaned );
				ALIAS curri FOR cleaned [ noi];
					IF ( upperize ( curr.prefix ) = upperize ( curri.prefix ) ) THEN
						INSERT ( cleaned, curr, noi );
						inserted := true;
						ESCAPE;
					END_IF;
				END_ALIAS;
			END_REPEAT;
			IF ( inserted = false ) THEN
				cleaned := cleaned + curr;
			END_IF;
		END_ALIAS;
	END_REPEAT;

	REPEAT no := LOINDEX ( cleaned ) TO HIINDEX ( cleaned );

		ALIAS curr FOR cleaned [ no];
			s := s + curr.declaration + '\n';
		END_ALIAS;
	END_REPEAT;
	RETURN ( s );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaInterfacesCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'fromPkg',
		'l',
		'found',
		'withSuffix',
		'withPrefixOnly',
		'cleaned',
		'inserted',
		's'
	],
	#category : 'Express2Cheddar-AdaInterfaceSchema',
	#package : 'Express2Cheddar',
	#tag : 'AdaInterfaceSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaInterfacesCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaInterfacesCodeFunction class >> schemaDefinition [
	^ ExChdAdaInterfaceSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaInterfacesCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaInterfacesCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> cleaned [
	^ cleaned


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> cleaned: aListOfExChdAdaInterface2 [
	cleaned := aListOfExChdAdaInterface2
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface2 as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> found [
	^ found


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> found: aSetOfString [
	found := aSetOfString ifNil: [ Set new ] ifNotNil: [ aSetOfString as: Set ]


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> fromPkg [
	^ fromPkg


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> fromPkg: aExChdAdaPackage [
	fromPkg := aExChdAdaPackage


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> fromPkg: aExChdAdaPackage l: aListOfExChdAdaInterface [
	self fromPkg: aExChdAdaPackage.
	self l: aListOfExChdAdaInterface


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> fromValues: values [
	self fromPkg: (values at: 1).
	self l: (values at: 2)


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> inserted [
	^ inserted


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> inserted: aBoolean [
	inserted := aBoolean


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaInterfacesCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self found: Array new.
	self withSuffix: Array new.
	self withPrefixOnly: Array new.
	self cleaned: Array new.
	self s: ''.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no99 | 
			PlatypusCoreAliasStatement
				alias: (self l pltAt: no99)
				statementsBlock: [ :curr1205 | 
					((PltEXISTSFunction
						invokeFromValues:
							(OrderedCollection new
								add: self fromPkg;
								yourself)) not
						or: [ 
							(PTsUpperizeFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self fromPkg nameUsingContext: self class context);
										yourself))
								~=
									(PTsUpperizeFunction
										invokeFromValues:
											(OrderedCollection new
												add: (curr1205 prefixUsingContext: self class context);
												yourself)) ])
						ifTrue: [ 
							(self found
								includes:
									(PTsUpperizeFunction
										invokeFromValues:
											(OrderedCollection new
												add: (curr1205 fullNameUsingContext: self class context);
												yourself))) not
								ifTrue: [ 
									self
										found:
											(self found
												pltPlus:
													(PTsUpperizeFunction
														invokeFromValues:
															(OrderedCollection new
																add: (curr1205 fullNameUsingContext: self class context);
																yourself))).
									self cleaned: (self cleaned pltPlus: curr1205) ] ] ] ]
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
	PlatypusCoreRepeatStatement
		repeat: [ :no2174 | 
			PlatypusCoreAliasStatement
				alias: (self cleaned pltAt: no2174)
				statementsBlock: [ :curr3284 | 
					(PltEXISTSFunction
						invokeFromValues:
							(OrderedCollection new
								add: (curr3284 suffixUsingContext: self class context);
								yourself))
						ifTrue: [ self withSuffix: (self withSuffix pltPlus: curr3284) ]
						ifFalse: [ self withPrefixOnly: (self withPrefixOnly pltPlus: curr3284) ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self cleaned;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self cleaned;
						yourself)).
	self cleaned: Array new.
	PlatypusCoreRepeatStatement
		repeat: [ :no2992 | self cleaned: (self cleaned pltPlus: (self withPrefixOnly pltAt: no2992)) ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self withPrefixOnly;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self withPrefixOnly;
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no2372 | 
			PlatypusCoreAliasStatement
				alias: (self withSuffix pltAt: no2372)
				statementsBlock: [ :curr3486 | 
					self inserted: false.
					PlatypusCoreRepeatStatement
						repeat: [ :noi2655 | 
							PlatypusCoreAliasStatement
								alias: (self cleaned pltAt: noi2655)
								statementsBlock: [ :curri4030 | 
									(PTsUpperizeFunction
										invokeFromValues:
											(OrderedCollection new
												add: (curr3486 prefixUsingContext: self class context);
												yourself))
										=
											(PTsUpperizeFunction
												invokeFromValues:
													(OrderedCollection new
														add: (curri4030 prefixUsingContext: self class context);
														yourself))
										ifTrue: [ 
											PltINSERTProcedure
												invokeFromValues:
													(OrderedCollection new
														add: self cleaned;
														add: curr3486;
														add: noi2655;
														yourself).
											self inserted: true.
											PlatypusExpressEscapeStatementException signal ] ] ]
						from:
							(PltLOINDEXFunction
								invokeFromValues:
									(OrderedCollection new
										add: self cleaned;
										yourself))
						to:
							(PltHIINDEXFunction
								invokeFromValues:
									(OrderedCollection new
										add: self cleaned;
										yourself)).
					self inserted = false
						ifTrue: [ self cleaned: (self cleaned pltPlus: curr3486) ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self withSuffix;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self withSuffix;
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no4049 | 
			PlatypusCoreAliasStatement
				alias: (self cleaned pltAt: no4049)
				statementsBlock: [ :curr1063 | self s: ((self s pltPlus: (curr1063 declarationUsingContext: self class context)) pltPlus: '\n') ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self cleaned;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self cleaned;
						yourself)).
	^ self return: self s


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> l [
	^ l


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> l: aListOfExChdAdaInterface [
	l := aListOfExChdAdaInterface
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> s [
	^ s


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> s: aString [
	s := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> withPrefixOnly [
	^ withPrefixOnly


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> withPrefixOnly: aListOfExChdAdaInterface1 [
	withPrefixOnly := aListOfExChdAdaInterface1
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface1 as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> withSuffix [
	^ withSuffix


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaInterfacesCodeFunction >> withSuffix: aListOfExChdAdaInterface [
	withSuffix := aListOfExChdAdaInterface
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaInterface as: OrderedCollection ]


]
