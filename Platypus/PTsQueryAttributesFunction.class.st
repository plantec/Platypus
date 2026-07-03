Class {
	#name : 'PTsQueryAttributesFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'ent',
		'attrKind',
		'withInherited',
		'withRedeclaring',
		'attributes'
	],
	#category : 'Platypus-ExpressDictionaryQueriesSchema',
	#package : 'Platypus',
	#tag : 'ExpressDictionaryQueriesSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsQueryAttributesFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsQueryAttributesFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsQueryAttributesFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsQueryAttributesFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsQueryAttributesFunction >> attrKind [
	^ attrKind


]

{ #category : 'platypus-generated-accessing' }
PTsQueryAttributesFunction >> attrKind: aString [
	attrKind := aString


]

{ #category : 'platypus-generated-accessing' }
PTsQueryAttributesFunction >> attributes [
	^ attributes


]

{ #category : 'platypus-generated-accessing' }
PTsQueryAttributesFunction >> attributes: aListOfPTsAttribute [
	attributes := aListOfPTsAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsAttribute as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
PTsQueryAttributesFunction >> ent [
	^ ent


]

{ #category : 'platypus-generated-accessing' }
PTsQueryAttributesFunction >> ent: aPTsEntityDefinition [
	ent := aPTsEntityDefinition


]

{ #category : 'platypus-generated-accessing' }
PTsQueryAttributesFunction >> ent: aPTsEntityDefinition attrKind: aString withInherited: aBoolean withRedeclaring: aBoolean1 [
	self ent: aPTsEntityDefinition.
	self attrKind: aString.
	self withInherited: aBoolean.
	self withRedeclaring: aBoolean1


]

{ #category : 'platypus-generated-accessing' }
PTsQueryAttributesFunction >> fromValues: values [
	self ent: (values at: 1).
	self attrKind: (values at: 2).
	self withInherited: (values at: 3).
	self withRedeclaring: (values at: 4)


]

{ #category : 'platypus-generated-invoking' }
PTsQueryAttributesFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	self withInherited
		ifTrue: [ 
			self
				attributes:
					(PTsInheritedAttributesFunction
						invokeFromValues:
							(OrderedCollection new
								add: self ent;
								yourself)) ]
		ifFalse: [ self attributes: (self ent attributesUsingContext: self class context) ].
	(PltEXISTSFunction
		invokeFromValues:
			(OrderedCollection new
				add: self attrKind;
				yourself))
		ifTrue: [ 
			self
				attributes:
					(self attributes
						select: [ :a3174 | 
							(PltTYPEOFFunction
								invokeFromValues:
									(OrderedCollection new
										add: a3174;
										yourself))
								includes:
									('PLATYPUS_DICTIONARY_SCHEMA.'
										pltPlus:
											(PTsUpperizeFunction
												invokeFromValues:
													(OrderedCollection new
														add: self attrKind;
														yourself))) ]) ].
	self withRedeclaring not
		ifTrue: [ 
			self
				attributes:
					(self attributes
						select: [ :a1298 | 
							(PltEXISTSFunction
								invokeFromValues:
									(OrderedCollection new
										add: (a1298 redeclaringUsingContext: self class context);
										yourself)) not ]) ].
	^ self return: self attributes


]

{ #category : 'platypus-generated-accessing' }
PTsQueryAttributesFunction >> withInherited [
	^ withInherited


]

{ #category : 'platypus-generated-accessing' }
PTsQueryAttributesFunction >> withInherited: aBoolean [
	withInherited := aBoolean


]

{ #category : 'platypus-generated-accessing' }
PTsQueryAttributesFunction >> withRedeclaring [
	^ withRedeclaring


]

{ #category : 'platypus-generated-accessing' }
PTsQueryAttributesFunction >> withRedeclaring: aBoolean1 [
	withRedeclaring := aBoolean1


]
