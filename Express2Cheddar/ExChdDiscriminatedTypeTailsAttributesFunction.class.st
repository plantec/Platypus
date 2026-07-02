"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_tails_attributes ( typ : discriminated_type ) : LIST OF attribute;
	LOCAL 
		union_attr : attribute := typ.union_attr;
		union_type : defined_type := union_attr.domain.handled;
		union_attributes : LIST OF attribute := inherited_explicit_attributes ( union_type );
		found : LIST OF attribute := [ ];
	END_LOCAL;

	REPEAT no := LOINDEX ( union_attributes ) TO HIINDEX ( union_attributes );

		ALIAS curr FOR union_attributes [ no];
			ALIAS handled FOR curr.domain.handled;
				found := found + inherited_explicit_attributes ( handled );
			END_ALIAS;
		END_ALIAS;
	END_REPEAT;
	RETURN ( found );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdDiscriminatedTypeTailsAttributesFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'typ',
		'unionAttr',
		'unionType',
		'unionAttributes',
		'found'
	],
	#category : #'Express2Cheddar-DiscriminatedTypeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeTailsAttributesFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeTailsAttributesFunction class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeTailsAttributesFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeTailsAttributesFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeTailsAttributesFunction >> found [
	^ found


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeTailsAttributesFunction >> found: aListOfExChdAttribute1 [
	found := aListOfExChdAttribute1
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute1 as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeTailsAttributesFunction >> fromValues: values [
	self typ: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdDiscriminatedTypeTailsAttributesFunction >> invoke [
	" ---------- locals assignments ----------"

	self unionAttr: (self typ unionAttrUsingContext: self class context).
	self unionType: ((self unionAttr domainUsingContext: self class context) handledUsingContext: self class context).
	self
		unionAttributes:
			(PTsInheritedExplicitAttributesFunction
				invokeFromValues:
					(OrderedCollection new
						add: self unionType;
						yourself)).
	self found: Array new.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no2877 | 
			PlatypusCoreAliasStatement
				alias: (self unionAttributes pltAt: no2877)
				statementsBlock: [ :curr3995 | 
					PlatypusCoreAliasStatement
						alias: ((curr3995 domainUsingContext: self class context) handledUsingContext: self class context)
						statementsBlock: [ :handled1188 | 
							self
								found:
									(self found
										pltPlus:
											(PTsInheritedExplicitAttributesFunction
												invokeFromValues:
													(OrderedCollection new
														add: handled1188;
														yourself))) ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self unionAttributes;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self unionAttributes;
						yourself)).
	^ self return: self found


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeTailsAttributesFunction >> typ [
	^ typ


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeTailsAttributesFunction >> typ: aExChdDiscriminatedType [
	typ := aExChdDiscriminatedType


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeTailsAttributesFunction >> unionAttr [
	^ unionAttr


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeTailsAttributesFunction >> unionAttr: aExChdAttribute [
	unionAttr := aExChdAttribute


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeTailsAttributesFunction >> unionAttributes [
	^ unionAttributes


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeTailsAttributesFunction >> unionAttributes: aListOfExChdAttribute [
	unionAttributes := aListOfExChdAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeTailsAttributesFunction >> unionType [
	^ unionType


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeTailsAttributesFunction >> unionType: aExChdDefinedType [
	unionType := aExChdDefinedType


]
