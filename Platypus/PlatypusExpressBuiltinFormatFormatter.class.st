Class {
	#name : #PlatypusExpressBuiltinFormatFormatter,
	#superclass : #Object,
	#instVars : [
		'sourceFormat'
	],
	#category : #'Platypus-HW-interpreter'
}

{ #category : #'instance creation' }
PlatypusExpressBuiltinFormatFormatter class >> format: aNumber sourceFormat: aString [ 
	| formatter src |
	aString trimBoth isEmpty ifTrue: [
		src := aNumber isInteger ifTrue: ['7I'] ifFalse: ['10.1E'].
		] ifFalse: [src := aString].
	formatter := PlatypusExpressBuiltinFormatParser parse: src.
	^ formatter format: aNumber
]

{ #category : #'instance creation' }
PlatypusExpressBuiltinFormatFormatter class >> sourceFormat: aFormat [ 
	^ self new initializeFromSourceFormat: aFormat
]

{ #category : #formatting }
PlatypusExpressBuiltinFormatFormatter >> format: aNumber [ 
	^ aNumber asString
]

{ #category : #initializing }
PlatypusExpressBuiltinFormatFormatter >> initializeFromSourceFormat: aSourceString [ 
	^ self
]
