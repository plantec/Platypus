"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_attributes ( d : discriminated_type ) : LIST OF attribute;
	LOCAL 
		other_attrs : LIST OF attribute := [ d.discriminant] + d.translated_attributes;
		tail_attrs : LIST OF explicit_attribute := discriminated_type_tails_attributes ( d );
		attrs : LIST OF attribute := other_attrs + tail_attrs;
	END_LOCAL;
	RETURN ( attrs );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdDiscriminatedTypeAttributesFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'd',
		'otherAttrs',
		'tailAttrs',
		'attrs'
	],
	#category : #'Express2Cheddar-DiscriminatedTypeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAttributesFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeAttributesFunction class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAttributesFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAttributesFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesFunction >> attrs [
	^ attrs


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesFunction >> attrs: aListOfExChdAttribute1 [
	attrs := aListOfExChdAttribute1
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute1 as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesFunction >> d [
	^ d


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesFunction >> d: aExChdDiscriminatedType [
	d := aExChdDiscriminatedType


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesFunction >> fromValues: values [
	self d: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdDiscriminatedTypeAttributesFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		otherAttrs:
			((PlatypusCoreAggregateInitializer
				collectionFrom:
					(OrderedCollection new
						add: (self d discriminantUsingContext: self class context);
						yourself)) pltPlus: (self d translatedAttributesUsingContext: self class context)).
	self
		tailAttrs:
			(ExChdDiscriminatedTypeTailsAttributesFunction
				invokeFromValues:
					(OrderedCollection new
						add: self d;
						yourself)).
	self attrs: (self otherAttrs pltPlus: self tailAttrs).	" ---------- statements ----------"
	^ self return: self attrs


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesFunction >> otherAttrs [
	^ otherAttrs


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesFunction >> otherAttrs: aListOfExChdAttribute [
	otherAttrs := aListOfExChdAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAttribute as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesFunction >> tailAttrs [
	^ tailAttrs


]

{ #category : #'platypus-generated-accessing' }
ExChdDiscriminatedTypeAttributesFunction >> tailAttrs: aListOfExChdExplicitAttribute [
	tailAttrs := aListOfExChdExplicitAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdExplicitAttribute as: OrderedCollection ]


]
