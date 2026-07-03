Class {
	#name : #PTsRemarksForFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'e',
		'sch',
		'remarks'
	],
	#category : #'Platypus-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsRemarksForFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsRemarksForFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsRemarksForFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsRemarksForFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsRemarksForFunction >> e [
	^ e


]

{ #category : #'platypus-generated-accessing' }
PTsRemarksForFunction >> e: aPTsDictionaryInstance [
	e := aPTsDictionaryInstance


]

{ #category : #'platypus-generated-accessing' }
PTsRemarksForFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsRemarksForFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		sch:
			(PTsSchemaDefinitionOfFunction
				invokeFromValues:
					(OrderedCollection new
						add: self e;
						yourself)).
	self remarks: Array new.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no3237 | 
			PlatypusCoreAliasStatement
				alias: ((self sch remarkReferencesUsingContext: self class context) pltAt: no3237)
				statementsBlock: [ :remref2185 | 
					((remref2185 referencedUsingContext: self class context) refUsingContext: self class context) == self e
						ifTrue: [ self remarks: (self remarks pltPlus: (remref2185 remarkUsingContext: self class context)) ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self sch remarkReferencesUsingContext: self class context);
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self sch remarkReferencesUsingContext: self class context);
						yourself)).
	^ self return: self remarks


]

{ #category : #'platypus-generated-accessing' }
PTsRemarksForFunction >> remarks [
	^ remarks


]

{ #category : #'platypus-generated-accessing' }
PTsRemarksForFunction >> remarks: aListOfPTsRemark [
	remarks := aListOfPTsRemark ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPTsRemark as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
PTsRemarksForFunction >> sch [
	^ sch


]

{ #category : #'platypus-generated-accessing' }
PTsRemarksForFunction >> sch: aPTsSchemaDefinition [
	sch := aPTsSchemaDefinition


]
