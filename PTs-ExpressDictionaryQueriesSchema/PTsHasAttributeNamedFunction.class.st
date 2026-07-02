Class {
	#name : #PTsHasAttributeNamedFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'e',
		'name'
	],
	#category : #'PTs-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsHasAttributeNamedFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsHasAttributeNamedFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsHasAttributeNamedFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsHasAttributeNamedFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsHasAttributeNamedFunction >> e [
	^ e


]

{ #category : #'platypus-generated-accessing' }
PTsHasAttributeNamedFunction >> e: aPTsEntityDefinition [
	e := aPTsEntityDefinition


]

{ #category : #'platypus-generated-accessing' }
PTsHasAttributeNamedFunction >> e: aPTsEntityDefinition name: aString [
	self e: aPTsEntityDefinition.
	self name: aString


]

{ #category : #'platypus-generated-accessing' }
PTsHasAttributeNamedFunction >> fromValues: values [
	self e: (values at: 1).
	self name: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PTsHasAttributeNamedFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			(PltEXISTSFunction
				invokeFromValues:
					(OrderedCollection new
						add:
								(PTsAttributeNamedFromFunction
										invokeFromValues:
											(OrderedCollection new
												add: self e;
												add: self name;
												yourself));
						yourself))


]

{ #category : #'platypus-generated-accessing' }
PTsHasAttributeNamedFunction >> name [
	^ name


]

{ #category : #'platypus-generated-accessing' }
PTsHasAttributeNamedFunction >> name: aString [
	name := aString


]
