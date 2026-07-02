"
<ISO10303-11-EXPRESS>
ENTITY entity_dtd_element 
	SUBTYPE OF ( composite_dtd_element );
	domain : ada_entity;
DERIVE
	SELF\dtd_element.tag : STRING := lowerize ( domain.name );
	SELF\composite_dtd_element.subs : LIST OF dtd_element := compute_entity_sub_elements ( SELF );
	SELF\dtd_element.dtd_code : STRING := compute_entity_dtd_code ( SELF );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdEntityDtdElement,
	#superclass : #ExChdCompositeDtdElement,
	#instVars : [
		'domain'
	],
	#category : #'Express2Cheddar-CheddarDtdSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdEntityDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdEntityDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdEntityDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdEntityDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdEntityDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdEntityDtdElement >> accept: aVisitor [
	^ aVisitor acceptEntityDtdElement: self


]

{ #category : #'platypus-generated-accessing' }
ExChdEntityDtdElement >> domain [
	^ domain


]

{ #category : #'platypus-generated-accessing' }
ExChdEntityDtdElement >> domain: aExChdAdaEntity [
	domain := aExChdAdaEntity


]

{ #category : #'platypus-generated-with-context-accessing' }
ExChdEntityDtdElement >> domainUsingContext: aContext [
	^ self domain


]

{ #category : #'platypus-generated-deriving' }
ExChdEntityDtdElement >> dtdCode [
	^ self dtdCodeUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdEntityDtdElement >> dtdCodeUsingContext: aContext [
	^ self dtdCodeUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdEntityDtdElement >> dtdCodeUsingContext: aContext receiver: aReceiver [
	^ ExChdComputeEntityDtdCodeFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : #'platypus-generated-copying' }
ExChdEntityDtdElement >> entityDtdElementCopyTo: another [
	another fastSetDomain: self domain


]

{ #category : #'platypus-generated-group-accessing' }
ExChdEntityDtdElement >> entityDtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setDomain: valuesloc removeFirst.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdEntityDtdElement >> entityDtdElementToValues: values [
	values add: self domain.
	^ values


]

{ #category : #'platypus-generated-fast-set-accessing' }
ExChdEntityDtdElement >> fastSetDomain: aExChdAdaEntity [
	domain := aExChdAdaEntity


]

{ #category : #'platypus-generated-group-accessing' }
ExChdEntityDtdElement >> fromValues: values [
	^ self entityDtdElementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdEntityDtdElement >> isExChdEntityDtdElement [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdEntityDtdElement >> localFromValues: values [
	^ self entityDtdElementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdEntityDtdElement >> localToValues: values [
	^ self entityDtdElementToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdEntityDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdEntityDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self entityDtdElementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdEntityDtdElement >> pltLocalCopyTo: another [
	self entityDtdElementCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
ExChdEntityDtdElement >> setDomain: aExChdAdaEntity [
	self domain: aExChdAdaEntity


]

{ #category : #'platypus-generated-initializing' }
ExChdEntityDtdElement >> stepInitialize [
	super stepInitialize.
	domain := nil


]

{ #category : #'platypus-generated-deriving' }
ExChdEntityDtdElement >> subs [
	^ self subsUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdEntityDtdElement >> subsUsingContext: aContext [
	^ self subsUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdEntityDtdElement >> subsUsingContext: aContext receiver: aReceiver [
	^ ExChdComputeEntitySubElementsFunction
		invokeFromValues:
			(OrderedCollection new
				add: aReceiver;
				yourself)


]

{ #category : #'platypus-generated-deriving' }
ExChdEntityDtdElement >> tag [
	^ self tagUsingContext: self class context


]

{ #category : #'platypus-generated-deriving' }
ExChdEntityDtdElement >> tagUsingContext: aContext [
	^ self tagUsingContext: aContext receiver: self


]

{ #category : #'platypus-generated-deriving' }
ExChdEntityDtdElement >> tagUsingContext: aContext receiver: aReceiver [
	^ PTsLowerizeFunction
		invokeFromValues:
			(OrderedCollection new
				add: (aReceiver domain nameUsingContext: self class context);
				yourself)


]

{ #category : #'platypus-generated-group-accessing' }
ExChdEntityDtdElement >> toValues: values [
	^ self entityDtdElementToValues: (super toValues: values)


]
