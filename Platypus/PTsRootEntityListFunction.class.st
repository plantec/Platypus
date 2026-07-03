Class {
	#name : 'PTsRootEntityListFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'entities',
		'l'
	],
	#category : 'Platypus-ExpressDictionaryQueriesSchema',
	#package : 'Platypus',
	#tag : 'ExpressDictionaryQueriesSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
PTsRootEntityListFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
PTsRootEntityListFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
PTsRootEntityListFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
PTsRootEntityListFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : 'platypus-generated-accessing' }
PTsRootEntityListFunction >> entities [
	^ entities


]

{ #category : 'platypus-generated-accessing' }
PTsRootEntityListFunction >> entities: aListOfPTsEntityDefinition [
	entities := aListOfPTsEntityDefinition
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsEntityDefinition as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
PTsRootEntityListFunction >> fromValues: values [
	self entities: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
PTsRootEntityListFunction >> invoke [
	" ---------- locals assignments ----------"

	self l: Array new.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no1249 | 
			PlatypusCoreAliasStatement
				alias: (self entities pltAt: no1249)
				statementsBlock: [ :ent3532 | 
					(PltSIZEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: (ent3532 supertypesUsingContext: self class context);
								yourself)) = 0
						ifTrue: [ 
							PltINSERTProcedure
								invokeFromValues:
									(OrderedCollection new
										add: self l;
										add: ent3532;
										add:
												(PltSIZEOFFunction
														invokeFromValues:
															(OrderedCollection new
																add: self l;
																yourself));
										yourself) ]
						ifFalse: [ 
							PlatypusCoreAliasStatement
								alias: (((ent3532 supertypesUsingContext: self class context) pltAt: 1) refUsingContext: self class context)
								statementsBlock: [ :sup414 | 
									(sup414 ownerUsingContext: self class context) ~~ (ent3532 ownerUsingContext: self class context)
										ifTrue: [ 
											PltINSERTProcedure
												invokeFromValues:
													(OrderedCollection new
														add: self l;
														add: ent3532;
														add:
																(PltSIZEOFFunction
																		invokeFromValues:
																			(OrderedCollection new
																				add: self l;
																				yourself));
														yourself) ] ] ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self entities;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self entities;
						yourself)).
	^ self return: self l


]

{ #category : 'platypus-generated-accessing' }
PTsRootEntityListFunction >> l [
	^ l


]

{ #category : 'platypus-generated-accessing' }
PTsRootEntityListFunction >> l: aListOfPTsEntityDefinition [
	l := aListOfPTsEntityDefinition
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsEntityDefinition as: OrderedCollection ]


]
