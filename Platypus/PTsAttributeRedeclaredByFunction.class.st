Class {
	#name : #PTsAttributeRedeclaredByFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'ent',
		'testedAttrPos',
		'attributes',
		'testedAttr'
	],
	#category : #'Platypus-ExpressDictionaryQueriesSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsAttributeRedeclaredByFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsAttributeRedeclaredByFunction class >> schemaDefinition [
	^ PTsExpressDictionaryQueriesSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsAttributeRedeclaredByFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsAttributeRedeclaredByFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeRedeclaredByFunction >> attributes [
	^ attributes


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeRedeclaredByFunction >> attributes: aListOfPTsAttribute [
	attributes := aListOfPTsAttribute
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfPTsAttribute as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeRedeclaredByFunction >> ent [
	^ ent


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeRedeclaredByFunction >> ent: aPTsEntityDefinition [
	ent := aPTsEntityDefinition


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeRedeclaredByFunction >> ent: aPTsEntityDefinition testedAttrPos: anInteger [
	self ent: aPTsEntityDefinition.
	self testedAttrPos: anInteger


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeRedeclaredByFunction >> fromValues: values [
	self ent: (values at: 1).
	self testedAttrPos: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PTsAttributeRedeclaredByFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		attributes:
			(PTsQueryAttributesFunction
				invokeFromValues:
					(OrderedCollection new
						add: self ent;
						add: nil;
						add: true;
						add: true;
						yourself)).
	self testedAttr: (self attributes pltAt: self testedAttrPos).	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no1974 | 
			PlatypusCoreAliasStatement
				alias: (self attributes pltAt: no1974)
				statementsBlock: [ :curr142 | 
					curr142 = self testedAttr
						ifTrue: [ 
							PlatypusCoreRepeatStatement
								repeat: [ :noi2451 | 
									PlatypusCoreAliasStatement
										alias: (self attributes pltAt: noi2451)
										statementsBlock: [ :curri1058 | 
											((PltEXISTSFunction
												invokeFromValues:
													(OrderedCollection new
														add: (curri1058 redeclaringUsingContext: self class context);
														yourself))
												and: [ ((curri1058 redeclaringUsingContext: self class context) refUsingContext: self class context) = curr142 ])
												ifTrue: [ ^ self return: curri1058 ] ] ]
								from: (no1974 pltPlus: 1)
								to:
									(PltHIINDEXFunction
										invokeFromValues:
											(OrderedCollection new
												add: self attributes;
												yourself)) ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self attributes;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self attributes;
						yourself)).
	^ self return: nil


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeRedeclaredByFunction >> testedAttr [
	^ testedAttr


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeRedeclaredByFunction >> testedAttr: aPTsAttribute [
	testedAttr := aPTsAttribute


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeRedeclaredByFunction >> testedAttrPos [
	^ testedAttrPos


]

{ #category : #'platypus-generated-accessing' }
PTsAttributeRedeclaredByFunction >> testedAttrPos: anInteger [
	testedAttrPos := anInteger


]
