"
<ISO10303-11-EXPRESS>
ENTITY assignable 
	SUBTYPE OF ( dictionary_instance );
	head : identifier;
	qualifiers : LIST OF qualifier;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAssignable,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'qualifiers',
		'head'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAssignable class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAssignable class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAssignable class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAssignable class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAssignable class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAssignable class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAssignable class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAssignable >> accept: aVisitor [
  ^aVisitor acceptAssignable: self


]

{ #category : #'platypus-generated-copying' }
PltAssignable >> assignableCopyTo: another [
  another fastSetHead: self head.
  another fastSetQualifiers: self qualifiers


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignable >> assignableFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setHead: valuesloc removeFirst.
  self setQualifiers: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignable >> assignableToValues: values [
  values add: self head.
  values add: self qualifiers.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAssignable >> fastSetHead: aPltIdentifier [
  head := aPltIdentifier


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAssignable >> fastSetQualifiers: aListOfPltQualifier [
  qualifiers := aListOfPltQualifier


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignable >> fromValues: values [
  ^self assignableFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltAssignable >> head [
  ^head


]

{ #category : #'platypus-generated-accessing' }
PltAssignable >> head: aPltIdentifier [
  head := aPltIdentifier


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignable >> head: aPltIdentifier qualifiers: aListOfPltQualifier [ 	self setHead:aPltIdentifier.	self setQualifiers:aListOfPltQualifier.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAssignable >> headUsingContext: aContext [
  ^self head


]

{ #category : #'platypus-generated-classifying' }
PltAssignable >> isPltAssignable [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignable >> localFromValues: values [
  ^self assignableFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignable >> localToValues: values [
  ^self assignableToValues: values


]

{ #category : #'platypus-generated-accessing' }
PltAssignable >> owner [
	^ owner


]

{ #category : #'platypus-generated-copying' }
PltAssignable >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAssignable >> pltCopyTo: another [
  super pltCopyTo: another.
  self assignableCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAssignable >> pltLocalCopyTo: another [
  self assignableCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltAssignable >> qualifiers [
  ^qualifiers


]

{ #category : #'platypus-generated-accessing' }
PltAssignable >> qualifiers: aListOfPltQualifier [
  qualifiers := aListOfPltQualifier ifNil: [ OrderedCollection new ] ifNotNil: [ aListOfPltQualifier as: OrderedCollection ]


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAssignable >> qualifiersUsingContext: aContext [
  ^self qualifiers


]

{ #category : #'platypus-generated-set-accessing' }
PltAssignable >> setHead: aPltIdentifier [
  self head: aPltIdentifier


]

{ #category : #'platypus-generated-set-accessing' }
PltAssignable >> setQualifiers: aListOfPltQualifier [
  self qualifiers: aListOfPltQualifier


]

{ #category : #'platypus-generated-initializing' }
PltAssignable >> stepInitialize [
  super stepInitialize.
  head := nil.
  qualifiers := OrderedCollection new


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignable >> toValues: values [
  ^self assignableToValues: (super toValues: values)


]
