Class {
	#name : 'PTsInheritedAttributesFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'e',
		'res',
		'allsups'
	],
	#category : 'Platypus-ExpressDictionaryQueriesSchema',
	#package : 'Platypus',
	#tag : 'ExpressDictionaryQueriesSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsInheritedAttributesFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsInheritedAttributesFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsInheritedAttributesFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsInheritedAttributesFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributesFunction >> allsups [
	^ allsups


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributesFunction >> allsups: aListOfPTsEntityDefinition [
	allsups := aListOfPTsEntityDefinition
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsEntityDefinition as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributesFunction >> e [
	^ e


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributesFunction >> e: aPTsEntityDefinition [
	e := aPTsEntityDefinition


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributesFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
PTsInheritedAttributesFunction >> invoke [
	" ---------- locals assignments ----------"

	self res: Array new.
	self
		allsups:
			(PTsAllSupertypesOfFunction
				invokeFromValues:
					(OrderedCollection new
						add: self e;
						yourself)).	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no1523 | self res: (self res pltPlus: ((self allsups pltAt: no1523) attributesUsingContext: self class context)) ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self allsups;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self allsups;
						yourself)).
	^ self return: self res


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributesFunction >> res [
	^ res


]

{ #category : 'platypus-generated-accessing' }
PTsInheritedAttributesFunction >> res: aListOfPTsAttribute [
	res := aListOfPTsAttribute ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPTsAttribute as: OrderedCollection ]


]
