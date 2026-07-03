Class {
	#name : #PTsNumberedNameFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'nb',
		'prefix',
		'suffix',
		'nbstr',
		'posFirst'
	],
	#category : #'Platypus-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsNumberedNameFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsNumberedNameFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsNumberedNameFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsNumberedNameFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsNumberedNameFunction >> fromValues: values [
	self nb: (values at: 1).
	self prefix: (values at: 2).
	self suffix: (values at: 3)


]

{ #category : #'platypus-generated-invoking' }
PTsNumberedNameFunction >> invoke [
	" ---------- locals assignments ----------"

	self
		nbstr:
			(PltFORMATFunction
				invokeFromValues:
					(OrderedCollection new
						add: self nb;
						add: '07I';
						yourself)).
	self posFirst: 0.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		untilControlBlock: [ :no3643 | (self nbstr pltAt: no3643) ~= '0' ]
		repeat: [ :no3643 | self posFirst: no3643 ]
		from: 2
		to:
			(PltLENGTHFunction
				invokeFromValues:
					(OrderedCollection new
						add: self nbstr;
						yourself)).
	^ self
		return:
			((self prefix
				pltPlus:
					(self nbstr
						pltCopyFrom: self posFirst
						to:
							(PltLENGTHFunction
								invokeFromValues:
									(OrderedCollection new
										add: self nbstr;
										yourself)))) pltPlus: self suffix)


]

{ #category : #'platypus-generated-accessing' }
PTsNumberedNameFunction >> nb [
	^ nb


]

{ #category : #'platypus-generated-accessing' }
PTsNumberedNameFunction >> nb: anInteger [
	nb := anInteger


]

{ #category : #'platypus-generated-accessing' }
PTsNumberedNameFunction >> nb: anInteger prefix: aString suffix: aString1 [
	self nb: anInteger.
	self prefix: aString.
	self suffix: aString1


]

{ #category : #'platypus-generated-accessing' }
PTsNumberedNameFunction >> nbstr [
	^ nbstr


]

{ #category : #'platypus-generated-accessing' }
PTsNumberedNameFunction >> nbstr: aString [
	nbstr := aString


]

{ #category : #'platypus-generated-accessing' }
PTsNumberedNameFunction >> posFirst [
	^ posFirst


]

{ #category : #'platypus-generated-accessing' }
PTsNumberedNameFunction >> posFirst: anInteger [
	posFirst := anInteger


]

{ #category : #'platypus-generated-accessing' }
PTsNumberedNameFunction >> prefix [
	^ prefix


]

{ #category : #'platypus-generated-accessing' }
PTsNumberedNameFunction >> prefix: aString [
	prefix := aString


]

{ #category : #'platypus-generated-accessing' }
PTsNumberedNameFunction >> suffix [
	^ suffix


]

{ #category : #'platypus-generated-accessing' }
PTsNumberedNameFunction >> suffix: aString1 [
	suffix := aString1


]
