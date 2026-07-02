"
<ISO10303-11-EXPRESS>
ENTITY discriminated_type_discriminant 
	SUBTYPE OF ( explicit_attribute );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdDiscriminatedTypeDiscriminant,
	#superclass : #PltExplicitAttribute,
	#category : #'Express2Cheddar-DiscriminatedTypeSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeDiscriminant class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeDiscriminant class >> schemaDefinition [
	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeDiscriminant class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeDiscriminant class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeDiscriminant class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-visiting' }
ExChdDiscriminatedTypeDiscriminant >> accept: aVisitor [
	^ aVisitor acceptDiscriminatedTypeDiscriminant: self


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeDiscriminant >> discriminatedTypeDiscriminantCopyTo: another [
	


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeDiscriminant >> discriminatedTypeDiscriminantFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeDiscriminant >> discriminatedTypeDiscriminantToValues: values [
	^ values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeDiscriminant >> fromValues: values [
	^ self discriminatedTypeDiscriminantFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
ExChdDiscriminatedTypeDiscriminant >> isExChdDiscriminatedTypeDiscriminant [
	^ true


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeDiscriminant >> localFromValues: values [
	^ self discriminatedTypeDiscriminantFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeDiscriminant >> localToValues: values [
	^ self discriminatedTypeDiscriminantToValues: values


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeDiscriminant >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeDiscriminant >> pltCopyTo: another [
	super pltCopyTo: another.
	self discriminatedTypeDiscriminantCopyTo: another


]

{ #category : #'platypus-generated-copying' }
ExChdDiscriminatedTypeDiscriminant >> pltLocalCopyTo: another [
	self discriminatedTypeDiscriminantCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
ExChdDiscriminatedTypeDiscriminant >> stepInitialize [
	super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
ExChdDiscriminatedTypeDiscriminant >> toValues: values [
	^ self discriminatedTypeDiscriminantToValues: (super toValues: values)


]
