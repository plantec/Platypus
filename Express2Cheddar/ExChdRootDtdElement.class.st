"
<ISO10303-11-EXPRESS>
ENTITY root_dtd_element 
	SUBTYPE OF ( composite_dtd_element );
DERIVE
	packages : LIST OF ada_package := xml_packages_with_tag ( SELF.tag );
	SELF\composite_dtd_element.subs : LIST OF package_dtd_element := compute_root_sub_elements ( SELF );
	SELF\dtd_element.dtd_code : STRING := compute_root_dtd_code ( SELF );
	declared_domains : LIST OF dtd_element := get_declared_entity_domains ( subs );
	referenced_entities : LIST OF dtd_element := get_referenced_entity_domains ( subs );
	implicit_domains : LIST OF entity_ref_dtd_element := compute_implicit_domains ( SELF );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdRootDtdElement',
	#superclass : 'ExChdCompositeDtdElement',
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdRootDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRootDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRootDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRootDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRootDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdRootDtdElement >> accept: aVisitor [
	^ aVisitor acceptRootDtdElement: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> declaredDomains [
	^ self declaredDomainsUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> declaredDomainsUsingContext: aContext [
	^ self declaredDomainsUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> declaredDomainsUsingContext: aContext receiver: aReceiver [
	^ ExChdGetDeclaredEntityDomainsFunction
		invokeFromValues:
			(OrderedCollection new
				add: (aReceiver subsUsingContext: aContext);
				yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> dtdCode [
	^ self dtdCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> dtdCodeUsingContext: aContext [
	^ self dtdCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> dtdCodeUsingContext: aContext receiver: aReceiver [
	^ ExChdComputeRootDtdCodeFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRootDtdElement >> fromValues: values [
	^ self rootDtdElementFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> implicitDomains [
	^ self implicitDomainsUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> implicitDomainsUsingContext: aContext [
	^ self implicitDomainsUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> implicitDomainsUsingContext: aContext receiver: aReceiver [
	^ ExChdComputeImplicitDomainsFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : 'platypus-generated-classifying' }
ExChdRootDtdElement >> isExChdRootDtdElement [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRootDtdElement >> localFromValues: values [
	^ self rootDtdElementFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRootDtdElement >> localToValues: values [
	^ self rootDtdElementToValues: values


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> packages [
	^ self packagesUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> packagesUsingContext: aContext [
	^ self packagesUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> packagesUsingContext: aContext receiver: aReceiver [
	^ ExChdXmlPackagesWithTagFunction
		invokeFromValues:
			(OrderedCollection new
				add: (aReceiver tagUsingContext: self class context);
				yourself)


]

{ #category : 'platypus-generated-copying' }
ExChdRootDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdRootDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self rootDtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdRootDtdElement >> pltLocalCopyTo: another [
	self rootDtdElementCopyTo: another


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> referencedEntities [
	^ self referencedEntitiesUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> referencedEntitiesUsingContext: aContext [
	^ self referencedEntitiesUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> referencedEntitiesUsingContext: aContext receiver: aReceiver [
	^ ExChdGetReferencedEntityDomainsFunction
		invokeFromValues:
			(OrderedCollection new
				add: (aReceiver subsUsingContext: aContext);
				yourself)


]

{ #category : 'platypus-generated-copying' }
ExChdRootDtdElement >> rootDtdElementCopyTo: another [
	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRootDtdElement >> rootDtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRootDtdElement >> rootDtdElementToValues: values [
	^ values


]

{ #category : 'platypus-generated-initializing' }
ExChdRootDtdElement >> stepInitialize [
	super stepInitialize


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> subs [
	^ self subsUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> subsUsingContext: aContext [
	^ self subsUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdRootDtdElement >> subsUsingContext: aContext receiver: aReceiver [
	^ ExChdComputeRootSubElementsFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : 'platypus-generated-group-accessing' }
ExChdRootDtdElement >> toValues: values [
	^ self rootDtdElementToValues: (super toValues: values)


]
