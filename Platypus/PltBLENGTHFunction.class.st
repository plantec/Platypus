"
<ISO10303-11-EXPRESS>
FUNCTION BLENGTH ( P : BINARY ) : INTEGER;
	(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltIntegerLiteral val: (v pltNativeValue) size)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v size)] 
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltBLENGTHFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltBLENGTHFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltBLENGTHFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltBLENGTHFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltBLENGTHFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltBLENGTHFunction >> fromValues: values [
  self p: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltBLENGTHFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | v |
  ^(v := self p) ifNotNil: [ self return: v size ]


]

{ #category : #'platypus-generated-accessing' }
PltBLENGTHFunction >> p [
  ^p


]

{ #category : #'platypus-generated-accessing' }
PltBLENGTHFunction >> p: aBinary [
  p := aBinary


]
