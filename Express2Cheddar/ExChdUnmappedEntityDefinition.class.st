"
<ISO10303-11-EXPRESS>
ENTITY unmapped_entity_definition;
DERIVE
	ads_interfaces_list : LIST OF ada_interface := [ ];
	adb_interfaces_list : LIST OF ada_interface := [ ];
	ada_ident : STRING := SELF.name;
	ada_ref_ident : STRING := SELF.name;
	init_value : STRING := ?;
	ads_code : STRING := '';
	adb_code : STRING := '';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdUnmappedEntityDefinition,
	#superclass : #ExChdCoreEntity,
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdUnmappedEntityDefinition class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdUnmappedEntityDefinition class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdUnmappedEntityDefinition class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdUnmappedEntityDefinition class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdUnmappedEntityDefinition class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdUnmappedEntityDefinition >> accept: aVisitor [
	^ aVisitor acceptUnmappedEntityDefinition: self


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver nameUsingContext: aContext


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver nameUsingContext: aContext


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adbCode [
	^ self adbCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adbCodeUsingContext: aContext [
	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adbCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adsCode [
	^ self adsCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adsCodeUsingContext: aContext [
	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adsCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-group-accessing' }
ExChdUnmappedEntityDefinition >> fromValues: values [
	^ self unmappedEntityDefinitionFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> initValue [
	^ self initValueUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> initValueUsingContext: aContext [
	^ self initValueUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdUnmappedEntityDefinition >> initValueUsingContext: aContext receiver: aReceiver [
	^ nil


]

{ #category : #'platypus-generated-classifying' }
ExChdUnmappedEntityDefinition >> isExChdUnmappedEntityDefinition [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdUnmappedEntityDefinition >> localFromValues: values [
	^ self unmappedEntityDefinitionFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdUnmappedEntityDefinition >> localToValues: values [
	^ self unmappedEntityDefinitionToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdUnmappedEntityDefinition >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdUnmappedEntityDefinition >> pltCopyTo: another [
	super pltCopyTo: another.
	self unmappedEntityDefinitionCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdUnmappedEntityDefinition >> pltLocalCopyTo: another [
	self unmappedEntityDefinitionCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
ExChdUnmappedEntityDefinition >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdUnmappedEntityDefinition >> toValues: values [
	^ self unmappedEntityDefinitionToValues: (super toValues: values)


]

{ #category : #'platypus-generated-copying' }
ExChdUnmappedEntityDefinition >> unmappedEntityDefinitionCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdUnmappedEntityDefinition >> unmappedEntityDefinitionFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdUnmappedEntityDefinition >> unmappedEntityDefinitionToValues: values [
	^ values


]
