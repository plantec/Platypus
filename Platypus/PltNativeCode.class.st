"
<ISO10303-11-EXPRESS>
ENTITY native_code 
	SUBTYPE OF ( dictionary_instance );
	language_signature : STRING;
	code : STRING;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltNativeCode,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'interpreter',
		'code',
		'cachedMethod',
		'languageSignature'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltNativeCode class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltNativeCode class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNativeCode class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNativeCode class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltNativeCode class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltNativeCode class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltNativeCode class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltNativeCode >> accept: aVisitor [
  ^aVisitor acceptNativeCode: self


]

{ #category : #'platypus-generated-accessing' }
PltNativeCode >> code [
  ^code


]

{ #category : #'platypus-generated-accessing' }
PltNativeCode >> code: aString [
  code := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltNativeCode >> codeUsingContext: aContext [
  ^self code


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltNativeCode >> fastSetCode: aString [
  code := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltNativeCode >> fastSetLanguageSignature: aString [
  languageSignature := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeCode >> fromValues: values [
  ^self nativeCodeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltNativeCode >> interpreter [
	^ interpreter
]

{ #category : #'platypus-generated-accessing' }
PltNativeCode >> interpreter: anInterpreter [
	interpreter := anInterpreter 
]

{ #category : #'platypus-generated-classifying' }
PltNativeCode >> isPltNativeCode [
  ^true


]

{ #category : #'platypus-generated-accessing' }
PltNativeCode >> languageSignature [
  ^languageSignature


]

{ #category : #'platypus-generated-accessing' }
PltNativeCode >> languageSignature: aString [
  languageSignature := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeCode >> languageSignature: aString code: aString1 [ 	self setLanguageSignature:aString.	self setCode:aString1.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltNativeCode >> languageSignatureUsingContext: aContext [
  ^self languageSignature


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeCode >> localFromValues: values [
  ^self nativeCodeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeCode >> localToValues: values [
  ^self nativeCodeToValues: values


]

{ #category : #'platypus-generated-copying' }
PltNativeCode >> nativeCodeCopyTo: another [
  another fastSetLanguageSignature: self languageSignature.
  another fastSetCode: self code


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeCode >> nativeCodeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setLanguageSignature: valuesloc removeFirst.
  self setCode: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeCode >> nativeCodeToValues: values [
  values add: self languageSignature.
  values add: self code.
  ^values


]

{ #category : #'platypus-generated-copying' }
PltNativeCode >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltNativeCode >> pltCopyTo: another [
  super pltCopyTo: another.
  self nativeCodeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltNativeCode >> pltLocalCopyTo: another [
  self nativeCodeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltNativeCode >> setCode: aString [
  self code: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltNativeCode >> setLanguageSignature: aString [
  self languageSignature: aString


]

{ #category : #'platypus-generated-initializing' }
PltNativeCode >> stepInitialize [
  super stepInitialize.
  languageSignature := ''.
  code := ''


]

{ #category : #'platypus-generated-group-accessing' }
PltNativeCode >> toValues: values [
  ^self nativeCodeToValues: (super toValues: values)


]
