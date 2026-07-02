"
<ISO10303-11-EXPRESS>
ENTITY ada_set_type 
	SUBTYPE OF ( set_type );
DERIVE
	ads_interfaces_list : LIST OF ada_interface := std_io_interfaces;
	adb_interfaces_list : LIST OF ada_interface := [ ];
	ada_ident : STRING := 'set';
	ada_ref_ident : STRING := SELF.ada_ident;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdAdaSetType,
	#superclass : #PltSetType,
	#category : #'Express2Cheddar-CheddarDomainsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaSetType class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaSetType class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdAdaSetType class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaSetType class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdAdaSetType class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdAdaSetType >> accept: aVisitor [
	^ aVisitor acceptAdaSetType: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaSetType >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaSetType >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaSetType >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ 'set'


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaSetType >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaSetType >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaSetType >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : #'platypus-generated-copying' }
ExChdAdaSetType >> adaSetTypeCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaSetType >> adaSetTypeFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaSetType >> adaSetTypeToValues: values [
	^ values


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaSetType >> adbInterfacesList [
	^ self adbInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaSetType >> adbInterfacesListUsingContext: aContext [
	^ self adbInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaSetType >> adbInterfacesListUsingContext: aContext receiver: aReceiver [
	^ Array new


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaSetType >> adsInterfacesList [
	^ self adsInterfacesListUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaSetType >> adsInterfacesListUsingContext: aContext [
	^ self adsInterfacesListUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdAdaSetType >> adsInterfacesListUsingContext: aContext receiver: aReceiver [
	^ PlatypusCoreAggregateInitializer
		collectionFrom:
			(OrderedCollection new
				add:
						(ExChdAdaInterface new
								adaInterfaceFromValues:
										(OrderedCollection new
												add: 'standards_io';
												add: nil;
												add: true;
												add: true;
												yourself);
								yourself);
				yourself)


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaSetType >> fromValues: values [
	^ self adaSetTypeFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdAdaSetType >> isExChdAdaSetType [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaSetType >> localFromValues: values [
	^ self adaSetTypeFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaSetType >> localToValues: values [
	^ self adaSetTypeToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdAdaSetType >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdAdaSetType >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaSetTypeCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdAdaSetType >> pltLocalCopyTo: another [
	self adaSetTypeCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
ExChdAdaSetType >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdAdaSetType >> toValues: values [
	^ self adaSetTypeToValues: (super toValues: values)


]
