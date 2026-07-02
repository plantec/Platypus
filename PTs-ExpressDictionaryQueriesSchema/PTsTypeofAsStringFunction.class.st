Class {
	#name : #PTsTypeofAsStringFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'e'
	],
	#category : #'PTs-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsTypeofAsStringFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsTypeofAsStringFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsTypeofAsStringFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsTypeofAsStringFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsTypeofAsStringFunction >> e [
	^ e


]

{ #category : #'platypus-generated-accessing' }
PTsTypeofAsStringFunction >> e: aPTsEntityInstance [
	e := aPTsEntityInstance


]

{ #category : #'platypus-generated-accessing' }
PTsTypeofAsStringFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsTypeofAsStringFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			(('['
				pltPlus:
					(PTsStringAggregateConcatSeparatedByFunction
						invokeFromValues:
							(OrderedCollection new
								add:
										(PltTYPEOFFunction
												invokeFromValues:
													(OrderedCollection new
														add: self e;
														yourself));
								add: '; ';
								yourself))) pltPlus: ']')


]
