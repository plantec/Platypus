"
<ISO10303-11-EXPRESS>
FUNCTION VALUE_UNIQUE ( V : AGGREGATE OF GENERIC ) : LOGICAL;
	(*#            self signal: 'Value_unique primitive is not implemented'.            #*) (*# <pharo> self signal: 'VALUE_UNIQUE primitive is not implemented'.            #*);
	RETURN ( ? );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltValueUniqueFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'v'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltValueUniqueFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltValueUniqueFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltValueUniqueFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltValueUniqueFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltValueUniqueFunction >> fromValues: values [
  self v: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PltValueUniqueFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  self signal: 'VALUE_UNIQUE primitive is not implemented'.
  ^self return: nil


]

{ #category : #'platypus-generated-accessing' }
PltValueUniqueFunction >> v [
  ^v


]

{ #category : #'platypus-generated-accessing' }
PltValueUniqueFunction >> v: aCollectionOfObject [
  v := aCollectionOfObject


]
