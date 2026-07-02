"
<ISO10303-11-EXPRESS>
FUNCTION derived_attribute_initialize ( attr : explicit_attribute ) : STRING;
	LOCAL 
		code : STRING;
		val : STRING;
		key : STRING := upperize ( attr.name );
	END_LOCAL;

	IF EXISTS ( attr.redeclaring ) THEN

		IF SIZEOF ( QUERY ( a <* inherited_explicit_attributes ( attr.owner ) | upperize ( a.name ) = key ) ) > 0 THEN
			val := basic_ada_type_value_format ( attr.assign, ? ).formated;
			code := 'obj.' + attr.name + ' := ' + val + ';';
		END_IF;
	END_IF;
	RETURN ( code );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdDerivedAttributeInitializeFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'attr',
		'code',
		'val',
		'key'
	],
	#category : #'Express2Cheddar-RecordAndClassSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdDerivedAttributeInitializeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDerivedAttributeInitializeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDerivedAttributeInitializeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDerivedAttributeInitializeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdDerivedAttributeInitializeFunction >> attr [
	^ attr


]

{ #category : #'platypus-generated-accessing' }
ExChdDerivedAttributeInitializeFunction >> attr: aExChdExplicitAttribute [
	attr := aExChdExplicitAttribute


]

{ #category : #'platypus-generated-accessing' }
ExChdDerivedAttributeInitializeFunction >> code [
	^ code


]

{ #category : #'platypus-generated-accessing' }
ExChdDerivedAttributeInitializeFunction >> code: aString [
	code := aString


]

{ #category : #'platypus-generated-accessing' }
ExChdDerivedAttributeInitializeFunction >> fromValues: values [
	self attr: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdDerivedAttributeInitializeFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		key:
			(PTsUpperizeFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self attr nameUsingContext: self class context);
						yourself)).	" ---------- statements ----------"
	(PltEXISTSFunction
		invokeFromValues:
			(OrderedCollection new
				add: (self attr redeclaringUsingContext: self class context);
				yourself))
		ifTrue: [ 
			(PltSIZEOFFunction
				invokeFromValues:
					(OrderedCollection new
						add:
								((PTsInheritedExplicitAttributesFunction
										invokeFromValues:
											(OrderedCollection new
												add: (self attr ownerUsingContext: self class context);
												yourself))
										select: [ :a3178 | 
											(PTsUpperizeFunction
												invokeFromValues:
													(OrderedCollection new
														add: (a3178 nameUsingContext: self class context);
														yourself)) = self key ]);
						yourself)) > 0
				ifTrue: [ 
					self
						val:
							((ExChdBasicAdaTypeValueFormat new
								basicAdaTypeValueFormatFromValues:
										(OrderedCollection new
												add: (self attr assignUsingContext: self class context);
												add: nil;
												yourself);
								yourself) formatedUsingContext: self class context).
					self
						code:
							(((('obj.' pltPlus: (self attr nameUsingContext: self class context)) pltPlus: ' := ') pltPlus: self val) pltPlus: ';') ] ].
	^ self return: self code


]

{ #category : #'platypus-generated-accessing' }
ExChdDerivedAttributeInitializeFunction >> key [
	^ key


]

{ #category : #'platypus-generated-accessing' }
ExChdDerivedAttributeInitializeFunction >> key: aString2 [
	key := aString2


]

{ #category : #'platypus-generated-accessing' }
ExChdDerivedAttributeInitializeFunction >> val [
	^ val


]

{ #category : #'platypus-generated-accessing' }
ExChdDerivedAttributeInitializeFunction >> val: aString1 [
	val := aString1


]
