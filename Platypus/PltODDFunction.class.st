"
<ISO10303-11-EXPRESS>
FUNCTION ODD ( P : INTEGER ) : BOOLEAN;
	(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltLogicalLiteral val: (v pltNativeValue) odd)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: v odd] 
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltODDFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltODDFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltODDFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltODDFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltODDFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltODDFunction >> fromValues: values [
  self p: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltODDFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | v |
  ^(v := self p) ifNotNil: [ self return: v odd ]


]

{ #category : #'platypus-generated-accessing' }
PltODDFunction >> p [
  ^p


]

{ #category : #'platypus-generated-accessing' }
PltODDFunction >> p: anInteger [
  p := anInteger


]
