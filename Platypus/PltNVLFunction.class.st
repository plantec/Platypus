"
<ISO10303-11-EXPRESS>
FUNCTION NVL ( P : GENERIC : gen1; substitute : GENERIC : gen1 ) : GENERIC : gen1;
	(*#            | v | 
			(v := self p)
				ifMissing: [^ self return: (self substitute)]
				ifNotMissing: [^ self return: (v)]
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNil: [self return: self substitute] ifNotNil: [self return: v] 
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNVLFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p',
		'substitute'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltNVLFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNVLFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNVLFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNVLFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltNVLFunction >> fromValues: values [
  self p: (values at: 1).
  self substitute: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PltNVLFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | v |
  ^(v := self p) ifNil: [ self return: self substitute ] ifNotNil: [ self return: v ]


]

{ #category : #'platypus-generated-accessing' }
PltNVLFunction >> p [
  ^p


]

{ #category : #'platypus-generated-accessing' }
PltNVLFunction >> p: anObject [
  p := anObject


]

{ #category : #'platypus-generated-accessing' }
PltNVLFunction >> p: anObject substitute: anObject1 [
  self p: anObject.
  self substitute: anObject1


]

{ #category : #'platypus-generated-accessing' }
PltNVLFunction >> substitute [
  ^substitute


]

{ #category : #'platypus-generated-accessing' }
PltNVLFunction >> substitute: anObject1 [
  substitute := anObject1


]
