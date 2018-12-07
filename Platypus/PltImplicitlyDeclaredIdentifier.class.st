"
<ISO10303-11-EXPRESS>
ENTITY implicitly_declared_identifier 
	SUBTYPE OF ( identifier );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltImplicitlyDeclaredIdentifier,
	#superclass : #PltIdentifier,
	#category : #'Platypus-PlatypusExpressionsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltImplicitlyDeclaredIdentifier class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltImplicitlyDeclaredIdentifier class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltImplicitlyDeclaredIdentifier class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltImplicitlyDeclaredIdentifier class >> schemaDefinition [
  ^PltPlatypusExpressionsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltImplicitlyDeclaredIdentifier class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltImplicitlyDeclaredIdentifier class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltImplicitlyDeclaredIdentifier class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltImplicitlyDeclaredIdentifier >> accept: aVisitor [
  ^aVisitor acceptImplicitlyDeclaredIdentifier: self


]

{ #category : #'platypus-generated-group-accessing' }
PltImplicitlyDeclaredIdentifier >> fromValues: values [
  ^self implicitlyDeclaredIdentifierFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-copying' }
PltImplicitlyDeclaredIdentifier >> implicitlyDeclaredIdentifierCopyTo: another [
  


]

{ #category : #'platypus-generated-group-accessing' }
PltImplicitlyDeclaredIdentifier >> implicitlyDeclaredIdentifierFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltImplicitlyDeclaredIdentifier >> implicitlyDeclaredIdentifierToValues: values [
  ^values


]

{ #category : #'platypus-generated-classifying' }
PltImplicitlyDeclaredIdentifier >> isPltImplicitlyDeclaredIdentifier [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltImplicitlyDeclaredIdentifier >> localFromValues: values [
  ^self implicitlyDeclaredIdentifierFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltImplicitlyDeclaredIdentifier >> localToValues: values [
  ^self implicitlyDeclaredIdentifierToValues: values


]

{ #category : #'platypus-generated-copying' }
PltImplicitlyDeclaredIdentifier >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltImplicitlyDeclaredIdentifier >> pltCopyTo: another [
  super pltCopyTo: another.
  self implicitlyDeclaredIdentifierCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltImplicitlyDeclaredIdentifier >> pltLocalCopyTo: another [
  self implicitlyDeclaredIdentifierCopyTo: another


]

{ #category : #'platypus-generated-initializing' }
PltImplicitlyDeclaredIdentifier >> stepInitialize [
  super stepInitialize


]

{ #category : #'platypus-generated-group-accessing' }
PltImplicitlyDeclaredIdentifier >> toValues: values [
  ^self implicitlyDeclaredIdentifierToValues: (super toValues: values)


]
