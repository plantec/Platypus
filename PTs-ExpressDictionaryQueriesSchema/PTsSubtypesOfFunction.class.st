Class {
	#name : #PTsSubtypesOfFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'ent',
		'allent'
	],
	#category : #'PTs-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsSubtypesOfFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsSubtypesOfFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsSubtypesOfFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsSubtypesOfFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsSubtypesOfFunction >> allent [
	^ allent


]

{ #category : #'platypus-generated-accessing' }
PTsSubtypesOfFunction >> allent: aListOfPTsEntityDefinition [
	allent := aListOfPTsEntityDefinition
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsEntityDefinition as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
PTsSubtypesOfFunction >> ent [
	^ ent


]

{ #category : #'platypus-generated-accessing' }
PTsSubtypesOfFunction >> ent: aPTsEntityDefinition [
	ent := aPTsEntityDefinition


]

{ #category : #'platypus-generated-accessing' }
PTsSubtypesOfFunction >> ent: aPTsEntityDefinition allent: aListOfPTsEntityDefinition [
	self ent: aPTsEntityDefinition.
	self allent: aListOfPTsEntityDefinition


]

{ #category : #'platypus-generated-accessing' }
PTsSubtypesOfFunction >> fromValues: values [
	self ent: (values at: 1).
	self allent: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PTsSubtypesOfFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			(self allent
				select: [ :e1992 | 
					(PltSIZEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add:
										((e1992 supertypesUsingContext: self class context)
												select: [ :ee3197 | (ee3197 refUsingContext: self class context) = self ent ]);
								yourself)) > 0 ])


]
