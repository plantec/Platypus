"
<ISO10303-11-EXPRESS>
ENTITY algorithm_declaration 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( statements_container );
	formal_parameters : LIST OF parameter_definition;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAlgorithmDeclaration,
	#superclass : #PltStatementsContainer,
	#instVars : [
		'formalParameters'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAlgorithmDeclaration class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAlgorithmDeclaration class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAlgorithmDeclaration class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAlgorithmDeclaration class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAlgorithmDeclaration class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAlgorithmDeclaration class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAlgorithmDeclaration class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAlgorithmDeclaration >> accept: aVisitor [
  ^aVisitor acceptAlgorithmDeclaration: self


]

{ #category : #'platypus-generated-copying' }
PltAlgorithmDeclaration >> algorithmDeclarationCopyTo: another [
  another fastSetFormalParameters: self formalParameters


]

{ #category : #'platypus-generated-group-accessing' }
PltAlgorithmDeclaration >> algorithmDeclarationFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setFormalParameters: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAlgorithmDeclaration >> algorithmDeclarationToValues: values [
  values add: self formalParameters.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAlgorithmDeclaration >> fastSetFormalParameters: aListOfPltParameterDefinition [
  formalParameters := aListOfPltParameterDefinition


]

{ #category : #'platypus-generated-accessing' }
PltAlgorithmDeclaration >> formalParameters [
  ^formalParameters


]

{ #category : #'platypus-generated-accessing' }
PltAlgorithmDeclaration >> formalParameters: aListOfPltParameterDefinition [
  formalParameters := aListOfPltParameterDefinition ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltParameterDefinition as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAlgorithmDeclaration >> formalParametersUsingContext: aContext [
  ^self formalParameters


]

{ #category : #'platypus-generated-group-accessing' }
PltAlgorithmDeclaration >> fromValues: values [
  ^self algorithmDeclarationFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAlgorithmDeclaration >> isPltAlgorithmDeclaration [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAlgorithmDeclaration >> localFromValues: values [
  ^self algorithmDeclarationFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAlgorithmDeclaration >> localToValues: values [
  ^self algorithmDeclarationToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAlgorithmDeclaration >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAlgorithmDeclaration >> pltCopyTo: another [
  super pltCopyTo: another.
  self algorithmDeclarationCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAlgorithmDeclaration >> pltLocalCopyTo: another [
  self algorithmDeclarationCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltAlgorithmDeclaration >> setFormalParameters: aListOfPltParameterDefinition [
  self formalParameters: aListOfPltParameterDefinition


]

{ #category : #'platypus-generated-initializing' }
PltAlgorithmDeclaration >> stepInitialize [
  super stepInitialize.
  formalParameters := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltAlgorithmDeclaration >> toValues: values [
  ^self algorithmDeclarationToValues: (super toValues: values)


]
