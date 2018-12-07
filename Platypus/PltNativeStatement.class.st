"
<ISO10303-11-EXPRESS>
ENTITY native_statement 
	SUBTYPE OF ( statement );
	source : native_algorithm;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNativeStatement,
	#superclass : #PltStatement,
	#instVars : [
		'source'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltNativeStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltNativeStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNativeStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNativeStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNativeStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNativeStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNativeStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltNativeStatement >> accept: aVisitor [
  ^aVisitor acceptNativeStatement: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltNativeStatement >> fastSetSource: aPltNativeAlgorithm [
  source := aPltNativeAlgorithm


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeStatement >> fromValues: values [
  ^self nativeStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltNativeStatement >> isPltNativeStatement [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeStatement >> localFromValues: values [
  ^self nativeStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeStatement >> localToValues: values [
  ^self nativeStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltNativeStatement >> nativeStatementCopyTo: another [
  another fastSetSource: self source


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeStatement >> nativeStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setSource: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeStatement >> nativeStatementToValues: values [
  values add: self source.
  ^values


]

{ #category : #'platypus-generated-copying' }
PltNativeStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltNativeStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self nativeStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltNativeStatement >> pltLocalCopyTo: another [
  self nativeStatementCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltNativeStatement >> setSource: aPltNativeAlgorithm [
  self source: aPltNativeAlgorithm


]

{ #category : #'platypus-generated-accessing' }
PltNativeStatement >> source [
  ^source


]

{ #category : #'platypus-generated-accessing' }
PltNativeStatement >> source: aPltNativeAlgorithm [
  source := aPltNativeAlgorithm


]

{ #category : #'platypus-generated-with-context-accessing' }
PltNativeStatement >> sourceUsingContext: aContext [
  ^self source


]

{ #category : #'platypus-generated-initializing' }
PltNativeStatement >> stepInitialize [
  super stepInitialize.
  source := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeStatement >> toValues: values [
  ^self nativeStatementToValues: (super toValues: values)


]
