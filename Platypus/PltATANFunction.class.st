"
<ISO10303-11-EXPRESS>
FUNCTION ATAN ( V1 : NUMBER; V2 : NUMBER ) : REAL;
	(*#            | v |
			(v := self v1)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) arcTan)] 
		           #*) (*# <pharo> | v |
			^ (v := self v1) ifNotNil: [self return: (v arcTan)] 
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltATANFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'v1',
		'v2'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltATANFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltATANFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltATANFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltATANFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltATANFunction >> fromValues: values [
  self v1: (values at: 1).
  self v2: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PltATANFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | v |
  ^(v := self v1) ifNotNil: [ self return: v arcTan ]


]

{ #category : #'platypus-generated-accessing' }
PltATANFunction >> v1 [
  ^v1


]

{ #category : #'platypus-generated-accessing' }
PltATANFunction >> v1: aNumber [
  v1 := aNumber


]

{ #category : #'platypus-generated-accessing' }
PltATANFunction >> v1: aNumber v2: aNumber1 [
  self v1: aNumber.
  self v2: aNumber1


]

{ #category : #'platypus-generated-accessing' }
PltATANFunction >> v2 [
  ^v2


]

{ #category : #'platypus-generated-accessing' }
PltATANFunction >> v2: aNumber1 [
  v2 := aNumber1


]
