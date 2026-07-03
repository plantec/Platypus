Class {
	#name : #PTsAllSupertypesOfFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'e',
		'res'
	],
	#category : #'Platypus-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsAllSupertypesOfFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsAllSupertypesOfFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsAllSupertypesOfFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsAllSupertypesOfFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsAllSupertypesOfFunction >> e [
	^ e


]

{ #category : #'platypus-generated-accessing' }
PTsAllSupertypesOfFunction >> e: aPTsEntityDefinition [
	e := aPTsEntityDefinition


]

{ #category : #'platypus-generated-accessing' }
PTsAllSupertypesOfFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsAllSupertypesOfFunction >> invoke [
	" ---------- locals assignments ----------"

	self res: Array new.	" ---------- statements ----------"
	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self e;
				yourself)) includes: 'PLATYPUS_DICTIONARY_SCHEMA.ENTITY_DEFINITION')
		ifTrue: [ 
			PlatypusCoreRepeatStatement
				repeat: [ :no1632 | 
					self
						res:
							((PTsAllSupertypesOfFunction
								invokeFromValues:
									(OrderedCollection new
										add: (((self e supertypesUsingContext: self class context) pltAt: no1632) refUsingContext: self class context);
										yourself)) pltPlus: self res) ]
				from:
					(PltLOINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self e supertypesUsingContext: self class context);
								yourself))
				to:
					(PltHIINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self e supertypesUsingContext: self class context);
								yourself)) ].
	self res: (self res pltPlus: self e).
	^ self return: self res


]

{ #category : #'platypus-generated-accessing' }
PTsAllSupertypesOfFunction >> res [
	^ res


]

{ #category : #'platypus-generated-accessing' }
PTsAllSupertypesOfFunction >> res: aListOfPTsEntityDefinition [
	res := aListOfPTsEntityDefinition
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsEntityDefinition as: OrderedCollection ]


]
