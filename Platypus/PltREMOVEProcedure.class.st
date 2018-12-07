"
<ISO10303-11-EXPRESS>
PROCEDURE REMOVE ( VAR PL : LIST OF GENERIC : gen; PP : INTEGER );
	(*#           
			| l p |
			l := self pL.
			p := self pP pltNativeValue.
			l removeAt: p	
		           #*) (*# <pharo>
			| l p |
			l := self pL.
			p := self pP.
			l removeAt: p	
		           #*);
END_PROCEDURE;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltREMOVEProcedure,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'pL',
		'pP'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltREMOVEProcedure class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltREMOVEProcedure class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltREMOVEProcedure class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltREMOVEProcedure class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltREMOVEProcedure >> fromValues: values [
  self pL: (values at: 1).
  self pP: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PltREMOVEProcedure >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | l p |
  l := self pL.
  p := self pP.
  l removeAt: p


]

{ #category : #'platypus-generated-accessing' }
PltREMOVEProcedure >> pL [
  ^pL


]

{ #category : #'platypus-generated-accessing' }
PltREMOVEProcedure >> pL: aListOfObject [
  pL := aListOfObject


]

{ #category : #'platypus-generated-accessing' }
PltREMOVEProcedure >> pL: aListOfObject pP: anInteger [
  self pL: aListOfObject.
  self pP: anInteger


]

{ #category : #'platypus-generated-accessing' }
PltREMOVEProcedure >> pP [
  ^pP


]

{ #category : #'platypus-generated-accessing' }
PltREMOVEProcedure >> pP: anInteger [
  pP := anInteger


]
