Class {
	#name : #PlatypusCoreRepository,
	#superclass : #StepAbstractRepository,
	#instVars : [
		'header',
		'metaDataSchemaInstance'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #accessing }
PlatypusCoreRepository class >> dataParserClass [
	^ StepParser
]

{ #category : #accessing }
PlatypusCoreRepository class >> generatedMetaDataSchemaInstance [
	^ (PlatypusPharoSmalltalk at: self generatedMetaDataSchemaInstanceName) singleton
]

{ #category : #accessing }
PlatypusCoreRepository class >> generatedMetaDataSchemaInstanceName [
	^ self subclassResponsibility 
]

{ #category : #'instance creation' }
PlatypusCoreRepository class >> new [
	^ super new
		metaDataSchemaInstance: self generatedMetaDataSchemaInstance
]

{ #category : #accessing }
PlatypusCoreRepository >> allApplicationInstances [
	^ self allPersistentApplicationInstances

]

{ #category : #accessing }
PlatypusCoreRepository >> allPersistentApplicationInstances [
	^ self instances
]

{ #category : #accessing }
PlatypusCoreRepository >> alternativeIndex: aListOfAssoc [
	"the arg is a collection of association made of:  <entity name> -> <class name> "
	self metaDataSchemaInstance alternativeIndex: aListOfAssoc
]

{ #category : #converting }
PlatypusCoreRepository >> asSchemaInstanceContext [
	self metaDataSchemaInstance context: (PlatypusCoreRunningContext folder: self)
]

{ #category : #checking }
PlatypusCoreRepository >> checksExternalInstance: instance [ 
	| errors metaData |
	errors := OrderedCollection new.
	instance records do: [:rec |
		metaData := self metaDataSchemaInstance metaDataForClass: rec class.
		metaData
			inheritedExplicitAttributesDo: [:attr | errors
				addAll: (attr
						checksValueFromInstance: instance
						oid: (self oidOf: instance)
						repository: self)]].
	^ errors
]

{ #category : #checking }
PlatypusCoreRepository >> checksInstance: instance [ 
	(instance isKindOf: PlatypusComplexInstance) ifTrue: [
		^ self checksExternalInstance: instance]
	ifFalse: [
		^ self checksInternalInstance: instance]

]

{ #category : #checking }
PlatypusCoreRepository >> checksInternalInstance: instance [ 
	| errors metaData |
	errors := OrderedCollection new.
	metaData := self metaDataSchemaInstance metaDataForClass: instance class.
	metaData inheritedExplicitAttributesDo: 
		 [:attr | errors
				addAll: (attr
						checksValueFromInstance: instance
						oid: (self oidOf: instance)
						repository: self)].
	^ errors
]

{ #category : #'file in/out' }
PlatypusCoreRepository >> classFromEntityName: aString [ 
	^ self metaDataSchemaInstance classFromEntityName: aString 
]

{ #category : #'file in/out' }
PlatypusCoreRepository >> createInstanceFromEntityName: entityName [ 
	| class |
	^ (class := self classFromEntityName: entityName)
		ifNotNil: [class new ]
]

{ #category : #'file in/out' }
PlatypusCoreRepository >> createInstanceFromEntityName: entityName withId: id [ 
	| inst |
	^ (inst := self createInstanceFromEntityName: entityName)
		ifNotNil: [self registerInstance: inst withId: id]
]

{ #category : #accessing }
PlatypusCoreRepository >> dataParserClass [
	^ self class dataParserClass
]

{ #category : #'initialize/release' }
PlatypusCoreRepository >> finalize [
	super finalize.

]

{ #category : #accessing }
PlatypusCoreRepository >> header [
	^header
]

{ #category : #accessing }
PlatypusCoreRepository >> metaDataSchemaInstance [
	^metaDataSchemaInstance
]

{ #category : #accessing }
PlatypusCoreRepository >> metaDataSchemaInstance: anObject [
	metaDataSchemaInstance := anObject
]

{ #category : #accessing }
PlatypusCoreRepository >> namesBuilder [
	^ self metaDataSchemaInstance namesBuilder
]

{ #category : #'file in/out' }
PlatypusCoreRepository >> parseStream: in [ 
	^ self parseStream: in onError: [:d :l | self notify: d at: l in: in].
]

{ #category : #'file in/out' }
PlatypusCoreRepository >> parseStream: in onError: aBlock [ 
	| id result entityName parameters newInst metaData val setterSymbol records newRec |
	result := self dataParserClass parseStream: in onError: aBlock.
	header := result first.
	result second
		do: [:inst | 
			id := inst label.
			inst isInternalRepresentation
				ifTrue: [
					entityName := inst entityName.
					parameters := inst values.
					(newInst := self createInstanceFromEntityName: entityName  withId: id)
						ifNotNil: [metaData := self metaDataSchemaInstance metaDataForInstance: newInst.
							metaData
								inheritedExplicitAttributesDo: [:attr | ((val := parameters removeFirst) isKindOf: StepRedefinedValue)
										ifFalse: [val isCollection
												ifTrue: [setterSymbol := attr setSelectorFromNamesBuilder: self namesBuilder]
												ifFalse: [
													val  = $$ ifTrue: [val := nil].
													setterSymbol := attr fastSetSelectorFromNamesBuilder: self namesBuilder].
											newInst perform: setterSymbol with: val]]]]
				ifFalse: [records := OrderedCollection new.
					inst records
						do: [:rec | 
							entityName := rec entityName.
							parameters := rec values.
							(newRec := self createInstanceFromEntityName: entityName)
								ifNotNil: [metaData := self metaDataSchemaInstance metaDataForInstance: newRec.
									metaData
										explicitAttributesDo: [:attr | ((val := parameters removeFirst) isKindOf: StepRedefinedValue)
												ifFalse: [val isCollection
														ifTrue: [setterSymbol := attr setSelectorFromNamesBuilder: self namesBuilder]
														ifFalse: [
															val  = $$ ifTrue: [val := nil].
															setterSymbol := attr fastSetSelectorFromNamesBuilder: self namesBuilder].
													newRec perform: setterSymbol with: val]].
									records add: newRec]].
					newInst := PlatypusComplexInstance fromRecords: records.
					self registerInstance: newInst withId: id]].
	self resolvesInstanceReferences
]

{ #category : #checking }
PlatypusCoreRepository >> resolvedTokenOf: t [ 
	(t isKindOf: StepInstanceReference)
		ifTrue: [^ self instanceAt: t id]
		ifFalse: [((t isKindOf: Collection)
					and: [(t isKindOf: String) not])
				ifTrue: [^ t
						collect: [:e | self resolvedTokenOf: e]]].
	^ t
]

{ #category : #checking }
PlatypusCoreRepository >> resolvesInstanceReferencesOf: instance [ 
	| getterSymbol setterSymbol entityDef |
	(instance isKindOf: PlatypusComplexInstance)
		ifTrue: [instance records
				do: [:rec | self resolvesInstanceReferencesOf: rec]]
		ifFalse: [entityDef := self metaDataSchemaInstance metaDataForInstance: instance.
			entityDef
				inheritedExplicitAttributesDo: [:attr | (entityDef isAttributeRedeclared: attr)
						ifFalse: [getterSymbol := attr getSelectorFromNamesBuilder: self namesBuilder.
							setterSymbol := attr fastSetSelectorFromNamesBuilder: self namesBuilder.
							instance
								perform: setterSymbol
								with: (self
										resolvedTokenOf: (instance perform: getterSymbol))]]]
]

{ #category : #'file in/out' }
PlatypusCoreRepository >> stepFileOut: aFilename [ 
	(PlatypusCoreRepositoryStepFileWriter folder: self) doFolder; stepFileOut: aFilename 
]
