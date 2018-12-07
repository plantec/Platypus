"
<ISO10303-11-EXPRESS>
FUNCTION VALUE_IN ( C : AGGREGATE OF GENERIC : gen; V : GENERIC : gen ) : LOGICAL;
	(*#            self signal: 'Value_in primitive is not implemented'.            #*) (*# <pharo> self signal: 'VALUE_IN primitive is not implemented'.            #*);
	RETURN ( ? );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltValueInFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'c',
		'v'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltValueInFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltValueInFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltValueInFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltValueInFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltValueInFunction >> c [
  ^c


]

{ #category : #'platypus-generated-accessing' }
PltValueInFunction >> c: aCollectionOfObject [
  c := aCollectionOfObject


]

{ #category : #'platypus-generated-accessing' }
PltValueInFunction >> c: aCollectionOfObject v: anObject [
  self c: aCollectionOfObject.
  self v: anObject


]

{ #category : #'platypus-generated-accessing' }
PltValueInFunction >> fromValues: values [
  self c: (values at: 1).
  self v: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PltValueInFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  self signal: 'VALUE_IN primitive is not implemented'.
  ^self return: nil


]

{ #category : #'platypus-generated-accessing' }
PltValueInFunction >> v [
  ^v


]

{ #category : #'platypus-generated-accessing' }
PltValueInFunction >> v: anObject [
  v := anObject


]
