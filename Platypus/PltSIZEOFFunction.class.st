"
<ISO10303-11-EXPRESS>
FUNCTION SIZEOF ( P : AGGREGATE OF GENERIC ) : INTEGER;
	(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltIntegerLiteral val: (v pltNativeValue) size)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: v size] 
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSIZEOFFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltSIZEOFFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSIZEOFFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSIZEOFFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSIZEOFFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltSIZEOFFunction >> fromValues: values [
  self p: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltSIZEOFFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | v |
  ^(v := self p) ifNotNil: [ self return: v size ]


]

{ #category : #'platypus-generated-accessing' }
PltSIZEOFFunction >> p [
  ^p


]

{ #category : #'platypus-generated-accessing' }
PltSIZEOFFunction >> p: aCollectionOfObject [
  p := aCollectionOfObject


]
