Class {
	#name : #PlatypusCoreSchemaInstance,
	#superclass : #PlatypusCoreContextDefinition,
	#instVars : [
		'metaDataByClassNameIndex',
		'altMetaDataByClassNameIndex',
		'classNamesByMetaDataNameIndex',
		'altClassNamesByMetaDataNameIndex',
		'splitMarkStack'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #accessing }
PlatypusCoreSchemaInstance class >> reinitializeSingleton [
	singleton ifNotNil: [singleton schemaDefinitionClasses do: [:c | c reinitializeSingleton]].
	super reinitializeSingleton
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> altClassNamesByMetaDataNameIndex [
	^ altClassNamesByMetaDataNameIndex ifNil: [altClassNamesByMetaDataNameIndex := IdentityDictionary new]
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> altMetaDataByClassNameIndex [

	^ altMetaDataByClassNameIndex ifNil: [altMetaDataByClassNameIndex := IdentityDictionary new]
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> alternativeIndex: aListOfAssociations [
	altClassNamesByMetaDataNameIndex := nil.
	altMetaDataByClassNameIndex := nil.
	aListOfAssociations do: [ :assoc | | ename clsname origClsname origMetaData | 
		ename := assoc key asUppercase asSymbol. 
		clsname := assoc value asSymbol.
		origClsname := self classNamesByMetaDataNameIndex at: ename .
		origMetaData := self metaDataByClassNameIndex at: origClsname.
		self altMetaDataByClassNameIndex at: clsname put: origMetaData.
		self altClassNamesByMetaDataNameIndex at: ename put: clsname].
		
]

{ #category : #'private initializing' }
PlatypusCoreSchemaInstance >> buildIndexes [
	| sch schClass |
	metaDataByClassNameIndex
		ifNil: [self expressParserClass
				ifNil: [self error: 'Platypus: EXPRESS Parser is not present']
				ifNotNil: [metaDataByClassNameIndex := IdentityDictionary new.
					classNamesByMetaDataNameIndex := IdentityDictionary new.
					metaData := self parsedMetaSchemaInstance.
					metaDataByClassNameIndex at: self class name asSymbol put: metaData.
					self schemaDefinitionClassInfos
						do: [:schInfo | 
							sch := self metaData lookUpSchemaDefinitionBN: schInfo first.
							schClass := PlatypusPharoSmalltalk at: schInfo second.
							schClass singleton metaData: sch.
							schClass singleton initializeFromOwner: self]]].
	self externalSchemaInstances
		do: [:schi | schi ifNotNil: [  
			schi singleton buildIndexes.
			schi singleton classNamesByMetaDataNameIndex
				keysAndValuesDo: [:k :v | classNamesByMetaDataNameIndex at: k put: v].
			schi singleton metaDataByClassNameIndex
				keysAndValuesDo: [:k :v | metaDataByClassNameIndex at: k put: v]]]  displayingProgress: 'Building meta data indexes'.
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> buildRepository [
	^ self repositoryClass new
]

{ #category : #'private meta data management' }
PlatypusCoreSchemaInstance >> buildSplittedContents: baseSelector [ 
	| result max |
	result := WriteStream
				on: (String new: 500).
	max := self perform: (baseSelector , 'PartsCount') asSymbol.
	1
		to: max
		do: [:cpt | result
				nextPutAll: ((self perform: (baseSelector , cpt printString) asSymbol)
						copyReplaceAll: '(*\\*)' 
						with: String cr
						)].
	^ result contents
]

{ #category : #'meta data accessing' }
PlatypusCoreSchemaInstance >> classFromEntityName: aString [
	| key clsname |
	key := aString asUppercase asSymbol.
	clsname := self altClassNamesByMetaDataNameIndex at: key ifAbsent: [self classNamesByMetaDataNameIndex at: key].
	^ PlatypusPharoSmalltalk at: clsname
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> classNamesByMetaDataNameIndex [
	^ classNamesByMetaDataNameIndex ifNil: [self buildIndexes. classNamesByMetaDataNameIndex]
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> completeExpressSchemaCode [
	| codeStream |
	codeStream := WriteStream on: String new.
	codeStream nextPutAll: self expressSchemaCode.
	self externalSchemaInstances
		do: [:schi | schi ifNotNil: [codeStream nextPutAll: schi singleton expressSchemaCode]].
	^ codeStream contents
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> context: aContext [ 
	self externalSchemaInstanceClassNames
		do: [:schi | (PlatypusPharoSmalltalk at: schi) singleton context: aContext]
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> expressParserClass [
	^ PlatypusPharoSmalltalk
		at: #PlatypusExpressParser
		ifAbsent: []
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> expressSchemaInstanceClass [
	^ PlatypusPharoSmalltalk
		at: #PltSchemaInstance
		ifAbsent: []
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> externalSchemaInstanceClassNames [
	^ #()
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> externalSchemaInstances [
	^ self externalSchemaInstanceClassNames
		collect: [:cls | PlatypusPharoSmalltalk at: cls]
]

{ #category : #'initialize-release' }
PlatypusCoreSchemaInstance >> initialize [
	super initialize.
	splitMarkStack := OrderedCollection new.
]

{ #category : #'private splitmark stack (to be obsolete)' }
PlatypusCoreSchemaInstance >> isAFileNamed: aName [ 
	^ ( FileLocator workingDirectory / aName) exists
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> metaDataByClassNameIndex [
	^ metaDataByClassNameIndex ifNil: 
			[self buildIndexes.metaDataByClassNameIndex]
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> metaDataFor: aSymbol [ 
	^ self altMetaDataByClassNameIndex
		at: aSymbol
		ifAbsent: [self metaDataByClassNameIndex
				at: aSymbol
				ifAbsent: []] 
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> metaDataForClass: aClass [ 
	^ self metaDataFor: aClass name asSymbol
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> namesBuilderClass [

	^ PlatypusPharoSmalltalk at: self namesBuilderClassName
]

{ #category : #'private splitmark stack (to be obsolete)' }
PlatypusCoreSchemaInstance >> outputFileStreamNamed: aName [ 
	| filename dir |
	(dir := ( FileLocator workingDirectory / self resultOutputDirectoryName) ) ensureDirectory.
	(filename := dir / aName) ensureCreateFile.
	^ filename writeStream
]

{ #category : #'meta data accessing' }
PlatypusCoreSchemaInstance >> parsedMetaSchemaInstance [
	| schemaInstance |
	schemaInstance  := self expressParserClass schemaInstanceFromSource: self completeExpressSchemaCode.
	schemaInstance namesBuilder: self namesBuilder.
	^ schemaInstance
]

{ #category : #'private splitmark stack (to be obsolete)' }
PlatypusCoreSchemaInstance >> popSplitmark [
	Transcript 
		show: 'Writing ' withCRs , splitMarkStack last name , '\' withCRs.
	splitMarkStack last close.
	splitMarkStack removeLast
]

{ #category : #'private splitmark stack (to be obsolete)' }
PlatypusCoreSchemaInstance >> pushSplitmark: aFileName append: appendIt [
	| contents oldStream |
	contents := ''.
	appendIt
		ifTrue: 
			[(self isAFileNamed: aFileName) 
				ifTrue: 
					[oldStream := self outputFileStreamNamed: aFileName.
					[contents := oldStream contentsOfEntireFile] ensure: [oldStream close]]].
	splitMarkStack add: (self outputFileStreamNamed: aFileName).
	appendIt ifTrue: [splitMarkStack last nextPutAll: contents]
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> repositoryClass [
	^ PlatypusPharoSmalltalk at: self repositoryClassName
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> repositoryClassName [
	^ self subclassResponsibility
]

{ #category : #'private splitmark stack (to be obsolete)' }
PlatypusCoreSchemaInstance >> resultOutputDirectoryName [
	^ 'Platypus-output'
]

{ #category : #'private meta data management' }
PlatypusCoreSchemaInstance >> schemaDefinitionClassInfos [
	| result |
	result := OrderedCollection new.
	1
		to: self schemaDefinitionCount
		do: [:cpt | result
				add: (self perform: ('schemaDefinition' , cpt asString) asSymbol)].
	^ result
]

{ #category : #'private meta data management' }
PlatypusCoreSchemaInstance >> schemaDefinitionClasses [
	^ self schemaDefinitionClassInfos
		collect: [:info | PlatypusPharoSmalltalk at: info second asSymbol]
]

{ #category : #'private meta data management' }
PlatypusCoreSchemaInstance >> schemaDefinitionCount [
	^ self subclassResponsibility 
]

{ #category : #accessing }
PlatypusCoreSchemaInstance >> schemaInstance [
	^ self
]

{ #category : #'private meta data management' }
PlatypusCoreSchemaInstance >> schemata [
	^ self schemaDefinitionClasses
		collect: [:cls | cls singleton]
]

{ #category : #'meta data accessing' }
PlatypusCoreSchemaInstance >> smalltalkTypeOf: aData [ 
	^ self  namesBuilder smalltalkTypeOf: aData
]

{ #category : #'private splitmark stack (to be obsolete)' }
PlatypusCoreSchemaInstance >> splitMarkOutput: aString [
	splitMarkStack last nextPutAll: aString
]
