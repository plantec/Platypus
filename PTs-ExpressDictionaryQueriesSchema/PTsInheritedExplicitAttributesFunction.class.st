Class {
	#name : #PTsInheritedExplicitAttributesFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'e',
		'attributes'
	],
	#category : #'PTs-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsInheritedExplicitAttributesFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsInheritedExplicitAttributesFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsInheritedExplicitAttributesFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsInheritedExplicitAttributesFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsInheritedExplicitAttributesFunction >> attributes [
	^ attributes


]

{ #category : #'platypus-generated-accessing' }
PTsInheritedExplicitAttributesFunction >> attributes: aListOfPTsAttribute [
	attributes := aListOfPTsAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsAttribute as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
PTsInheritedExplicitAttributesFunction >> e [
	^ e


]

{ #category : #'platypus-generated-accessing' }
PTsInheritedExplicitAttributesFunction >> e: aPTsEntityDefinition [
	e := aPTsEntityDefinition


]

{ #category : #'platypus-generated-accessing' }
PTsInheritedExplicitAttributesFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsInheritedExplicitAttributesFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		attributes:
			(PTsInheritedAttributesFunction
				invokeFromValues:
					(OrderedCollection new
						add: self e;
						yourself)).	" ---------- statements ----------"
	^ self
		return:
			(self attributes
				select: [ :a828 | 
					(PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: a828;
								yourself)) includes: 'PLATYPUS_DICTIONARY_SCHEMA.EXPLICIT_ATTRIBUTE' ])


]
