"
<ISO10303-11-EXPRESS>
ENTITY anonymous_variable 
	SUBTYPE OF ( dictionary_instance );
	domain : parameter_type;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAnonymousVariable,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'domain'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAnonymousVariable class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAnonymousVariable class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAnonymousVariable class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAnonymousVariable class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAnonymousVariable class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAnonymousVariable class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAnonymousVariable class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAnonymousVariable >> accept: aVisitor [
  ^aVisitor acceptAnonymousVariable: self


]

{ #category : #'platypus-generated-copying' }
PltAnonymousVariable >> anonymousVariableCopyTo: another [
  another fastSetDomain: self domain


]

{ #category : #'platypus-generated-group-accessing' }
PltAnonymousVariable >> anonymousVariableFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setDomain: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAnonymousVariable >> anonymousVariableToValues: values [
  values add: self domain.
  ^values


]

{ #category : #'platypus-generated-accessing' }
PltAnonymousVariable >> domain [
  ^domain


]

{ #category : #'platypus-generated-accessing' }
PltAnonymousVariable >> domain: aPltParameterType [
  domain := aPltParameterType


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAnonymousVariable >> domainUsingContext: aContext [
  ^self domain


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAnonymousVariable >> fastSetDomain: aPltParameterType [
  domain := aPltParameterType


]

{ #category : #'platypus-generated-group-accessing' }
PltAnonymousVariable >> fromValues: values [
  ^self anonymousVariableFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAnonymousVariable >> isPltAnonymousVariable [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAnonymousVariable >> localFromValues: values [
  ^self anonymousVariableFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAnonymousVariable >> localToValues: values [
  ^self anonymousVariableToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAnonymousVariable >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAnonymousVariable >> pltCopyTo: another [
  super pltCopyTo: another.
  self anonymousVariableCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAnonymousVariable >> pltLocalCopyTo: another [
  self anonymousVariableCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltAnonymousVariable >> setDomain: aPltParameterType [
  self domain: aPltParameterType


]

{ #category : #'platypus-generated-initializing' }
PltAnonymousVariable >> stepInitialize [
  super stepInitialize.
  domain := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltAnonymousVariable >> toValues: values [
  ^self anonymousVariableToValues: (super toValues: values)


]
