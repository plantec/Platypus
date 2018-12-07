Class {
	#name : #PlatypusExpressMetaStructure2PharoTranslater,
	#superclass : #PlatypusExpressStructure2PharoTranslater,
	#category : #'Platypus-HW-translater-private'
}

{ #category : #'generating from schemaInstance' }
PlatypusExpressMetaStructure2PharoTranslater >> buildInitializeMethodFromSchemaInstance: e [ 
	| selector clsName code |
	clsName := e generatedClassName.
	selector := 'bootstraps'.
	code := '	self reinitializeSingleton. self singleton buildIndexes.'.
	self 
		fileOutMethodSource: selector , ' ' , code
		className: clsName
		meta: true
		category: 'initializing'
]
