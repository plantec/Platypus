Class {
	#name : #PTsStringAggregateConcatSeparatedByFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'l',
		'sep',
		's'
	],
	#category : #'Platypus-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsStringAggregateConcatSeparatedByFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsStringAggregateConcatSeparatedByFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsStringAggregateConcatSeparatedByFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsStringAggregateConcatSeparatedByFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsStringAggregateConcatSeparatedByFunction >> fromValues: values [
	self l: (values at: 1).
	self sep: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PTsStringAggregateConcatSeparatedByFunction >> invoke [
	" ---------- locals assignments ----------"

	self s: ''.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no3236 | 
			self s: (self s pltPlus: (self l pltAt: no3236)).
			no3236
				<
					(PltHIINDEXFunction
						invokeFromValues:
							(OrderedCollection new
								add: self l;
								yourself))
				ifTrue: [ self s: (self s pltPlus: self sep) ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self l;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self l;
						yourself)).
	^ self return: self s


]

{ #category : #'platypus-generated-accessing' }
PTsStringAggregateConcatSeparatedByFunction >> l [
	^ l


]

{ #category : #'platypus-generated-accessing' }
PTsStringAggregateConcatSeparatedByFunction >> l: aListOfString [
	l := aListOfString ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfString as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
PTsStringAggregateConcatSeparatedByFunction >> l: aListOfString sep: aString [
	self l: aListOfString.
	self sep: aString


]

{ #category : #'platypus-generated-accessing' }
PTsStringAggregateConcatSeparatedByFunction >> s [
	^ s


]

{ #category : #'platypus-generated-accessing' }
PTsStringAggregateConcatSeparatedByFunction >> s: aString [
	s := aString


]

{ #category : #'platypus-generated-accessing' }
PTsStringAggregateConcatSeparatedByFunction >> sep [
	^ sep


]

{ #category : #'platypus-generated-accessing' }
PTsStringAggregateConcatSeparatedByFunction >> sep: aString [
	sep := aString


]
