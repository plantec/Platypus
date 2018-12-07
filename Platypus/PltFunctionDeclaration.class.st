"
<ISO10303-11-EXPRESS>
ENTITY function_declaration 
	SUBTYPE OF ( algorithm_declaration );
	return_type : parameter_type;
DERIVE
	accepted : entity_instance := SELF.accept_function_declaration;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltFunctionDeclaration,
	#superclass : #PltAlgorithmDeclaration,
	#instVars : [
		'returnType'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltFunctionDeclaration class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltFunctionDeclaration class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFunctionDeclaration class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFunctionDeclaration class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltFunctionDeclaration class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltFunctionDeclaration class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltFunctionDeclaration class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltFunctionDeclaration >> accept: aVisitor [
  ^aVisitor acceptFunctionDeclaration: self


]

{ #category : #'platypus-generated-deriving' }
PltFunctionDeclaration >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltFunctionDeclaration >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltFunctionDeclaration >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptFunctionDeclarationUsingContext: aContext


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltFunctionDeclaration >> fastSetReturnType: aPltParameterType [
  returnType := aPltParameterType


]

{ #category : #'platypus-generated-group-accessing' }
PltFunctionDeclaration >> fromValues: values [
  ^self functionDeclarationFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltFunctionDeclaration >> functionDeclarationCopyTo: another [
  another fastSetReturnType: self returnType


]

{ #category : #'platypus-generated-group-accessing' }
PltFunctionDeclaration >> functionDeclarationFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setReturnType: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltFunctionDeclaration >> functionDeclarationToValues: values [
  values add: self returnType.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltFunctionDeclaration >> isPltFunctionDeclaration [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltFunctionDeclaration >> localFromValues: values [
  ^self functionDeclarationFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltFunctionDeclaration >> localToValues: values [
  ^self functionDeclarationToValues: values


]

{ #category : #'platypus-generated-copying' }
PltFunctionDeclaration >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltFunctionDeclaration >> pltCopyTo: another [
  super pltCopyTo: another.
  self functionDeclarationCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltFunctionDeclaration >> pltLocalCopyTo: another [
  self functionDeclarationCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltFunctionDeclaration >> returnType [
  ^returnType


]

{ #category : #'platypus-generated-accessing' }
PltFunctionDeclaration >> returnType: aPltParameterType [
  returnType := aPltParameterType


]

{ #category : #'platypus-generated-with-context-accessing' }
PltFunctionDeclaration >> returnTypeUsingContext: aContext [
  ^self returnType


]

{ #category : #'platypus-generated-set-accessing' }
PltFunctionDeclaration >> setReturnType: aPltParameterType [
  self returnType: aPltParameterType


]

{ #category : #'platypus-generated-initializing' }
PltFunctionDeclaration >> stepInitialize [
  super stepInitialize.
  returnType := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltFunctionDeclaration >> toValues: values [
  ^self functionDeclarationToValues: (super toValues: values)


]
