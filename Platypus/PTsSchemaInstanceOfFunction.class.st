Class {
	#name : 'PTsSchemaInstanceOfFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'e'
	],
	#category : 'Platypus-ExpressDictionaryQueriesSchema',
	#package : 'Platypus',
	#tag : 'ExpressDictionaryQueriesSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsSchemaInstanceOfFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsSchemaInstanceOfFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsSchemaInstanceOfFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsSchemaInstanceOfFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsSchemaInstanceOfFunction >> e [
	^ e


]

{ #category : 'platypus-generated-accessing' }
PTsSchemaInstanceOfFunction >> e: aPTsDictionaryInstance [
	e := aPTsDictionaryInstance


]

{ #category : 'platypus-generated-accessing' }
PTsSchemaInstanceOfFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
PTsSchemaInstanceOfFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			((PTsSchemaDefinitionOfFunction
				invokeFromValues:
					(OrderedCollection new
						add: self e;
						yourself)) ownerUsingContext: self class context)


]
