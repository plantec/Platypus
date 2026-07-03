Class {
	#name : 'PTsLocalRootSupertypeOfFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'e',
		'sups',
		'tmp'
	],
	#category : 'Platypus-ExpressDictionaryQueriesSchema',
	#package : 'Platypus',
	#tag : 'ExpressDictionaryQueriesSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsLocalRootSupertypeOfFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsLocalRootSupertypeOfFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsLocalRootSupertypeOfFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsLocalRootSupertypeOfFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsLocalRootSupertypeOfFunction >> e [
	^ e


]

{ #category : 'platypus-generated-accessing' }
PTsLocalRootSupertypeOfFunction >> e: aPTsEntityDefinition [
	e := aPTsEntityDefinition


]

{ #category : 'platypus-generated-accessing' }
PTsLocalRootSupertypeOfFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
PTsLocalRootSupertypeOfFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		sups:
			(PTsAllSupertypesOfFunction
				invokeFromValues:
					(OrderedCollection new
						add: self e;
						yourself)).	" ---------- statements ----------"
	self
		tmp:
			(self sups
				select: [ :s1561 | (s1561 ownerUsingContext: self class context) == (self e ownerUsingContext: self class context) ]).
	^ self
		return:
			(self tmp
				pltAt:
					(PltLOINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: self tmp;
								yourself)))


]

{ #category : 'platypus-generated-accessing' }
PTsLocalRootSupertypeOfFunction >> sups [
	^ sups


]

{ #category : 'platypus-generated-accessing' }
PTsLocalRootSupertypeOfFunction >> sups: aListOfPTsEntityDefinition [
	sups := aListOfPTsEntityDefinition
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsEntityDefinition as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
PTsLocalRootSupertypeOfFunction >> tmp [
	^ tmp


]

{ #category : 'platypus-generated-accessing' }
PTsLocalRootSupertypeOfFunction >> tmp: aListOfPTsEntityDefinition1 [
	tmp := aListOfPTsEntityDefinition1
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsEntityDefinition1 as: OrderedCollection ]


]
