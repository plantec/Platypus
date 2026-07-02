Class {
	#name : #PTsAttributeNamedFromFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'e',
		'name',
		'key',
		'attributes'
	],
	#category : #'PTs-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsAttributeNamedFromFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsAttributeNamedFromFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsAttributeNamedFromFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsAttributeNamedFromFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeNamedFromFunction >> attributes [
	^ attributes


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeNamedFromFunction >> attributes: aListOfPTsAttribute [
	attributes := aListOfPTsAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsAttribute as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeNamedFromFunction >> e [
	^ e


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeNamedFromFunction >> e: aPTsEntityDefinition [
	e := aPTsEntityDefinition


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeNamedFromFunction >> e: aPTsEntityDefinition name: aString [
	self e: aPTsEntityDefinition.
	self name: aString


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeNamedFromFunction >> fromValues: values [
	self e: (values at: 1).
	self name: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PTsAttributeNamedFromFunction >> invoke [
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
			((self e attributesUsingContext: self class context)
				select: [ :a4008 | 
					(PTsUpperizeFunction
						invokeFromValues:
							(OrderedCollection new
								add: (a4008 nameUsingContext: self class context);
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

{ #category : #'platypus-generated-accessing' }
PTsAttributeNamedFromFunction >> key [
	^ key


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeNamedFromFunction >> key: aString [
	key := aString


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeNamedFromFunction >> name [
	^ name


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeNamedFromFunction >> name: aString [
	name := aString


]
