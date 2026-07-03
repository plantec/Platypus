"
<ISO10303-11-EXPRESS>
ENTITY pragma_convention;
	convention : STRING;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdPragmaConvention',
	#superclass : 'ExChdCoreEntity',
	#instVars : [
		'convention'
	],
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdPragmaConvention class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdPragmaConvention class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdPragmaConvention class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPragmaConvention class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPragmaConvention class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdPragmaConvention >> accept: aVisitor [
	^ aVisitor acceptPragmaConvention: self


]

{ #category : 'platypus-generated-accessing' }
ExChdPragmaConvention >> convention [
	^ convention


]

{ #category : 'platypus-generated-accessing' }
ExChdPragmaConvention >> convention: aString [
	convention := aString


]

{ #category : 'platypus-generated-with-context-accessing' }
ExChdPragmaConvention >> conventionUsingContext: aContext [
	^ self convention


]

{ #category : 'platypus-generated-fast-set-accessing' }
ExChdPragmaConvention >> fastSetConvention: aString [
	convention := aString


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPragmaConvention >> fromValues: values [
	^ self pragmaConventionFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-classifying' }
ExChdPragmaConvention >> isExChdPragmaConvention [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPragmaConvention >> localFromValues: values [
	^ self pragmaConventionFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPragmaConvention >> localToValues: values [
	^ self pragmaConventionToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdPragmaConvention >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdPragmaConvention >> pltCopyTo: another [
	super pltCopyTo: another.
	self pragmaConventionCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdPragmaConvention >> pltLocalCopyTo: another [
	self pragmaConventionCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdPragmaConvention >> pragmaConventionCopyTo: another [
	another fastSetConvention: self convention


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPragmaConvention >> pragmaConventionFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	self setConvention: valuesloc removeFirst.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPragmaConvention >> pragmaConventionToValues: values [
	values add: self convention.
	^ values


]

{ #category : 'platypus-generated-set-accessing' }
ExChdPragmaConvention >> setConvention: aString [
	self convention: aString


]

{ #category : 'platypus-generated-initializing' }
ExChdPragmaConvention >> stepInitialize [
	super stepInitialize.
	convention := ''


]

{ #category : 'platypus-generated-group-accessing' }
ExChdPragmaConvention >> toValues: values [
	^ self pragmaConventionToValues: (super toValues: values)


]
