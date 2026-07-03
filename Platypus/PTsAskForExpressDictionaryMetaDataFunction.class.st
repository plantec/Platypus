Class {
	#name : #PTsAskForExpressDictionaryMetaDataFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'metaDataFilePath',
		'doit',
		'chosenName'
	],
	#category : #'Platypus-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsAskForExpressDictionaryMetaDataFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsAskForExpressDictionaryMetaDataFunction class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsAskForExpressDictionaryMetaDataFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsAskForExpressDictionaryMetaDataFunction class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsAskForExpressDictionaryMetaDataFunction >> chosenName [
	^ chosenName


]

{ #category : #'platypus-generated-accessing' }
PTsAskForExpressDictionaryMetaDataFunction >> chosenName: aString [
	chosenName := aString


]

{ #category : #'platypus-generated-accessing' }
PTsAskForExpressDictionaryMetaDataFunction >> doit [
	^ doit


]

{ #category : #'platypus-generated-accessing' }
PTsAskForExpressDictionaryMetaDataFunction >> doit: aBoolean [
	doit := aBoolean


]

{ #category : #'platypus-generated-accessing' }
PTsAskForExpressDictionaryMetaDataFunction >> fromValues: values [
	self metaDataFilePath: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
PTsAskForExpressDictionaryMetaDataFunction >> invoke [
	" ---------- locals assignments ----------"

	self doit: false.	" ---------- statements ----------"	"---------- native statement ---------- "
	PlatypusSchemaInstanceReference
		chooseSchemaInstanceForClient: nil
		selectingBlock: [ :hierarList :chosen | 
			| expDict |
			hierarList close.
			expDict := chosen.
			(self confirm: 'translate ' , expDict name , '?')
				ifTrue: [ 
					self chosenName: expDict name.
					Transcript show: 'writing meta data file "' , self metaDataFilePath , '"...'.
					expDict metaDataToStepFile: self metaDataFilePath.
					Transcript show: 'done\' withCRs ] ].
	^ self return: self chosenName


]

{ #category : #'platypus-generated-accessing' }
PTsAskForExpressDictionaryMetaDataFunction >> metaDataFilePath [
	^ metaDataFilePath


]

{ #category : #'platypus-generated-accessing' }
PTsAskForExpressDictionaryMetaDataFunction >> metaDataFilePath: aString [
	metaDataFilePath := aString


]
