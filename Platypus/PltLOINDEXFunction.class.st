"
<ISO10303-11-EXPRESS>
FUNCTION LOINDEX ( P : AGGREGATE OF GENERIC ) : INTEGER;
	(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [((v := v pltNativeValue) isPltArray)
						ifTrue: [^ self return: (v lowerBound)]
						ifFalse: [^ self return: (PltIntegerLiteral val: 1)]]
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v lowerBound)] 
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltLOINDEXFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltLOINDEXFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLOINDEXFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltLOINDEXFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltLOINDEXFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltLOINDEXFunction >> fromValues: values [
  self p: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltLOINDEXFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | v |
  ^(v := self p) ifNotNil: [ self return: v lowerBound ]


]

{ #category : #'platypus-generated-accessing' }
PltLOINDEXFunction >> p [
  ^p


]

{ #category : #'platypus-generated-accessing' }
PltLOINDEXFunction >> p: aCollectionOfObject [
  p := aCollectionOfObject


]
