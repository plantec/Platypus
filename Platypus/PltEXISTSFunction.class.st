"
<ISO10303-11-EXPRESS>
FUNCTION EXISTS ( P : GENERIC ) : BOOLEAN;
	(*#            
			(self p)
				ifMissing: [^ self return: (PltLogicalLiteral val: false) ]
				ifNotMissing: [^ self return: (PltLogicalLiteral val: true) ] 
		           #*) (*# <pharo> | v |
			^ (self return: self p notNil)
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltEXISTSFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltEXISTSFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltEXISTSFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltEXISTSFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltEXISTSFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltEXISTSFunction >> fromValues: values [
  self p: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltEXISTSFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | v |
  ^self return: self p notNil


]

{ #category : #'platypus-generated-accessing' }
PltEXISTSFunction >> p [
  ^p


]

{ #category : #'platypus-generated-accessing' }
PltEXISTSFunction >> p: anObject [
  p := anObject


]
