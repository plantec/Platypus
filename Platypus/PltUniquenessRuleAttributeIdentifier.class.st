"
<ISO10303-11-EXPRESS>
ENTITY uniqueness_rule_attribute_identifier 
	SUBTYPE OF ( identifier );
	group_ref_name : OPTIONAL STRING;
	SELF\identifier.ref : attribute;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltUniquenessRuleAttributeIdentifier,
	#superclass : #PltIdentifier,
	#instVars : [
		'groupRefName'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltUniquenessRuleAttributeIdentifier class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltUniquenessRuleAttributeIdentifier class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUniquenessRuleAttributeIdentifier class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUniquenessRuleAttributeIdentifier class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUniquenessRuleAttributeIdentifier class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltUniquenessRuleAttributeIdentifier class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltUniquenessRuleAttributeIdentifier class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltUniquenessRuleAttributeIdentifier >> accept: aVisitor [
  ^aVisitor acceptUniquenessRuleAttributeIdentifier: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltUniquenessRuleAttributeIdentifier >> fastSetGroupRefName: aString [
  groupRefName := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltUniquenessRuleAttributeIdentifier >> fastSetRef: aPltAttribute [
  ref := aPltAttribute


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRuleAttributeIdentifier >> fromValues: values [
  ^self uniquenessRuleAttributeIdentifierFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltUniquenessRuleAttributeIdentifier >> groupRefName [
  ^groupRefName


]

{ #category : #'platypus-generated-accessing' }
PltUniquenessRuleAttributeIdentifier >> groupRefName: aString [
  groupRefName := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRuleAttributeIdentifier >> groupRefName: aString ref: aPltAttribute [ 	self setGroupRefName:aString.	self setRef:aPltAttribute.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltUniquenessRuleAttributeIdentifier >> groupRefNameUsingContext: aContext [
  ^self groupRefName


]

{ #category : #'platypus-generated-classifying' }
PltUniquenessRuleAttributeIdentifier >> isPltUniquenessRuleAttributeIdentifier [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRuleAttributeIdentifier >> localFromValues: values [
  ^self uniquenessRuleAttributeIdentifierFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRuleAttributeIdentifier >> localToValues: values [
  ^self uniquenessRuleAttributeIdentifierToValues: values


]

{ #category : #'platypus-generated-copying' }
PltUniquenessRuleAttributeIdentifier >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltUniquenessRuleAttributeIdentifier >> pltCopyTo: another [
  super pltCopyTo: another.
  self uniquenessRuleAttributeIdentifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltUniquenessRuleAttributeIdentifier >> pltLocalCopyTo: another [
  self uniquenessRuleAttributeIdentifierCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltUniquenessRuleAttributeIdentifier >> ref [
  ^ref


]

{ #category : #'platypus-generated-accessing' }
PltUniquenessRuleAttributeIdentifier >> ref: aPltAttribute [
  ref := aPltAttribute


]

{ #category : #'platypus-generated-with-context-accessing' }
PltUniquenessRuleAttributeIdentifier >> refUsingContext: aContext [
  ^self ref


]

{ #category : #'platypus-generated-set-accessing' }
PltUniquenessRuleAttributeIdentifier >> setGroupRefName: aString [
  self groupRefName: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltUniquenessRuleAttributeIdentifier >> setRef: aPltAttribute [
  self ref: aPltAttribute


]

{ #category : #'platypus-generated-initializing' }
PltUniquenessRuleAttributeIdentifier >> stepInitialize [
  super stepInitialize.
  groupRefName := nil.
  ref := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRuleAttributeIdentifier >> toValues: values [
  ^self uniquenessRuleAttributeIdentifierToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
PltUniquenessRuleAttributeIdentifier >> uniquenessRuleAttributeIdentifierCopyTo: another [
  another fastSetGroupRefName: self groupRefName.
  another fastSetRef: self ref


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRuleAttributeIdentifier >> uniquenessRuleAttributeIdentifierFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setGroupRefName: valuesloc removeFirst.
  self setRef: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltUniquenessRuleAttributeIdentifier >> uniquenessRuleAttributeIdentifierToValues: values [
  values add: self groupRefName.
  values add: self ref.
  ^values


]
