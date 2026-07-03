Class {
	#name : 'PTsInheritedAttributeNamedFromFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'e',
		'name',
		'key',
		'attributes'
	],
	#category : 'Platypus-ExpressDictionaryQueriesSchema',
	#package : 'Platypus',
	#tag : 'ExpressDictionaryQueriesSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsInheritedAttributeNamedFromFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsInheritedAttributeNamedFromFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsInheritedAttributeNamedFromFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsInheritedAttributeNamedFromFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributeNamedFromFunction >> attributes [
	^ attributes


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributeNamedFromFunction >> attributes: aListOfPTsAttribute [
	attributes := aListOfPTsAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsAttribute as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributeNamedFromFunction >> e [
	^ e


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributeNamedFromFunction >> e: aPTsEntityDefinition [
	e := aPTsEntityDefinition


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributeNamedFromFunction >> e: aPTsEntityDefinition name: aString [
	self e: aPTsEntityDefinition.
	self name: aString


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributeNamedFromFunction >> fromValues: values [
	self e: (values at: 1).
	self name: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
PTsInheritedAttributeNamedFromFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		key:
			(PTsUpperizeFunction
				invokeFromValues:
					(OrderedCollection new
						add: self name;
						yourself)).	" ---------- statements ----------"
	self
		attributes:
			((PTsInheritedAttributesFunction
				invokeFromValues:
					(OrderedCollection new
						add: self e;
						yourself))
				select: [ :a3851 | 
					(PTsUpperizeFunction
						invokeFromValues:
							(OrderedCollection new
								add: (a3851 nameUsingContext: self class context);
								yourself)) = self key ]).
	(PltSIZEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self attributes;
				yourself)) > 0
		ifTrue: [ 
			^ self
				return:
					(self attributes
						pltAt:
							(PltSIZEOFFunction
								invokeFromValues:
									(OrderedCollection new
										add: self attributes;
										yourself))) ]
		ifFalse: [ ^ self return: nil ]


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributeNamedFromFunction >> key [
	^ key


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributeNamedFromFunction >> key: aString [
	key := aString


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributeNamedFromFunction >> name [
	^ name


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributeNamedFromFunction >> name: aString [
	name := aString


]
