"
<ISO10303-11-EXPRESS>
ENTITY instance_scope 
	SUBTYPE OF ( session_instance );
	owned : LIST [ 1 : ? ] OF entity_instance;
	export_list : LIST [ 0 : ? ] OF entity_instance;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltInstanceScope,
	#superclass : #PltSessionInstance,
	#instVars : [
		'exportList',
		'owned'
	],
	#category : #'Platypus-PlatypusPopulationSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltInstanceScope class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstanceScope class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstanceScope class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstanceScope class >> schemaDefinition [
  ^PltPlatypusPopulationSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltInstanceScope class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstanceScope class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltInstanceScope class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltInstanceScope >> accept: aVisitor [
  ^aVisitor acceptInstanceScope: self


]

{ #category : #'platypus-generated-accessing' }
PltInstanceScope >> exportList [
  ^exportList


]

{ #category : #'platypus-generated-accessing' }
PltInstanceScope >> exportList: aListOfPltEntityInstance [
  exportList := aListOfPltEntityInstance ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltEntityInstance as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltInstanceScope >> exportListUsingContext: aContext [
  ^self exportList


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltInstanceScope >> fastSetExportList: aListOfPltEntityInstance [
  exportList := aListOfPltEntityInstance


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltInstanceScope >> fastSetOwned: aListOfPltEntityInstance [
  owned := aListOfPltEntityInstance


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceScope >> fromValues: values [
  ^self instanceScopeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltInstanceScope >> instanceScopeCopyTo: another [
  another fastSetOwned: self owned.
  another fastSetExportList: self exportList


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceScope >> instanceScopeFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setOwned: valuesloc removeFirst.
  self setExportList: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceScope >> instanceScopeToValues: values [
  values add: self owned.
  values add: self exportList.
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltInstanceScope >> isPltInstanceScope [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceScope >> localFromValues: values [
  ^self instanceScopeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceScope >> localToValues: values [
  ^self instanceScopeToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltInstanceScope >> owned [
  ^owned


]

{ #category : #'platypus-generated-accessing' }
PltInstanceScope >> owned: aListOfPltEntityInstance [
  owned := aListOfPltEntityInstance ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltEntityInstance as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltInstanceScope >> ownedUsingContext: aContext [
  ^self owned


]

{ #category : #'platypus-generated-accessing' }
PltInstanceScope >> owner [
	^ owner


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceScope >> owner: aPltEntityInstance owned: aListOfPltEntityInstance exportList: aListOfPltEntityInstance1 [ 	self setOwner:aPltEntityInstance.	self setOwned:aListOfPltEntityInstance.	self setExportList:aListOfPltEntityInstance1.


]

{ #category : #'platypus-generated-copying' }
PltInstanceScope >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltInstanceScope >> pltCopyTo: another [
  super pltCopyTo: another.
  self instanceScopeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltInstanceScope >> pltLocalCopyTo: another [
  self instanceScopeCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltInstanceScope >> setExportList: aListOfPltEntityInstance [
  self exportList: aListOfPltEntityInstance


]

{ #category : #'platypus-generated-set-accessing' }
PltInstanceScope >> setOwned: aListOfPltEntityInstance [
  self owned: aListOfPltEntityInstance


]

{ #category : #'platypus-generated-initializing' }
PltInstanceScope >> stepInitialize [
  super stepInitialize.
  owned := OrderedCollection new.
  exportList := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltInstanceScope >> toValues: values [
  ^self instanceScopeToValues: (super toValues: values)


]
