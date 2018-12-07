"
<ISO10303-11-EXPRESS>
FUNCTION ROLESOF ( P : GENERIC ) : SET OF STRING;
	(*#           
			| arg result tmpResult |
			(arg := self p)
				ifMissing: [^ self return: arg]
				ifNotMissing: [result := PltSetInstance new.
					tmpResult := Set new.
					self
						dataDo: [:d | d rolesOf: arg in: tmpResult].
					result contents: tmpResult.
					^ self return: result]
		           #*) (*# <pharo>
			| arg result |
			(arg := self p)
				ifNil: [^ self return: arg]
				ifNotNil: [
					result := Set new.
					self
						dataDo: [:d | d rolesOf: arg in: result].
					^ self return: result]
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltROLESOFFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'p'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltROLESOFFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltROLESOFFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltROLESOFFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltROLESOFFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltROLESOFFunction >> fromValues: values [
  self p: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltROLESOFFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | arg result |
  (arg := self p) ifNil: [ ^self return: arg ] ifNotNil: [ result := Set new.
        self dataDo: [:d |  d rolesOf: arg in: result ].
        ^self return: result ]


]

{ #category : #'platypus-generated-accessing' }
PltROLESOFFunction >> p [
  ^p


]

{ #category : #'platypus-generated-accessing' }
PltROLESOFFunction >> p: anObject [
  p := anObject


]
