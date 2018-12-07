"
<ISO10303-11-EXPRESS>
FUNCTION FORMAT ( PN : NUMBER; PF : STRING ) : STRING;
	(*#            | n f formatted |
			(n := self pN)
				ifMissing: [^ self return: n]
				ifNotMissing: [(f := self pF) 
					ifMissing: [^ self return: f]
					ifNotMissing: [formatted := PlatypusExpressBuiltinFormatFormatter format: n pltNativeValue sourceFormat: f pltNativeValue trimBoth.
						^ self return: (PltStringLiteral val: formatted)]]
		           #*) (*# <pharo> | n f formatted |
			(n := self pN)
				ifNil: [^ self return: n]
				ifNotNil: [(f := self pF) 
					ifNil: [^ self return: f]
					ifNotNil: [formatted := PlatypusExpressBuiltinFormatFormatter format: n sourceFormat: f trimBoth.
						^ self return: formatted]]
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltFORMATFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'pN',
		'pF'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltFORMATFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFORMATFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltFORMATFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltFORMATFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltFORMATFunction >> fromValues: values [
  self pN: (values at: 1).
  self pF: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PltFORMATFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | n f formatted |
  (n := self pN) ifNil: [ ^self return: n ] ifNotNil: [ (f := self pF) ifNil: [ ^self return: f ] ifNotNil: [ formatted := PlatypusExpressBuiltinFormatFormatter format: n sourceFormat: f trimBoth.
              ^self return: formatted ] ]


]

{ #category : #'platypus-generated-accessing' }
PltFORMATFunction >> pF [
  ^pF


]

{ #category : #'platypus-generated-accessing' }
PltFORMATFunction >> pF: aString [
  pF := aString


]

{ #category : #'platypus-generated-accessing' }
PltFORMATFunction >> pN [
  ^pN


]

{ #category : #'platypus-generated-accessing' }
PltFORMATFunction >> pN: aNumber [
  pN := aNumber


]

{ #category : #'platypus-generated-accessing' }
PltFORMATFunction >> pN: aNumber pF: aString [
  self pN: aNumber.
  self pF: aString


]
