"
<ISO10303-11-EXPRESS>
ENTITY cheddar_entity_definition 
	SUBTYPE OF ( entity_definition );
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
	#name : 'ExChdCheddarEntityDefinition',
	#superclass : 'PltEntityDefinition',
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarEntityDefinition class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarEntityDefinition class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarEntityDefinition class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarEntityDefinition class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarEntityDefinition class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdCheddarEntityDefinition >> accept: aVisitor [
	^ aVisitor acceptCheddarEntityDefinition: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver nameUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver nameUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adbCode [
	^ self adbCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adbCodeUsingContext: aContext [
	^ self adbCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adbCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adsCode [
	^ self adsCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adsCodeUsingContext: aContext [
	^ self adsCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adsCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarEntityDefinition >> cheddarEntityDefinitionCopyTo: another [
	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarEntityDefinition >> cheddarEntityDefinitionFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarEntityDefinition >> cheddarEntityDefinitionToValues: values [
	^ values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarEntityDefinition >> fromValues: values [
	^ self cheddarEntityDefinitionFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> initValue [
	^ self initValueUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> initValueUsingContext: aContext [
	^ self initValueUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdCheddarEntityDefinition >> initValueUsingContext: aContext receiver: aReceiver [
	^ nil


]

{ #category : 'platypus-generated-classifying' }
ExChdCheddarEntityDefinition >> isExChdCheddarEntityDefinition [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarEntityDefinition >> localFromValues: values [
	^ self cheddarEntityDefinitionFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarEntityDefinition >> localToValues: values [
	^ self cheddarEntityDefinitionToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarEntityDefinition >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarEntityDefinition >> pltCopyTo: another [
	super pltCopyTo: another.
	self cheddarEntityDefinitionCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdCheddarEntityDefinition >> pltLocalCopyTo: another [
	self cheddarEntityDefinitionCopyTo: another


]

{ #category : 'platypus-generated-initializing' }
ExChdCheddarEntityDefinition >> stepInitialize [
	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdCheddarEntityDefinition >> toValues: values [
	^ self cheddarEntityDefinitionToValues: (super toValues: values)


]
