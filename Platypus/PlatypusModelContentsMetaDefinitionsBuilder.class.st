Class {
	#name : #PlatypusModelContentsMetaDefinitionsBuilder,
	#superclass : #Object,
	#instVars : [
		'checkingPass',
		'rulesIndex',
		'interpreter',
		'modelContents',
		'toBeRecorded',
		'replaceIndex'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #computing }
PlatypusModelContentsMetaDefinitionsBuilder >> acceptModelContents: e [ 
	modelContents := e.
	interpreter modelContents: e.
	checkingPass := #recording.
	'Storing rules'
		displayProgressAt: Sensor cursorPoint
		from: 1
		to: e dataInstances size
		during: [:bar | e dataInstances
				withIndexDo: [:d :idx | 
					bar value: idx.
					self storeRule: d]].
	checkingPass := #resolving.
	'Building mapping'
		displayProgressAt: Sensor cursorPoint
		from: 1
		to: e dataInstances size
		during: [:bar | e dataInstances
				withIndexDo: [:d :idx | 
					bar value: idx.
					self buildMappingFor: d]].
	'Computing mapping'
		displayProgressAt: Sensor cursorPoint
		from: 1
		to: e dataInstances size
		during: [:bar | e dataInstances
				withIndexDo: [:d :idx | 
					bar value: idx.
					self computeMappingFor: d]].
	(PlatypusModelContentsRecorder modelContents: modelContents)
		checksAll: toBeRecorded.
	modelContents replaceIndex: replaceIndex.
	PlatypusInstanceDoer new 
		do: [:c :p | ((c at: p) isPltGenericInstance) ifTrue: [(c at: p) markAsPersistent]] 
		from: replaceIndex values 
		in: modelContents.
	
]

{ #category : #computing }
PlatypusModelContentsMetaDefinitionsBuilder >> buildMappingFor: e [
	| instDefinition metaExpression metaCondition evalResult |
	instDefinition := e definition ref.
	((instDefinition inheritsFromEntityDefinitionNamed: PltNamedType platypusMetaData name) or: [
	(instDefinition inheritsFromEntityDefinitionNamed: PltContextDefinition platypusMetaData name) or: [
	(instDefinition inheritsFromEntityDefinitionNamed: PltSchemaDefinition platypusMetaData name) or: [
	instDefinition inheritsFromEntityDefinitionNamed: PltAttribute platypusMetaData name]]])
		ifFalse: [^ self].
	interpreter
		asValOfSelf: e
		while: [rulesIndex keysAndValuesDo: [:currRule :metaAssoc |
				metaCondition := metaAssoc key.
				metaExpression := metaAssoc value key.
				evalResult := interpreter
					compute: metaCondition
						in: modelContents owner 
						to: e
						notifying: nil
						ifFail: [self halt]
						logged: false. 
				evalResult val isPltTrueConstant
					ifTrue: [	| ref newInst |
						ref := PltEntityDefinitionReference ref: PltMetaMappingDefinition platypusMetaData.
						newInst := (PltInternalRepresentation new) definition: ref; parameters: {e. metaAssoc value value copy}.
						toBeRecorded add: newInst]]].

]

{ #category : #computing }
PlatypusModelContentsMetaDefinitionsBuilder >> computeMappingFor: e [ 
	| instDefinition key |
	instDefinition := e definition.
	key := PltMetaMappingDefinition platypusMetaData name asUppercase.
	interpreter
		asValOfSelf: e
		while: [(e isPltInternalRepresentation
					and: [e definition name asUppercase = key])
				ifTrue: [| metaExpression metaCondition evalResult newInst |
					metaExpression := e valueOfExplicitAttributeNamed: 'expression'.
					instDefinition := e valueOfExplicitAttributeNamed: 'definition'.
					evalResult := interpreter
								evaluate: metaExpression val
								in: modelContents owner
								to: instDefinition
								notifying: nil
								ifFail: [self halt].
					newInst := evalResult val.
					instDefinition addRecordsToExternalRepresentation: newInst.
					toBeRecorded add: newInst.
					replaceIndex at: instDefinition put: newInst]]
]

{ #category : #'initialize-release' }
PlatypusModelContentsMetaDefinitionsBuilder >> initialize [
	super initialize.
	rulesIndex := IdentityDictionary new.
	interpreter := PlatypusExpressInterpretor new.
	toBeRecorded := OrderedCollection new.
	replaceIndex := IdentityDictionary new

]

{ #category : #computing }
PlatypusModelContentsMetaDefinitionsBuilder >> storeRule: e [ 
	| key |
	key := PltMetaMappingRule platypusMetaData name asUppercase.
	(e isPltInternalRepresentation
			and: [e definition name asUppercase = key])
		ifTrue: [| metaExpression metaCondition expression condition |
			expression := e valueOfExplicitAttributeNamed: 'expression'.
			condition := e valueOfExplicitAttributeNamed: 'condition'.
			metaCondition := interpreter
						parse: condition val
						in: modelContents owner
						notifying: nil  
						ifFail: [self halt].
			metaExpression := interpreter
						parse: expression val
						in: modelContents owner
						notifying: nil
						ifFail: [self halt].
			rulesIndex at: e put: metaCondition -> (metaExpression -> expression)]
]
