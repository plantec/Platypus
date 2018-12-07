"
<ISO10303-11-EXPRESS>
ENTITY session_instance 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( sdai_instance );
	change_date : OPTIONAL time_stamp;
	validation_date : time_stamp;
	validation_result : LOGICAL;
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltSessionInstance,
	#superclass : #PltSdaiInstance,
	#instVars : [
		'validationResult',
		'validationDate',
		'changeDate'
	],
	#category : #'Platypus-PlatypusDictionarySchemaSchema'
}

{ #category : #'platypus-generated-context-accessing' }
PltSessionInstance class >> context [ ^ self schemaDefinition context


]

{ #category : #'platypus-generated-platypus-signature' }
PltSessionInstance class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSessionInstance class >> platypusMetaData [ 	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSessionInstance class >> schemaDefinition [
  ^PltPlatypusDictionarySchemaSchemaDefinition singleton


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltSessionInstance class >> schemaInstance [
  ^PltPlatypusMetaSchemasSchemaInstance singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltSessionInstance class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltSessionInstance class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-visiting' }
PltSessionInstance >> accept: aVisitor [
  ^aVisitor acceptSessionInstance: self


]

{ #category : #'platypus-generated-accessing' }
PltSessionInstance >> changeDate [
  ^changeDate


]

{ #category : #'platypus-generated-accessing' }
PltSessionInstance >> changeDate: aString [
  changeDate := aString


]

{ #category : #'platypus-generated-group-accessing' }
PltSessionInstance >> changeDate: aString validationDate: aString1 validationResult: aLogical [ 	self setChangeDate:aString.	self setValidationDate:aString1.	self setValidationResult:aLogical.


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSessionInstance >> changeDateUsingContext: aContext [
  ^self changeDate


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSessionInstance >> fastSetChangeDate: aString [
  changeDate := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSessionInstance >> fastSetValidationDate: aString [
  validationDate := aString


]

{ #category : #'platypus-generated-fast-set-accessing' }
PltSessionInstance >> fastSetValidationResult: aLogical [
  validationResult := aLogical


]

{ #category : #'platypus-generated-group-accessing' }
PltSessionInstance >> fromValues: values [
  ^self sessionInstanceFromValues: (super fromValues: values)


]

{ #category : #'platypus-generated-classifying' }
PltSessionInstance >> isPltSessionInstance [
  ^true


]

{ #category : #'platypus-generated-group-accessing' }
PltSessionInstance >> localFromValues: values [
  ^self sessionInstanceFromValues: values


]

{ #category : #'platypus-generated-group-accessing' }
PltSessionInstance >> localToValues: values [
  ^self sessionInstanceToValues: values


]

{ #category : #'platypus-generated-copying' }
PltSessionInstance >> pltCopyGroup: aClassSymbol to: anObject [
  self class name == aClassSymbol ifTrue: [ self pltCopyTo: anObject ] ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : #'platypus-generated-copying' }
PltSessionInstance >> pltCopyTo: another [
  super pltCopyTo: another.
  self sessionInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSessionInstance >> pltLocalCopyTo: another [
  self sessionInstanceCopyTo: another


]

{ #category : #'platypus-generated-copying' }
PltSessionInstance >> sessionInstanceCopyTo: another [
  another fastSetChangeDate: self changeDate.
  another fastSetValidationDate: self validationDate.
  another fastSetValidationResult: self validationResult


]

{ #category : #'platypus-generated-group-accessing' }
PltSessionInstance >> sessionInstanceFromValues: values [
  | valuesloc |
  valuesloc := values asOrderedCollection.
  self setChangeDate: valuesloc removeFirst.
  self setValidationDate: valuesloc removeFirst.
  self setValidationResult: valuesloc removeFirst.
  ^valuesloc


]

{ #category : #'platypus-generated-group-accessing' }
PltSessionInstance >> sessionInstanceToValues: values [
  values add: self changeDate.
  values add: self validationDate.
  values add: self validationResult.
  ^values


]

{ #category : #'platypus-generated-set-accessing' }
PltSessionInstance >> setChangeDate: aString [
  self changeDate: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltSessionInstance >> setValidationDate: aString [
  self validationDate: aString


]

{ #category : #'platypus-generated-set-accessing' }
PltSessionInstance >> setValidationResult: aLogical [
  self validationResult: aLogical


]

{ #category : #'platypus-generated-initializing' }
PltSessionInstance >> stepInitialize [
  super stepInitialize.
  changeDate := nil.
  validationDate := ''.
  validationResult := false


]

{ #category : #'platypus-generated-group-accessing' }
PltSessionInstance >> toValues: values [
  ^self sessionInstanceToValues: (super toValues: values)


]

{ #category : #'platypus-generated-accessing' }
PltSessionInstance >> validationDate [
  ^validationDate


]

{ #category : #'platypus-generated-accessing' }
PltSessionInstance >> validationDate: aString [
  validationDate := aString


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSessionInstance >> validationDateUsingContext: aContext [
  ^self validationDate


]

{ #category : #'platypus-generated-accessing' }
PltSessionInstance >> validationResult [
  ^validationResult


]

{ #category : #'platypus-generated-accessing' }
PltSessionInstance >> validationResult: aLogical [
  validationResult := aLogical


]

{ #category : #'platypus-generated-with-context-accessing' }
PltSessionInstance >> validationResultUsingContext: aContext [
  ^self validationResult


]
