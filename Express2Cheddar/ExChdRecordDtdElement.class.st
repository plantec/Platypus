"
<ISO10303-11-EXPRESS>
ENTITY record_dtd_element 
	SUBTYPE OF ( entity_dtd_element );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdRecordDtdElement,
	#superclass : #ExChdEntityDtdElement,
	#category : #'Express2Cheddar-CheddarDtdSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdRecordDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdRecordDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdRecordDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdRecordDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdRecordDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdRecordDtdElement >> accept: aVisitor [
	^ aVisitor acceptRecordDtdElement: self


]

{ #category : #'platypus-generated-group-accessing' }
ExChdRecordDtdElement >> fromValues: values [
	^ self recordDtdElementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdRecordDtdElement >> isExChdRecordDtdElement [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdRecordDtdElement >> localFromValues: values [
	^ self recordDtdElementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdRecordDtdElement >> localToValues: values [
	^ self recordDtdElementToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdRecordDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdRecordDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self recordDtdElementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdRecordDtdElement >> pltLocalCopyTo: another [
	self recordDtdElementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdRecordDtdElement >> recordDtdElementCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdRecordDtdElement >> recordDtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdRecordDtdElement >> recordDtdElementToValues: values [
	^ values


]

{ #category : #'platypus-generated-initializing' }
ExChdRecordDtdElement >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdRecordDtdElement >> toValues: values [
	^ self recordDtdElementToValues: (super toValues: values)


]
