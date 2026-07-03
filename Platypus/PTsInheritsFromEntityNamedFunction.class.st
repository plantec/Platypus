Class {
	#name : #PTsInheritsFromEntityNamedFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'e',
		'supname',
		'key',
		'allsups'
	],
	#category : #'Platypus-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsInheritsFromEntityNamedFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsInheritsFromEntityNamedFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsInheritsFromEntityNamedFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsInheritsFromEntityNamedFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsInheritsFromEntityNamedFunction >> allsups [
	^ allsups


]

{ #category : #'platypus-generated-accessing' }
PTsInheritsFromEntityNamedFunction >> allsups: aListOfPTsEntityDefinition [
	allsups := aListOfPTsEntityDefinition
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsEntityDefinition as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
PTsInheritsFromEntityNamedFunction >> e [
	^ e


]

{ #category : #'platypus-generated-accessing' }
PTsInheritsFromEntityNamedFunction >> e: aPTsEntityDefinition [
	e := aPTsEntityDefinition


]

{ #category : #'platypus-generated-accessing' }
PTsInheritsFromEntityNamedFunction >> e: aPTsEntityDefinition supname: aString [
	self e: aPTsEntityDefinition.
	self supname: aString


]

{ #category : #'platypus-generated-accessing' }
PTsInheritsFromEntityNamedFunction >> fromValues: values [
	self e: (values at: 1).
	self supname: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PTsInheritsFromEntityNamedFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		key:
			(PTsUpperizeFunction
				invokeFromValues:
					(OrderedCollection new
						add: self supname;
						yourself)).
	self
		allsups:
			(PTsAllSupertypesOfFunction
				invokeFromValues:
					(OrderedCollection new
						add: self e;
						yourself)).	" ---------- statements ----------"
	^ self
		return:
			(PltSIZEOFFunction
				invokeFromValues:
					(OrderedCollection new
						add:
								(self allsups
										select: [ :i1300 | 
											(PTsUpperizeFunction
												invokeFromValues:
													(OrderedCollection new
														add: (i1300 nameUsingContext: self class context);
														yourself)) = self key ]);
						yourself)) > 0


]

{ #category : #'platypus-generated-accessing' }
PTsInheritsFromEntityNamedFunction >> key [
	^ key


]

{ #category : #'platypus-generated-accessing' }
PTsInheritsFromEntityNamedFunction >> key: aString [
	key := aString


]

{ #category : #'platypus-generated-accessing' }
PTsInheritsFromEntityNamedFunction >> supname [
	^ supname


]

{ #category : #'platypus-generated-accessing' }
PTsInheritsFromEntityNamedFunction >> supname: aString [
	supname := aString


]
