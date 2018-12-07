"
<ISO10303-11-EXPRESS>
ENTITY group_qualifier 
	SUBTYPE OF ( qualifier );
	group_name : STRING;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltGroupQualifier,
	#superclass : #PltQualifier,
	#instVars : [
		'groupName'
	],
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltGroupQualifier class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltGroupQualifier class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGroupQualifier class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGroupQualifier class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltGroupQualifier class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltGroupQualifier class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltGroupQualifier class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltGroupQualifier >> accept: aVisitor [
  ^aVisitor acceptGroupQualifier: self


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltGroupQualifier >> fastSetGroupName: aString [
  groupName := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupQualifier >> fromValues: values [
  ^self groupQualifierFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltGroupQualifier >> groupName [
  ^groupName


]

{ #category : #'platypus-generated-accessing' }
PltGroupQualifier >> groupName: aString [
  groupName := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltGroupQualifier >> groupNameUsingContext: aContext [
  ^self groupName


]

{ #category : #'platypus-generated-copying' }
PltGroupQualifier >> groupQualifierCopyTo: another [
  another fastSetGroupName: self groupName


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupQualifier >> groupQualifierFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setGroupName: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupQualifier >> groupQualifierToValues: values [
  values add: self groupName.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltGroupQualifier >> isPltGroupQualifier [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupQualifier >> localFromValues: values [
  ^self groupQualifierFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupQualifier >> localToValues: values [
  ^self groupQualifierToValues: values


]

{ #category : #'platypus-generated-copying' }
PltGroupQualifier >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltGroupQualifier >> pltCopyTo: another [
  super pltCopyTo: another.
  self groupQualifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltGroupQualifier >> pltLocalCopyTo: another [
  self groupQualifierCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltGroupQualifier >> setGroupName: aString [
  self groupName: aString


]

{ #category : #'platypus-generated-initializing' }
PltGroupQualifier >> stepInitialize [
  super stepInitialize.
  groupName := ''


]

{ #category : #'platypus-generated-group-accessing' }
PltGroupQualifier >> toValues: values [
  ^self groupQualifierToValues: (super toValues: values)


]
