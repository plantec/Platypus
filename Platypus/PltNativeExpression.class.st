"
<ISO10303-11-EXPRESS>
ENTITY native_expression 
	SUBTYPE OF ( expression );
	source : native_algorithm;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNativeExpression,
	#superclass : #PltExpression,
	#instVars : [
		'source'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltNativeExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltNativeExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNativeExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNativeExpression class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNativeExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNativeExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNativeExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltNativeExpression >> accept: aVisitor [
  ^aVisitor acceptNativeExpression: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltNativeExpression >> fastSetSource: aPltNativeAlgorithm [
  source := aPltNativeAlgorithm


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeExpression >> fromValues: values [
  ^self nativeExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltNativeExpression >> isPltNativeExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeExpression >> localFromValues: values [
  ^self nativeExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeExpression >> localToValues: values [
  ^self nativeExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltNativeExpression >> nativeExpressionCopyTo: another [
  another fastSetSource: self source


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeExpression >> nativeExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setSource: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeExpression >> nativeExpressionToValues: values [
  values add: self source.
  ^values


]

{ #category : #'platypus-generated-copying' }
PltNativeExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltNativeExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self nativeExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltNativeExpression >> pltLocalCopyTo: another [
  self nativeExpressionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltNativeExpression >> setSource: aPltNativeAlgorithm [
  self source: aPltNativeAlgorithm


]

{ #category : #'platypus-generated-accessing' }
PltNativeExpression >> source [
  ^source


]

{ #category : #'platypus-generated-accessing' }
PltNativeExpression >> source: aPltNativeAlgorithm [
  source := aPltNativeAlgorithm


]

{ #category : #'platypus-generated-with-context-accessing' }
PltNativeExpression >> sourceUsingContext: aContext [
  ^self source


]

{ #category : #'platypus-generated-initializing' }
PltNativeExpression >> stepInitialize [
  super stepInitialize.
  source := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeExpression >> toValues: values [
  ^self nativeExpressionToValues: (super toValues: values)


]
