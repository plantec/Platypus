"
<ISO10303-11-EXPRESS>
ENTITY procedure_declaration 
	SUBTYPE OF ( algorithm_declaration );
DERIVE
	accepted : entity_instance := SELF.accept_procedure_declaration;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltProcedureDeclaration,
	#superclass : #PltAlgorithmDeclaration,
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltProcedureDeclaration class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltProcedureDeclaration class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltProcedureDeclaration class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltProcedureDeclaration class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltProcedureDeclaration class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltProcedureDeclaration class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltProcedureDeclaration class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltProcedureDeclaration >> accept: aVisitor [
  ^aVisitor acceptProcedureDeclaration: self


]

{ #category : #'platypus-generated-deriving' }
PltProcedureDeclaration >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltProcedureDeclaration >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltProcedureDeclaration >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptProcedureDeclarationUsingContext: aContext


]

{ #category : #'platypus-generated-group-accessing' }
PltProcedureDeclaration >> fromValues: values [
  ^self procedureDeclarationFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltProcedureDeclaration >> isPltProcedureDeclaration [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltProcedureDeclaration >> localFromValues: values [
  ^self procedureDeclarationFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltProcedureDeclaration >> localToValues: values [
  ^self procedureDeclarationToValues: values


]

{ #category : #'platypus-generated-copying' }
PltProcedureDeclaration >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltProcedureDeclaration >> pltCopyTo: another [
  super pltCopyTo: another.
  self procedureDeclarationCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltProcedureDeclaration >> pltLocalCopyTo: another [
  self procedureDeclarationCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltProcedureDeclaration >> procedureDeclarationCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltProcedureDeclaration >> procedureDeclarationFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltProcedureDeclaration >> procedureDeclarationToValues: values [
  ^values


]

{ #category : #'platypus-generated-initializing' }
PltProcedureDeclaration >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltProcedureDeclaration >> toValues: values [
  ^self procedureDeclarationToValues: (super toValues: values)


]
