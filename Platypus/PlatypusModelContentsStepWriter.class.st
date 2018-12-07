Class {
	#name : #PlatypusModelContentsStepWriter,
	#superclass : #PlatypusStepAbstractVisitor,
	#instVars : [
		'outStream',
		'p21Syntax',
		'tokenClassifier',
		'modelContents',
		'annote'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'visit aggregate data schema' }
PlatypusModelContentsStepWriter >> acceptAggregateData: e [ 
	self nextPut: $(.
	e contents acceptTry: self 
		separatedBy: [self nextPut: $,].
	self nextPut: $)
]

{ #category : #'visit aggregate data schema' }
PlatypusModelContentsStepWriter >> acceptAggregateInitializer: e [ 
	self nextPut: $(.
	e contents acceptTry: self 
		separatedBy: [self nextPut: $,].
	self nextPut: $)
]

{ #category : #'visit aggregate data schema' }
PlatypusModelContentsStepWriter >> acceptAggregateInitializerElement: e [ 
	self acceptTry: e val.
	self nextPut: $:.
	e repetition notNil
		ifTrue: [self acceptTry: e repetition] ifFalse: [self nextPut: $1]
]

{ #category : #'visit aggregate data schema' }
PlatypusModelContentsStepWriter >> acceptAggregateInstance: e [ 
	self nextPut: $(.
	e 
		contents do: [:c |
			c isPltGenericInstance 
				ifTrue: [
					outStream nextPut: $#.
					outStream nextPutAll: c persistentLabel]
				ifFalse: [c acceptTry: self ] ]
		separatedBy: [self nextPut: $,].
	self nextPut: $)
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> acceptAllParameters: parameters definition: definition fromSimpleRecord: fromSimpleRecord [ 
	| attrs |
	definition ifNotNil: [
		fromSimpleRecord 
			ifTrue: [attrs := definition explicitAttributes copy]
			ifFalse: [attrs := definition inheritedExplicitAttributes copy]].
	attrs ifNil: [attrs := OrderedCollection new].
	attrs := attrs asOrderedCollection.
	[parameters size < attrs size] whileTrue: [parameters add: PltMissingValue new].
	[attrs size < parameters size] whileTrue: [attrs add: nil].
	parameters
		with: attrs 
		do: [:v :a | self acceptParameter: v entity: definition attribute: a fromSimpleRecord: fromSimpleRecord]
		separatedBy: [p21Syntax ifTrue: [outStream nextPutAll: ', ']].
	p21Syntax
		ifFalse: [parameters notEmpty 
			ifTrue: [outStream nextPut: Character cr]]
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsStepWriter >> acceptEConstant: e [ 
	self nextPutAll: 'E' 
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptEntityDefinitionReference: e [ 
	e ref ifNil: 
			[outStream nextPutAll: e name asUppercase]
		ifNotNil: 
			[outStream nextPutAll: e ref name asUppercase]
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsStepWriter >> acceptEnumerationValue: e [ 
	self nextPutAll: '.', e element asUppercase, '.'.

]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptExternalGroupRepresentation: e [ 
 	self acceptExternalInstance: e
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptExternalInstance: e [ 
	self acceptGenericInstance: e.
	self nextPutAll: '('.
	e records isNil ifFalse: [
	e records size > 1 ifTrue: [self nextPutAll: String cr , String tab].
	e records acceptTry: self
		separatedBy: [self nextPutAll: String cr , String tab].
	e records size > 1 ifTrue: [self nextPutAll: String cr]].
	self nextPutAll: ');'
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptExternalRepresentation: e [ 
	self acceptExternalInstance: e
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsStepWriter >> acceptFalseConstant: e [ 
	self nextPutAll: '.F.'
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptFileDescription: e [ 
	self nextPutAll: 'FILE_DESCRIPTION(('.
	e description
		do: [:desc | self nextPutAllString: desc]
		separatedBy: [self nextPut: $,].
	self nextPutAll: '),'.
	self nextPutAllString: e implementationLevel.
	self nextPutAll: ');'.
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptFileName: e [ 
	self nextPutAll: 'FILE_NAME('.
	self nextPutAllString: e name.
	self nextPutAll: ','.
	self nextPutAllString: e timeStamp.
	self nextPutAll: ',('.
	e author
		do: [:a | self nextPutAllString: a]
		separatedBy: [self nextPut: $,].
	self nextPutAll: '),('.
	e organization
		do: [:a | self nextPutAllString: a]
		separatedBy: [self nextPut: $,].
	self nextPutAll: '),'.
	self nextPutAllString: e preprocessorVersion.
	self nextPutAll: ','.
	self nextPutAllString: e originatingSystem.
	self nextPutAll: ','.
	self nextPutAllString: e authorisation.
	self nextPutAll: ');'
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptFileSchema: e [ 
	self nextPutAll: 'FILE_SCHEMA(('.
	e schemaIdentifiers
		do: [:a | self nextPutAllString: a]
		separatedBy: [self nextPut: $,].
	self nextPutAll: '));'
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptGenericInstance: t1 [ 
	outStream nextPut: $#.
	outStream nextPutAll: t1 persistentLabel asString.
	self nextPut: $=.
	t1 instanceScope
		ifNotNil: [t1 instanceScope acceptTry: self]
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptInstanceScope: e [ 
	self nextPutAll: '&SCOPE\' withCRs.
	e owned
		acceptTry: self
		separatedBy: [self nextPut: Character cr].
	self nextPutAll: '\END_SCOPE' withCRs.
	e exportList size > 0
		ifTrue: [self nextPutAll: ' /'.
			e exportList acceptTry: self 
				separatedBy: [self nextPutAll: ','].
			self nextPutAll: '/\' withCRs]
		ifFalse: [self nextPut: Character cr]
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsStepWriter >> acceptIntegerLiteral: e [ 
	self nextPutAll: e val printString
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptInternalGroupRepresentation: e [ 
	self acceptInternalInstance: e
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptInternalInstance: e [ 
	self acceptGenericInstance: e.
	self acceptTry: e definition.
	self nextPut: $(. 
	self
		acceptAllParameters: e parameters copy
		definition: e definition referenced
		fromSimpleRecord: false.
	self nextPutAll: ');'
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptInternalRepresentation: e [ 
	self acceptInternalInstance: e 

]

{ #category : #'visit expressions schema' }
PlatypusModelContentsStepWriter >> acceptMissingValue: e [ 
	self nextPut: $$
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> acceptParameter: aParameter entity: definition attribute: anExplicitAttribute fromSimpleRecord: fromSimpleRecord [ 
	p21Syntax
		ifFalse: [ 
			outStream nextPut: Character cr.
 			outStream nextPut: Character tab.
			fromSimpleRecord
				ifTrue: [outStream nextPut: Character tab].
			anExplicitAttribute ifNotNil: [
				outStream nextPutAll: anExplicitAttribute name.
				outStream nextPutAll: ': ']].
	(anExplicitAttribute notNil and: [definition isAttributeRedeclared: anExplicitAttribute])
		ifTrue: [outStream nextPut: $*]
		ifFalse: [
			aParameter isPltGenericInstance 
				ifTrue: [
					outStream nextPut: $#.
					outStream nextPutAll: aParameter persistentLabel]
				ifFalse: [aParameter acceptTry: self]. 
			(p21Syntax not or: [self annote])
				ifTrue: [ | ann |
					ann := anExplicitAttribute ifNil: ['?'] ifNotNil: [anExplicitAttribute annotation].
					outStream nextPutAll: ' <' , ann, '>']].

]

{ #category : #'visit expressions schema' }
PlatypusModelContentsStepWriter >> acceptPiConstant: e [ 
	self nextPutAll: 'PI'
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsStepWriter >> acceptRealLiteral: e [ 
	self nextPutAll: e val printString
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsStepWriter >> acceptRedefinedAttributeValue: e [ 
	self nextPut: $*
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptSimpleRecord: e [ 
	self acceptTry: e definition.
	(p21Syntax not
			and: [e definitionOk])
		ifTrue: [outStream nextPut: Character tab].
	self nextPut: $(.
	self
		acceptAllParameters: e parameters copy
		definition: e definition referenced
		fromSimpleRecord: true.
	(p21Syntax not	and: [e parameters notEmpty and: [e definitionOk]])
		ifTrue: [outStream nextPut: Character tab].
	self nextPut: $)
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsStepWriter >> acceptStringLiteral: e [ 
	self nextPutAllString: e asClearText
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsStepWriter >> acceptTrueConstant: e [ 
	self nextPutAll: '.T.'
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsStepWriter >> acceptTypedExpression: e [ 
	e domain
		ifNotNil: [self nextPutAll: e domain name asUppercase;
				 nextPut: $(].
	e expr acceptTry: self.
	e domain
		ifNotNil: [self nextPut: $)]
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsStepWriter >> acceptUnknownConstant: e [ 
	self nextPutAll: '.U.'
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptUserDefinedApplicationInstance: e [ 
	self nextPut: $#;
		 nextPutAll: e persistentLabel;
		 nextPut: $!;
		 nextPutAll: e name;
		 nextPut: $(.
	e parameters acceptTry: self 
		separatedBy: [self nextPut: $,].
	self nextPutAll: ');'
]

{ #category : #'visit population schema' }
PlatypusModelContentsStepWriter >> acceptUserDefinedHeaderInstance: e [ 
	self nextPutAll: e name;
		 nextPut: $(.
	e parameters acceptTry: self 
		separatedBy: [self nextPut: $,].
	self nextPutAll: ');'
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> annote [
	^ annote ifNil: [annote := false]
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> annote: aBoolean [
	annote := aBoolean
]

{ #category : #'initialize/release' }
PlatypusModelContentsStepWriter >> initialize [
	super initialize.
	p21Syntax := true.
	tokenClassifier := PlatypusExpressTokenClassifier new
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> modelContents [
	^modelContents
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> modelContents: anObject [
	modelContents := anObject
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> nextPut: aCharacter [ 
	"| tokenClass |
	tokenClass := tokenClassifier
				tokenClassFromCharacter: aCharacter
				ifAbsent: [].
	outStream
		withStyleFor: tokenClass
		do: [outStream nextPut: aCharacter]"
		outStream nextPut: aCharacter
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> nextPutAll: aString [ 
	"| tokenClass |
	tokenClass := tokenClassifier
				tokenClassFromString: aString
				ifAbsent: [].
	outStream
		withStyleFor: tokenClass
		do: [outStream nextPutAll: aString]."
	outStream nextPutAll: aString
]

{ #category : #'visit generic' }
PlatypusModelContentsStepWriter >> nextPutAllString: aString [ 
	self nextPutAll: ''''
			, (aString copyReplaceAll: '''' with: '''''') , ''''
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> outStream [
	^outStream
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> outStream: anObject [
	outStream := anObject
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> p21Syntax: useP21Syntax [ 
	p21Syntax := useP21Syntax
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> stream: anOutputStream modelContents: aModelContents instance: anInstance p21Syntax: useP21Syntax [ 
	self outStream: anOutputStream.
	self modelContents: aModelContents.
	self p21Syntax: useP21Syntax.
	self acceptTry: anInstance
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> stream: anOutputStream modelContents: aModelContents instance: anInstance p21Syntax: useP21Syntax annote: withTypeAnnotations [
	self outStream: anOutputStream.
	self modelContents: aModelContents.
	self p21Syntax: useP21Syntax.
	self annote: withTypeAnnotations.
	self acceptTry: anInstance
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> stream: anOutputStream modelContents: aModelContents p21Syntax: useP21Syntax [ 
	| hinstances instances dateTime |
	self modelContents: aModelContents.
	p21Syntax := useP21Syntax.
	hinstances := modelContents headerInstances.
	instances := modelContents dataInstances.
	outStream := anOutputStream.
	outStream nextPutAll: 'ISO-10303-21;\HEADER;\' withCRs.
	hinstances acceptTry: self 
				separatedBy: [outStream nextPut: Character cr].
	(hinstances isNil
			or: [(hinstances
					anySatisfy: [:hi | hi isPltFileName]) not])
		ifTrue: [dateTime := Time dateAndTimeNow.
			self nextPutAll: String cr , 'FILE_NAME(''<name>'', ''' , dateTime first yyyymmdd asString , ' ' , dateTime second asString , ''', (''<author>''), (''<organisation>''), ''<preprocessor version>'', ''<originating system>'', ''<authorization>'');'].
	(hinstances isNil
			or: [(hinstances
					anySatisfy: [:hi | hi isPltFileSchema]) not])
		ifTrue: [self nextPutAll: String cr , 'FILE_SCHEMA(('.
			self modelContents owner schemata
				do: [:sch | self nextPutAllString: sch name]
				separatedBy: [outStream nextPut: $,].
			outStream nextPutAll: '));'].
	(hinstances isNil
			or: [(hinstances
					anySatisfy: [:hi | hi isPltFileDescription]) not])
		ifTrue: [self nextPutAll: String cr , 'FILE_DESCRIPTION((''<description1>'', ''<description 2>''), ''<implementation level>''); '].
	outStream nextPutAll: '\ENDSEC;\DATA;\' withCRs.
	instances acceptTry: self 
				separatedBy: [outStream nextPut: Character cr].
			outStream nextPut: Character cr.
	outStream nextPutAll: 'ENDSEC;\END-ISO-10303-21;\' withCRs
]

{ #category : #accessing }
PlatypusModelContentsStepWriter >> stream: anOutputStream modelContents: aModelContents values: values p21Syntax: useP21Syntax [ 
	self modelContents: aModelContents.
	outStream := anOutputStream.
	p21Syntax := useP21Syntax.
	values 
		acceptTry: self 
		separatedBy: [outStream nextPut: Character cr]
]
