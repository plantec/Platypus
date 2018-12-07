"
<ISO10303-11-EXPRESS>
FUNCTION LOBOUND ( P : AGGREGATE OF GENERIC ) : INTEGER;
	(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [
					(v := v lowerBound)
						ifMissing: [^ self return: (PltIntegerLiteral val: 0)]
						ifNotMissing: [^ self return: v]].
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v lowerBound)] 
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltLOBOUNDFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltLOBOUNDFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltLOBOUNDFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltLOBOUNDFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltLOBOUNDFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltLOBOUNDFunction >> fromValues: values [
  self p: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltLOBOUNDFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | v |
  ^(v := self p) ifNotNil: [ self return: v lowerBound ]


]

{ #category : #'platypus-generated-accessing' }
PltLOBOUNDFunction >> p [
  ^p


]

{ #category : #'platypus-generated-accessing' }
PltLOBOUNDFunction >> p: aCollectionOfObject [
  p := aCollectionOfObject


]
