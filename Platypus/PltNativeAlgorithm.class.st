"
<ISO10303-11-EXPRESS>
ENTITY native_algorithm 
	SUBTYPE OF ( dictionary_instance );
	implementations : LIST OF native_code;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNativeAlgorithm,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'implementations'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltNativeAlgorithm class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltNativeAlgorithm class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNativeAlgorithm class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNativeAlgorithm class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNativeAlgorithm class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNativeAlgorithm class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNativeAlgorithm class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltNativeAlgorithm >> accept: aVisitor [
  ^aVisitor acceptNativeAlgorithm: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltNativeAlgorithm >> fastSetImplementations: aListOfPltNativeCode [
  implementations := aListOfPltNativeCode


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeAlgorithm >> fromValues: values [
  ^self nativeAlgorithmFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltNativeAlgorithm >> implementations [
  ^implementations


]

{ #category : #'platypus-generated-accessing' }
PltNativeAlgorithm >> implementations: aListOfPltNativeCode [
  implementations := aListOfPltNativeCode ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltNativeCode as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltNativeAlgorithm >> implementationsUsingContext: aContext [
  ^self implementations


]

{ #category : #'platypus-generated-classifying' }
PltNativeAlgorithm >> isPltNativeAlgorithm [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeAlgorithm >> localFromValues: values [
  ^self nativeAlgorithmFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeAlgorithm >> localToValues: values [
  ^self nativeAlgorithmToValues: values


]

{ #category : #'platypus-generated-copying' }
PltNativeAlgorithm >> nativeAlgorithmCopyTo: another [
  another fastSetImplementations: self implementations


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeAlgorithm >> nativeAlgorithmFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setImplementations: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeAlgorithm >> nativeAlgorithmToValues: values [
  values add: self implementations.
  ^values


]

{ #category : #'platypus-generated-copying' }
PltNativeAlgorithm >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltNativeAlgorithm >> pltCopyTo: another [
  super pltCopyTo: another.
  self nativeAlgorithmCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltNativeAlgorithm >> pltLocalCopyTo: another [
  self nativeAlgorithmCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltNativeAlgorithm >> setImplementations: aListOfPltNativeCode [
  self implementations: aListOfPltNativeCode


]

{ #category : #'platypus-generated-initializing' }
PltNativeAlgorithm >> stepInitialize [
  super stepInitialize.
  implementations := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeAlgorithm >> toValues: values [
  ^self nativeAlgorithmToValues: (super toValues: values)


]
