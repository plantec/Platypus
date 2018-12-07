"
<ISO10303-11-EXPRESS>
FUNCTION HIBOUND ( P : AGGREGATE OF GENERIC ) : INTEGER;
	(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: v upperBound] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v upperBound)] 
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltHIBOUNDFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltHIBOUNDFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltHIBOUNDFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltHIBOUNDFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltHIBOUNDFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltHIBOUNDFunction >> fromValues: values [
  self p: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltHIBOUNDFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | v |
  ^(v := self p) ifNotNil: [ self return: v upperBound ]


]

{ #category : #'platypus-generated-accessing' }
PltHIBOUNDFunction >> p [
  ^p


]

{ #category : #'platypus-generated-accessing' }
PltHIBOUNDFunction >> p: aCollectionOfObject [
  p := aCollectionOfObject


]
