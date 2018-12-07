"
<ISO10303-11-EXPRESS>
ENTITY supertype_constraint 
	SUBTYPE OF ( dictionary_instance );
	constrained : entity_definition_reference;
	expr : OPTIONAL supertype_expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSupertypeConstraint,
	#superclass : #PltDictionaryInstance,
	#instVars : [
		'expr',
		'constrained'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSupertypeConstraint class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSupertypeConstraint class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSupertypeConstraint class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSupertypeConstraint class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSupertypeConstraint class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSupertypeConstraint class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSupertypeConstraint class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSupertypeConstraint >> accept: aVisitor [
  ^aVisitor acceptSupertypeConstraint: self


]

{ #category : #'platypus-generated-accessing' }
PltSupertypeConstraint >> constrained [
  ^constrained


]

{ #category : #'platypus-generated-accessing' }
PltSupertypeConstraint >> constrained: aPltEntityDefinitionReference [
  constrained := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeConstraint >> constrained: aPltEntityDefinitionReference expr: aPltSupertypeExpression [ 	self setConstrained:aPltEntityDefinitionReference.	self setExpr:aPltSupertypeExpression.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSupertypeConstraint >> constrainedUsingContext: aContext [
  ^self constrained


]

{ #category : #'platypus-generated-accessing' }
PltSupertypeConstraint >> expr [
  ^expr


]

{ #category : #'platypus-generated-accessing' }
PltSupertypeConstraint >> expr: aPltSupertypeExpression [
  expr := aPltSupertypeExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSupertypeConstraint >> exprUsingContext: aContext [
  ^self expr


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSupertypeConstraint >> fastSetConstrained: aPltEntityDefinitionReference [
  constrained := aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSupertypeConstraint >> fastSetExpr: aPltSupertypeExpression [
  expr := aPltSupertypeExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeConstraint >> fromValues: values [
  ^self supertypeConstraintFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSupertypeConstraint >> isPltSupertypeConstraint [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeConstraint >> localFromValues: values [
  ^self supertypeConstraintFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeConstraint >> localToValues: values [
  ^self supertypeConstraintToValues: values


]

{ #category : #'platypus-generated-copying' }
PltSupertypeConstraint >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSupertypeConstraint >> pltCopyTo: another [
  super pltCopyTo: another.
  self supertypeConstraintCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSupertypeConstraint >> pltLocalCopyTo: another [
  self supertypeConstraintCopyTo: another


]

{ #category : #'platypus-generated-set-accessing' }
PltSupertypeConstraint >> setConstrained: aPltEntityDefinitionReference [
  self constrained: aPltEntityDefinitionReference


]

{ #category : #'platypus-generated-set-accessing' }
PltSupertypeConstraint >> setExpr: aPltSupertypeExpression [
  self expr: aPltSupertypeExpression


]

{ #category : #'platypus-generated-initializing' }
PltSupertypeConstraint >> stepInitialize [
  super stepInitialize.
  constrained := nil.
  expr := nil


]

{ #category : #'platypus-generated-copying' }
PltSupertypeConstraint >> supertypeConstraintCopyTo: another [
  another fastSetConstrained: self constrained.
  another fastSetExpr: self expr


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeConstraint >> supertypeConstraintFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setConstrained: valuesloc removeFirst.
  self setExpr: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeConstraint >> supertypeConstraintToValues: values [
  values add: self constrained.
  values add: self expr.
  ^values


]

{ #category : #'platypus-generated-group-accessing' }
PltSupertypeConstraint >> toValues: values [
  ^self supertypeConstraintToValues: (super toValues: values)


]
