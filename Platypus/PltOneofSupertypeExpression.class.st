"
<ISO10303-11-EXPRESS>
ENTITY oneof_supertype_expression 
	SUBTYPE OF ( supertype_expression );
	expr_list : LIST OF supertype_expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltOneofSupertypeExpression,
	#superclass : #PltSupertypeExpression,
	#instVars : [
		'exprList'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltOneofSupertypeExpression class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltOneofSupertypeExpression class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltOneofSupertypeExpression class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltOneofSupertypeExpression class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltOneofSupertypeExpression class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltOneofSupertypeExpression class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltOneofSupertypeExpression class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltOneofSupertypeExpression >> accept: aVisitor [
  ^aVisitor acceptOneofSupertypeExpression: self


]

{ #category : #'platypus-generated-accessing' }
PltOneofSupertypeExpression >> exprList [
  ^exprList


]

{ #category : #'platypus-generated-accessing' }
PltOneofSupertypeExpression >> exprList: aListOfPltSupertypeExpression [
  exprList := aListOfPltSupertypeExpression ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltSupertypeExpression as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltOneofSupertypeExpression >> exprListUsingContext: aContext [
  ^self exprList


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltOneofSupertypeExpression >> fastSetExprList: aListOfPltSupertypeExpression [
  exprList := aListOfPltSupertypeExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltOneofSupertypeExpression >> fromValues: values [
  ^self oneofSupertypeExpressionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltOneofSupertypeExpression >> isPltOneofSupertypeExpression [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltOneofSupertypeExpression >> localFromValues: values [
  ^self oneofSupertypeExpressionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltOneofSupertypeExpression >> localToValues: values [
  ^self oneofSupertypeExpressionToValues: values


]

{ #category : #'platypus-generated-copying' }
PltOneofSupertypeExpression >> oneofSupertypeExpressionCopyTo: another [
  another fastSetExprList: self exprList


]

{ #category : #'platypus-generated-group-accessing' }
PltOneofSupertypeExpression >> oneofSupertypeExpressionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setExprList: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltOneofSupertypeExpression >> oneofSupertypeExpressionToValues: values [
  values add: self exprList.
  ^values


]

{ #category : #'platypus-generated-copying' }
PltOneofSupertypeExpression >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltOneofSupertypeExpression >> pltCopyTo: another [
  super pltCopyTo: another.
  self oneofSupertypeExpressionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltOneofSupertypeExpression >> pltLocalCopyTo: another [
  self oneofSupertypeExpressionCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltOneofSupertypeExpression >> setExprList: aListOfPltSupertypeExpression [
  self exprList: aListOfPltSupertypeExpression


]

{ #category : #'platypus-generated-initializing' }
PltOneofSupertypeExpression >> stepInitialize [
  super stepInitialize.
  exprList := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltOneofSupertypeExpression >> toValues: values [
  ^self oneofSupertypeExpressionToValues: (super toValues: values)


]
