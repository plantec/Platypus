"
<ISO10303-11-EXPRESS>
FUNCTION LOG2 ( P : NUMBER ) : REAL;
	(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) log: 2)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v log: 2)] 
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltLOG2Function,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltLOG2Function class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLOG2Function class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltLOG2Function class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltLOG2Function class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltLOG2Function >> fromValues: values [
  self p: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltLOG2Function >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | v |
  ^(v := self p) ifNotNil: [ self return: (v log: 2) ]


]

{ #category : #'platypus-generated-accessing' }
PltLOG2Function >> p [
  ^p


]

{ #category : #'platypus-generated-accessing' }
PltLOG2Function >> p: aNumber [
  p := aNumber


]
