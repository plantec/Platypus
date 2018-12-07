"
<ISO10303-11-EXPRESS>
PROCEDURE INSERT ( VAR PL : LIST OF GENERIC : gen; PE : GENERIC : gen; PP : INTEGER );
	(*#           
			| l e p |
			l := self pL.
			e := self pE.
			p := self pP pltNativeValue.
			l pltAdd: e beforeIndex: p
		           #*) (*# <pharo>
			| l e p |
			l := self pL.
			e := self pE.
			p := self pP.
			p <= 0
				ifTrue: [l addFirst: e]
				ifFalse: [p >= l size
						ifTrue: [l addLast: e]
						ifFalse: [l add: e afterIndex: p]]
		           #*);
END_PROCEDURE;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltINSERTProcedure,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'pL',
		'pE',
		'pP'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltINSERTProcedure class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltINSERTProcedure class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltINSERTProcedure class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltINSERTProcedure class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltINSERTProcedure >> fromValues: values [
  self pL: (values at: 1).
  self pE: (values at: 2).
  self pP: (values at: 3)


]

{ #category : #'platypus-generated-invoking' }
PltINSERTProcedure >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | l e p |
  l := self pL.
  e := self pE.
  p := self pP.
  p <= 0 ifTrue: [ l addFirst: e ] ifFalse: [ p >= l size ifTrue: [ l addLast: e ] ifFalse: [ l add: e afterIndex: p ] ]


]

{ #category : #'platypus-generated-accessing' }
PltINSERTProcedure >> pE [
  ^pE


]

{ #category : #'platypus-generated-accessing' }
PltINSERTProcedure >> pE: anObject [
  pE := anObject


]

{ #category : #'platypus-generated-accessing' }
PltINSERTProcedure >> pL [
  ^pL


]

{ #category : #'platypus-generated-accessing' }
PltINSERTProcedure >> pL: aListOfObject [
  pL := aListOfObject


]

{ #category : #'platypus-generated-accessing' }
PltINSERTProcedure >> pL: aListOfObject pE: anObject pP: anInteger [
  self pL: aListOfObject.
  self pE: anObject.
  self pP: anInteger


]

{ #category : #'platypus-generated-accessing' }
PltINSERTProcedure >> pP [
  ^pP


]

{ #category : #'platypus-generated-accessing' }
PltINSERTProcedure >> pP: anInteger [
  pP := anInteger


]
