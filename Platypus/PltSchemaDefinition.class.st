"
<ISO10303-11-EXPRESS>
ENTITY schema_definition 
	SUBTYPE OF ( context_definition );
	global_rules : LIST OF global_rule;
	interface : LIST OF external_schema;
	remark_references : LIST OF remark_reference;
DERIVE
	accepted : entity_instance := SELF.accept_schema_definition;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSchemaDefinition,
	#superclass : #PltContextDefinition,
	#instVars : [
		'mappings',
		'globalRules',
		'remarkReferences',
		'interface'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSchemaDefinition class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSchemaDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSchemaDefinition class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSchemaDefinition class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSchemaDefinition class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSchemaDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSchemaDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSchemaDefinition >> accept: aVisitor [
  ^aVisitor acceptSchemaDefinition: self


]

{ #category : #'platypus-generated-deriving' }
PltSchemaDefinition >> accepted [
  ^self acceptedUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
PltSchemaDefinition >> acceptedUsingContext: aContext [
  ^self acceptedUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
PltSchemaDefinition >> acceptedUsingContext: aContext receiver: aReceiver [
  ^aReceiver acceptSchemaDefinitionUsingContext: aContext


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSchemaDefinition >> fastSetGlobalRules: aListOfPltGlobalRule [
  globalRules := aListOfPltGlobalRule


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSchemaDefinition >> fastSetInterface: aListOfPltExternalSchema [
  interface := aListOfPltExternalSchema


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSchemaDefinition >> fastSetRemarkReferences: aListOfPltRemarkReference [
  remarkReferences := aListOfPltRemarkReference


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaDefinition >> fromValues: values [
  ^self schemaDefinitionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltSchemaDefinition >> globalRules [
  ^globalRules


]

{ #category : #'platypus-generated-accessing' }
PltSchemaDefinition >> globalRules: aListOfPltGlobalRule [
  globalRules := aListOfPltGlobalRule ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltGlobalRule as: OrderedCollection ]


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaDefinition >> globalRules: aListOfPltGlobalRule interface: aListOfPltExternalSchema remarkReferences: aListOfPltRemarkReference [ 	self setGlobalRules:aListOfPltGlobalRule.	self setInterface:aListOfPltExternalSchema.	self setRemarkReferences:aListOfPltRemarkReference.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSchemaDefinition >> globalRulesUsingContext: aContext [
  ^self globalRules


]

{ #category : #'platypus-generated-accessing' }
PltSchemaDefinition >> interface [
  ^interface


]

{ #category : #'platypus-generated-accessing' }
PltSchemaDefinition >> interface: aListOfPltExternalSchema [
  interface := aListOfPltExternalSchema ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltExternalSchema as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSchemaDefinition >> interfaceUsingContext: aContext [
  ^self interface


]

{ #category : #'platypus-generated-classifying' }
PltSchemaDefinition >> isPltSchemaDefinition [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaDefinition >> localFromValues: values [
  ^self schemaDefinitionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaDefinition >> localToValues: values [
  ^self schemaDefinitionToValues: values


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSchemaDefinition >> mappingsUsingContext:aContext [	^ self mappings


]

{ #category : #'platypus-generated-copying' }
PltSchemaDefinition >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSchemaDefinition >> pltCopyTo: another [
  super pltCopyTo: another.
  self schemaDefinitionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSchemaDefinition >> pltLocalCopyTo: another [
  self schemaDefinitionCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltSchemaDefinition >> remarkReferences [
  ^remarkReferences


]

{ #category : #'platypus-generated-accessing' }
PltSchemaDefinition >> remarkReferences: aListOfPltRemarkReference [
  remarkReferences := aListOfPltRemarkReference ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltRemarkReference as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSchemaDefinition >> remarkReferencesUsingContext: aContext [
  ^self remarkReferences


]

{ #category : #'platypus-generated-copying' }
PltSchemaDefinition >> schemaDefinitionCopyTo: another [
  another fastSetGlobalRules: self globalRules.
  another fastSetInterface: self interface.
  another fastSetRemarkReferences: self remarkReferences


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaDefinition >> schemaDefinitionFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setGlobalRules: valuesloc removeFirst.
  self setInterface: valuesloc removeFirst.
  self setRemarkReferences: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaDefinition >> schemaDefinitionToValues: values [
  values add: self globalRules.
  values add: self interface.
  values add: self remarkReferences.
  ^values


]

{ #category : #'platypus-generated-set-accessing' }
PltSchemaDefinition >> setGlobalRules: aListOfPltGlobalRule [
  self globalRules: aListOfPltGlobalRule


]

{ #category : #'platypus-generated-set-accessing' }
PltSchemaDefinition >> setInterface: aListOfPltExternalSchema [
  self interface: aListOfPltExternalSchema


]

{ #category : #'platypus-generated-set-accessing' }
PltSchemaDefinition >> setRemarkReferences: aListOfPltRemarkReference [
  self remarkReferences: aListOfPltRemarkReference


]

{ #category : #'platypus-generated-initializing' }
PltSchemaDefinition >> stepInitialize [
  super stepInitialize.
  globalRules := OrderedCollection new.
  interface := OrderedCollection new.
  remarkReferences := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltSchemaDefinition >> toValues: values [
  ^self schemaDefinitionToValues: (super toValues: values)


]
