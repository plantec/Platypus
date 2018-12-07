"
<ISO10303-11-EXPRESS>
FUNCTION VALUE ( V : STRING ) : NUMBER;
	(*#            | param nb result |
			param := self v.
			param pltNativeValue isString
				ifTrue: [[nb := param pltNativeValue asNumber.
					result := nb isInteger
								ifTrue: [PltIntegerLiteral new]
								ifFalse: [PltRealLiteral new].
					result val: nb]
						on: Error
						do: [result := PltMissingValue new]]
				ifFalse: [result := PltMissingValue new].
			^ self return: result
		           #*) (*# <pharo> | param nb result |
			(param := self v) isString
				ifTrue: [[result := param asNumber]
						on: Error
						do: [result := nil]]
				ifFalse: [result := nil].
			^ self return: result
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltVALUEFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'v'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltVALUEFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltVALUEFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltVALUEFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltVALUEFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltVALUEFunction >> fromValues: values [
  self v: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltVALUEFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | param nb result |
  (param := self v) isString ifTrue: [ [ result := param asNumber ] on: Error do: [ result := nil ] ] ifFalse: [ result := nil ].
  ^self return: result


]

{ #category : #'platypus-generated-accessing' }
PltVALUEFunction >> v [
  ^v


]

{ #category : #'platypus-generated-accessing' }
PltVALUEFunction >> v: aString [
  v := aString


]
