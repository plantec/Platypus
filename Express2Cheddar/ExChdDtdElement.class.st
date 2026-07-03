"
<ISO10303-11-EXPRESS>
ENTITY dtd_element 
	ABSTRACT SUPERTYPE;
	owner : OPTIONAL dtd_element;
	tag : STRING;
DERIVE
	dtd_code : STRING := '';
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDtdElement',
	#superclass : 'ExChdCoreEntity',
	#instVars : [
		'tag',
		'owner'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDtdElement class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDtdElement class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDtdElement class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDtdElement class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDtdElement class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdDtdElement >> accept: aVisitor [
	^ aVisitor acceptDtdElement: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDtdElement >> dtdCode [
	^ self dtdCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdDtdElement >> dtdCodeUsingContext: aContext [
	^ self dtdCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdDtdElement >> dtdCodeUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : 'platypus-generated-copying' }
ExChdDtdElement >> dtdElementCopyTo: another [
	another fastSetOwner: self owner.
	another fastSetTag: self tag


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDtdElement >> dtdElementFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setOwner: valuesloc removeFirst.
	self setTag: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDtdElement >> dtdElementToValues: values [
	values add: self owner.
	values add: self tag.
	^ values


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdDtdElement >> fastSetOwner: aExChdDtdElement [
	owner := aExChdDtdElement


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdDtdElement >> fastSetTag: aString [
	tag := aString


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDtdElement >> fromValues: values [
	^ self dtdElementFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdDtdElement >> isExChdDtdElement [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDtdElement >> localFromValues: values [
	^ self dtdElementFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDtdElement >> localToValues: values [
	^ self dtdElementToValues: values


]

{ #category : 'platypus-generated-accessing' }
ExChdDtdElement >> owner [
	^ owner


]

{ #category : 'platypus-generated-accessing' }
ExChdDtdElement >> owner: aExChdDtdElement [
	owner := aExChdDtdElement


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdDtdElement >> ownerUsingContext: aContext [
	^ self owner


]

{ #category : 'platypus-generated-copying' }
ExChdDtdElement >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdDtdElement >> pltCopyTo: another [
	super pltCopyTo: another.
	self dtdElementCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdDtdElement >> pltLocalCopyTo: another [
	self dtdElementCopyTo: another


]

{ #category : 'platypus-generated-set-accessing' }
ExChdDtdElement >> setOwner: aExChdDtdElement [
	self owner: aExChdDtdElement


]

{ #category : 'platypus-generated-set-accessing' }
ExChdDtdElement >> setTag: aString [
	self tag: aString


]

{ #category : 'platypus-generated-initializing' }
ExChdDtdElement >> stepInitialize [
	super stepInitialize.
	owner := nil.
	tag := ''


]

{ #category : 'platypus-generated-accessing' }
ExChdDtdElement >> tag [
	^ tag


]

{ #category : 'platypus-generated-accessing' }
ExChdDtdElement >> tag: aString [
	tag := aString


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdDtdElement >> tagUsingContext: aContext [
	^ self tag


]

{ #category : 'platypus-generated-group-accessing' }
ExChdDtdElement >> toValues: values [
	^ self dtdElementToValues: (super toValues: values)


]
