Class {
	#name : #PTsSchemaDefinitionOfFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'e'
	],
	#category : #'Platypus-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsSchemaDefinitionOfFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsSchemaDefinitionOfFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsSchemaDefinitionOfFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsSchemaDefinitionOfFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsSchemaDefinitionOfFunction >> e [
	^ e


]

{ #category : #'platypus-generated-accessing' }
PTsSchemaDefinitionOfFunction >> e: aPTsDictionaryInstance [
	e := aPTsDictionaryInstance


]

{ #category : #'platypus-generated-accessing' }
PTsSchemaDefinitionOfFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsSchemaDefinitionOfFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self e;
				yourself)) includes: 'PLATYPUS_DICTIONARY_SCHEMA.SCHEMA_DEFINITION')
		ifTrue: [ ^ self return: self e ].
	^ self
		return:
			(PTsSchemaDefinitionOfFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self e ownerUsingContext: self class context);
						yourself))


]
