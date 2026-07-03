Class {
	#name : #PTsWriteFileProcedure,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'filename',
		'contents'
	],
	#category : #'Platypus-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsWriteFileProcedure class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsWriteFileProcedure class >> schemaDefinition [
	^ PTsExpressToolsboxFunctionsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PTsWriteFileProcedure class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsWriteFileProcedure class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-accessing' }
PTsWriteFileProcedure >> contents [
	^ contents


]

{ #category : #'platypus-generated-accessing' }
PTsWriteFileProcedure >> contents: aString1 [
	contents := aString1


]

{ #category : #'platypus-generated-accessing' }
PTsWriteFileProcedure >> filename [
	^ filename


]

{ #category : #'platypus-generated-accessing' }
PTsWriteFileProcedure >> filename: aString [
	filename := aString


]

{ #category : #'platypus-generated-accessing' }
PTsWriteFileProcedure >> filename: aString contents: aString1 [
	self filename: aString.
	self contents: aString1


]

{ #category : #'platypus-generated-accessing' }
PTsWriteFileProcedure >> fromValues: values [
	self filename: (values at: 1).
	self contents: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PTsWriteFileProcedure >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	"---------- native statement ---------- "

	| fref |
	fref := self filename asFileReference.
	fref parent parent ensureCreateDirectory.
	fref parent ensureCreateDirectory.
	fref ensureDelete.
	fref ensureCreateFile.
	fref
		writeStreamDo: [ :fileStream | 
			fileStream nextPutAll: (PltStringLiteral val: self contents) asClearText.
			fileStream flush ]


]
