"
<ISO10303-11-EXPRESS>
ENTITY assignment_statement 
	SUBTYPE OF ( statement );
	left : assignable;
	right_expr : expression;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltAssignmentStatement,
	#superclass : #PltStatement,
	#instVars : [
		'left',
		'rightExpr'
	],
	#category : #'Platypus-PlatypusStatementsSchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltAssignmentStatement class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltAssignmentStatement class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAssignmentStatement class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAssignmentStatement class >> schemaDefinition [
  ^PltPlatypusStatementsSchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltAssignmentStatement class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltAssignmentStatement class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltAssignmentStatement class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltAssignmentStatement >> accept: aVisitor [
  ^aVisitor acceptAssignmentStatement: self


]

{ #category : #'platypus-generated-copying' }
PltAssignmentStatement >> assignmentStatementCopyTo: another [
  another fastSetLeft: self left.
  another fastSetRightExpr: self rightExpr


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignmentStatement >> assignmentStatementFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setLeft: valuesloc removeFirst.
  self setRightExpr: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignmentStatement >> assignmentStatementToValues: values [
  values add: self left.
  values add: self rightExpr.
  ^values


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAssignmentStatement >> fastSetLeft: aPltAssignable [
  left := aPltAssignable


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltAssignmentStatement >> fastSetRightExpr: aPltExpression [
  rightExpr := aPltExpression


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignmentStatement >> fromValues: values [
  ^self assignmentStatementFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltAssignmentStatement >> isPltAssignmentStatement [
  ^true


]

{ #category : #'platypus-generated-accessing' }
PltAssignmentStatement >> left [
  ^left


]

{ #category : #'platypus-generated-accessing' }
PltAssignmentStatement >> left: aPltAssignable [
  left := aPltAssignable


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignmentStatement >> left: aPltAssignable rightExpr: aPltExpression [ 	self setLeft:aPltAssignable.	self setRightExpr:aPltExpression.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAssignmentStatement >> leftUsingContext: aContext [
  ^self left


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignmentStatement >> localFromValues: values [
  ^self assignmentStatementFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignmentStatement >> localToValues: values [
  ^self assignmentStatementToValues: values


]

{ #category : #'platypus-generated-copying' }
PltAssignmentStatement >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltAssignmentStatement >> pltCopyTo: another [
  super pltCopyTo: another.
  self assignmentStatementCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltAssignmentStatement >> pltLocalCopyTo: another [
  self assignmentStatementCopyTo: another


]

{ #category : #'platypus-generated-accessing' }
PltAssignmentStatement >> rightExpr [
  ^rightExpr


]

{ #category : #'platypus-generated-accessing' }
PltAssignmentStatement >> rightExpr: aPltExpression [
  rightExpr := aPltExpression


]

{ #category : #'platypus-generated-with-context-accessing' }
PltAssignmentStatement >> rightExprUsingContext: aContext [
  ^self rightExpr


]

{ #category : #'platypus-generated-set-accessing' }
PltAssignmentStatement >> setLeft: aPltAssignable [
  self left: aPltAssignable


]

{ #category : #'platypus-generated-set-accessing' }
PltAssignmentStatement >> setRightExpr: aPltExpression [
  self rightExpr: aPltExpression


]

{ #category : #'platypus-generated-initializing' }
PltAssignmentStatement >> stepInitialize [
  super stepInitialize.
  left := nil.
  rightExpr := nil


]

{ #category : #'platypus-generated-group-accessing' }
PltAssignmentStatement >> toValues: values [
  ^self assignmentStatementToValues: (super toValues: values)


]
