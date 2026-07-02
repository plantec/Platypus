"
<ISO10303-11-EXPRESS>
ENTITY ada_named_type_reference 
	SUBTYPE OF ( entity_instance );
DERIVE
	ads_interfaces_list : LIST OF ada_interface := [ ];
	adb_interfaces_list : LIST OF ada_interface := [ ];
	ada_ident : STRING := SELF.ref.name;
	ada_ref_ident : STRING := SELF.ada_ident;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaNamedTypeReference,
	#superclass : #PltEntityInstance,
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaNamedTypeReference class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaNamedTypeReference class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaNamedTypeReference class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaNamedTypeReference class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaNamedTypeReference class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdAdaNamedTypeReference >> accept: aVisitor [
	^ aVisitor acceptAdaNamedTypeReference: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNamedTypeReference >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNamedTypeReference >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNamedTypeReference >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ (aReceiver refUsingContext: aContext) nameUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
ExChdAdaNamedTypeReference >> adaNamedTypeReferenceCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaNamedTypeReference >> adaNamedTypeReferenceFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaNamedTypeReference >> adaNamedTypeReferenceToValues: values [
	^ values


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNamedTypeReference >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNamedTypeReference >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNamedTypeReference >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNamedTypeReference >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNamedTypeReference >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNamedTypeReference >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNamedTypeReference >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNamedTypeReference >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaNamedTypeReference >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaNamedTypeReference >> fromValues: values [
	^ self adaNamedTypeReferenceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdAdaNamedTypeReference >> isExChdAdaNamedTypeReference [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaNamedTypeReference >> localFromValues: values [
	^ self adaNamedTypeReferenceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaNamedTypeReference >> localToValues: values [
	^ self adaNamedTypeReferenceToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdAdaNamedTypeReference >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdAdaNamedTypeReference >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaNamedTypeReferenceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdAdaNamedTypeReference >> pltLocalCopyTo: another [
	self adaNamedTypeReferenceCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
ExChdAdaNamedTypeReference >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaNamedTypeReference >> toValues: values [
	^ self adaNamedTypeReferenceToValues: (super toValues: values)


]
