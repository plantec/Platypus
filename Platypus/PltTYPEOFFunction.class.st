"
<ISO10303-11-EXPRESS>
FUNCTION TYPEOF ( P : GENERIC ) : SET OF STRING;
	(*#           
			| arg result |
			(arg := self p)
				ifMissing: [^ self return: arg]
				ifNotMissing: [
					result := PltSetInstance new.
					result contents: (PlatypusExpressTypeOfBuilder typeOfSetFor: arg computedDomain).
					^ self return: result]
		           #*) (*# <pharo>
			| arg result |
			(arg := self p)
				ifNil: [^ self return: arg]
				ifNotNil: [
					(arg isKindOf: PlatypusComplexInstance) 
						ifTrue: [result := OrderedCollection new.
							arg records do: [:rec | result addAll: (PlatypusExpressTypeOfBuilder typeOfSetFor: rec class platypusMetaData)]] 
						ifFalse: [result := (PlatypusExpressTypeOfBuilder typeOfSetFor: arg class platypusMetaData)].
					^ self return: (result collect: [:r | r val])]
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltTYPEOFFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltTYPEOFFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltTYPEOFFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltTYPEOFFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltTYPEOFFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltTYPEOFFunction >> fromValues: values [
  self p: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltTYPEOFFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | arg result |
  (arg := self p) ifNil: [ ^self return: arg ] ifNotNil: [ (arg isKindOf: PlatypusComplexInstance) ifTrue: [ result := OrderedCollection new.
              arg records do: [:rec |  result addAll: (PlatypusExpressTypeOfBuilder typeOfSetFor: rec class platypusMetaData) ] ] ifFalse: [ result := PlatypusExpressTypeOfBuilder typeOfSetFor: arg class platypusMetaData ].
        ^self return: (result collect: [:r |  r val ]) ]


]

{ #category : #'platypus-generated-accessing' }
PltTYPEOFFunction >> p [
  ^p


]

{ #category : #'platypus-generated-accessing' }
PltTYPEOFFunction >> p: anObject [
  p := anObject


]
