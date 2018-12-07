"
<ISO10303-11-EXPRESS>
FUNCTION HIINDEX ( P : AGGREGATE OF GENERIC ) : INTEGER;
	(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [((v := v pltNativeValue) isPltArray)
						ifTrue: [^ self return: (v upperBound)]
						ifFalse: [^ self return: (PltIntegerLiteral val: ( v pltNativeValue ) size)]]
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v upperBound)] 
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltHIINDEXFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltHIINDEXFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltHIINDEXFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltHIINDEXFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltHIINDEXFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltHIINDEXFunction >> fromValues: values [
  self p: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltHIINDEXFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | v |
  ^(v := self p) ifNotNil: [ self return: v upperBound ]


]

{ #category : #'platypus-generated-accessing' }
PltHIINDEXFunction >> p [
  ^p


]

{ #category : #'platypus-generated-accessing' }
PltHIINDEXFunction >> p: aCollectionOfObject [
  p := aCollectionOfObject


]
