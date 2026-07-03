Class {
	#name : #PTsHasInheritedAttributeNamedFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'e',
		'name'
	],
	#category : #'Platypus-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsHasInheritedAttributeNamedFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsHasInheritedAttributeNamedFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsHasInheritedAttributeNamedFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsHasInheritedAttributeNamedFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsHasInheritedAttributeNamedFunction >> e [
	^ e


]

{ #category : #'platypus-generated-accessing' }
PTsHasInheritedAttributeNamedFunction >> e: aPTsEntityDefinition [
	e := aPTsEntityDefinition


]

{ #category : #'platypus-generated-accessing' }
PTsHasInheritedAttributeNamedFunction >> e: aPTsEntityDefinition name: aString [
	self e: aPTsEntityDefinition.
	self name: aString


]

{ #category : #'platypus-generated-accessing' }
PTsHasInheritedAttributeNamedFunction >> fromValues: values [
	self e: (values at: 1).
	self name: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PTsHasInheritedAttributeNamedFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			(PltEXISTSFunction
				invokeFromValues:
					(OrderedCollection new
						add:
								(PTsInheritedAttributeNamedFromFunction
										invokeFromValues:
											(OrderedCollection new
												add: self e;
												add: self name;
												yourself));
						yourself))


]

{ #category : #'platypus-generated-accessing' }
PTsHasInheritedAttributeNamedFunction >> name [
	^ name


]

{ #category : #'platypus-generated-accessing' }
PTsHasInheritedAttributeNamedFunction >> name: aString [
	name := aString


]
