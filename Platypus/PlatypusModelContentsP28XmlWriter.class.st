Class {
	#name : #PlatypusModelContentsP28XmlWriter,
	#superclass : #PlatypusStepOnePassAbstractVisitor,
	#instVars : [
		'outStream',
		'p21Syntax',
		'tokenClassifier',
		'modelContents'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'visit aggregate data schema' }
PlatypusModelContentsP28XmlWriter >> acceptAggregateData: e [ 
	self nextPut: $(.
	self halt.
	e contents acceptTry: self 
		separatedBy: [self nextPut: $,].
	self nextPut: $)
]

{ #category : #'visit aggregate data schema' }
PlatypusModelContentsP28XmlWriter >> acceptAggregateInstance: e [ 
	self nextPut: $(.
	e contents acceptTry: self 
		separatedBy: [self nextPut: $,].
	self nextPut: $)
]

{ #category : #accessing }
PlatypusModelContentsP28XmlWriter >> acceptAllParameters: parameters definition: definition fromSimpleRecord: fromSimpleRecord [ 
	| pos attributes attr |
	(p21Syntax
			or: [definition isNil])
		ifTrue: ["visitPath first persistentLabel = '7' 
			ifTrue: [self halt]."
			parameters acceptTry: self 
				separatedBy: [self nextPut: $,]]
		ifFalse: [pos := 1.
			attributes := fromSimpleRecord
						ifTrue: [definition explicitAttributes]
						ifFalse: [definition inheritedExplicitAttributes].
			parameters
				ifNotEmpty: [:arg | 
					outStream nextPut: Character cr.
					parameters
						do: [:param | pos <= attributes size
								ifTrue: [attr := attributes at: pos.
									outStream nextPut: Character tab.
									fromSimpleRecord
										ifTrue: [outStream nextPut: Character tab].
									self
										doSimpleTagNamed: attr name
										while: [outStream
												withStyleFor: PlatypusKeywordToken
												do: [outStream nextPutAll: attr name]].
									pos := pos + 1]]
						separatedBy: [outStream nextPut: Character cr].
					outStream nextPut: Character cr]]
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsP28XmlWriter >> acceptEConstant: e [ 
	self nextPutAll: 'E' 
]

{ #category : #'visit population schema' }
PlatypusModelContentsP28XmlWriter >> acceptEntityDefinitionReference: e [ 
	e ref ifNil: 
			[outStream withStyleFor: PlatypusUnresolvedReferenceToken
				do: [outStream nextPutAll: e name asUppercase]]
		ifNotNil: 
			[outStream withStyleFor: PlatypusPrimaryElementOpenKeywordToken
				do: [outStream nextPutAll: e ref name asUppercase]]
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsP28XmlWriter >> acceptEnumerationValue: e [ 
	self nextPutAll: '.', e element asUppercase, '.'.

]

{ #category : #'visit population schema' }
PlatypusModelContentsP28XmlWriter >> acceptExternalGroupRepresentation: e [ 
 	self acceptExternalInstance: e
]

{ #category : #'visit population schema' }
PlatypusModelContentsP28XmlWriter >> acceptExternalInstance: e [ 
	self acceptGenericInstance: e.
	self nextPutAll: '('.
	e records size > 1
		ifTrue: [self nextPutAll: String cr , String tab].
	e records acceptTry: self 
		separatedBy: [self nextPutAll: String cr , String tab].
	e records size > 1
		ifTrue: [self nextPutAll: String cr].
	self nextPutAll: ');'
]

{ #category : #'visit population schema' }
PlatypusModelContentsP28XmlWriter >> acceptExternalRepresentation: e [ 
	self acceptExternalInstance: e
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsP28XmlWriter >> acceptFalseConstant: e [ 
	self nextPutAll: '.F.'
]

{ #category : #'visit population schema' }
PlatypusModelContentsP28XmlWriter >> acceptFileDescription: e [ 
	self nextPutAll: 'FILE_DESCRIPTION(('.
	e description
		do: [:desc | self nextPutAllString: desc]
		separatedBy: [self nextPut: $,].
	self nextPutAll: '),'.
	self nextPutAllString: e implementationLevel.
	self nextPutAll: ');'.
]

{ #category : #'visit population schema' }
PlatypusModelContentsP28XmlWriter >> acceptFileName: e [ 
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
PlatypusModelContentsP28XmlWriter >> acceptFileSchema: e [ 
	self nextPutAll: 'FILE_SCHEMA(('.
	e schemaIdentifiers
		do: [:a | self nextPutAllString: a]
		separatedBy: [self nextPut: $,].
	self nextPutAll: '));'
]

{ #category : #'visit population schema' }
PlatypusModelContentsP28XmlWriter >> acceptGenericInstance: e [ 
	outStream withStyleFor: PlatypusDelimToken
		do: 
			[outStream nextPut: $#.
			outStream nextPutAll: e persistentLabel asString].
	self nextPut: $=.
	e instanceScope ifNotNil: [e instanceScope acceptTry: self]
]

{ #category : #'visit population schema' }
PlatypusModelContentsP28XmlWriter >> acceptInstanceScope: e [ 
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
PlatypusModelContentsP28XmlWriter >> acceptIntegerLiteral: e [ 
	self nextPutAll: e val printString
]

{ #category : #'visit population schema' }
PlatypusModelContentsP28XmlWriter >> acceptInternalGroupRepresentation: e [ 
	self acceptInternalInstance: e
]

{ #category : #'visit population schema' }
PlatypusModelContentsP28XmlWriter >> acceptInternalInstance: e [ 
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
PlatypusModelContentsP28XmlWriter >> acceptInternalRepresentation: e [ 
	self acceptInternalInstance: e 

]

{ #category : #'visit expressions schema' }
PlatypusModelContentsP28XmlWriter >> acceptMissingValue: e [ 
	self nextPut: $$
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsP28XmlWriter >> acceptPiConstant: e [ 
	self nextPutAll: 'PI'
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsP28XmlWriter >> acceptRealLiteral: e [ 
	self nextPutAll: e val printString
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsP28XmlWriter >> acceptRedefinedAttributeValue: e [ 
	self nextPut: $*
]

{ #category : #'visit population schema' }
PlatypusModelContentsP28XmlWriter >> acceptSimpleRecord: e [ 
	self acceptTry: e definition.
	(p21Syntax not
			and: [e definitionOk])
		ifTrue: [outStream nextPut: Character tab].
	self nextPut: $(.
	self
		acceptAllParameters: e parameters copy
		definition: e definition referenced
		fromSimpleRecord: true.
	(p21Syntax not
			and: [e definitionOk])
		ifTrue: [outStream nextPut: Character tab].
	self nextPut: $)
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsP28XmlWriter >> acceptStringLiteral: e [ 
	self nextPutAllString: e asClearText
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsP28XmlWriter >> acceptTrueConstant: e [ 
	self nextPutAll: '.T.'
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsP28XmlWriter >> acceptTypedExpression: e [ 
	e domain
		ifNotNil: [self nextPutAll: e domain name asUppercase;
				 nextPut: $(].
	e expr acceptTry: self.
	e domain
		ifNotNil: [self nextPut: $)]
]

{ #category : #'visit expressions schema' }
PlatypusModelContentsP28XmlWriter >> acceptUnknownConstant: e [ 
	self nextPutAll: '.U.'
]

{ #category : #'visit population schema' }
PlatypusModelContentsP28XmlWriter >> acceptUserDefinedApplicationInstance: e [ 
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
PlatypusModelContentsP28XmlWriter >> acceptUserDefinedHeaderInstance: e [ 
	self nextPutAll: e name;
		 nextPut: $(.
	e parameters acceptTry: self 
		separatedBy: [self nextPut: $,].
	self nextPutAll: ');'
]

{ #category : #accessing }
PlatypusModelContentsP28XmlWriter >> doSimpleTagNamed: tagName while: aBlock [ 
	outStream nextPutAll: '<'.
	outStream withStyleFor: PlatypusKeywordToken
		do: [outStream nextPutAll: tagName].
	outStream nextPutAll: '>'.
	aBlock value.
	outStream nextPutAll: '</'.
	outStream withStyleFor: PlatypusKeywordToken
		do: [outStream nextPutAll: tagName].
	outStream nextPutAll: '>'
]

{ #category : #'initialize/release' }
PlatypusModelContentsP28XmlWriter >> initialize [
	super initialize.
	p21Syntax := true.
	tokenClassifier := PlatypusExpressTokenClassifier new
]

{ #category : #accessing }
PlatypusModelContentsP28XmlWriter >> modelContents [
	^modelContents
]

{ #category : #accessing }
PlatypusModelContentsP28XmlWriter >> modelContents: anObject [
	modelContents := anObject
]

{ #category : #accessing }
PlatypusModelContentsP28XmlWriter >> nextPut: aCharacter [
	| tokenClass |
	tokenClass := tokenClassifier tokenClassFromCharacter: aCharacter
	ifAbsent: [].
	outStream withStyleFor: tokenClass do: [outStream nextPut: aCharacter]
]

{ #category : #accessing }
PlatypusModelContentsP28XmlWriter >> nextPutAll: aString [ 
	| tokenClass |
	tokenClass := tokenClassifier
				tokenClassFromString: aString
				ifAbsent: [].
	outStream
		withStyleFor: tokenClass
		do: [outStream nextPutAll: aString]
]

{ #category : #'visit generic' }
PlatypusModelContentsP28XmlWriter >> nextPutAllString: aString [ 
	self nextPutAll: ''''
			, (aString copyReplaceAll: '''' with: '''''') , ''''
]

{ #category : #accessing }
PlatypusModelContentsP28XmlWriter >> outStream [
	^outStream
]

{ #category : #accessing }
PlatypusModelContentsP28XmlWriter >> outStream: anObject [
	outStream := anObject
]

{ #category : #accessing }
PlatypusModelContentsP28XmlWriter >> stream: anOutputStream modelContents: aModelContents p21Syntax: useP21Syntax [ 
	| hinstances instances dateTime |
	self modelContents: aModelContents.
	p21Syntax := useP21Syntax.
	hinstances := modelContents headerInstances.
	instances := modelContents dataInstances.
	Cursor write
		showWhile: [outStream := anOutputStream.
			outStream
				withStyleFor: PlatypusDelimToken
				do: [outStream nextPutAll: 'ISO-10303-21;\HEADER;\' withCRs].
			hinstances
						acceptTry: self
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
			outStream
				withStyleFor: PlatypusDelimToken
				do: [outStream nextPutAll: '\ENDSEC;\DATA;\' withCRs].
			instances acceptTry: self 
						separatedBy: [outStream nextPut: Character cr].
					outStream nextPut: Character cr.
			outStream
				withStyleFor: PlatypusDelimToken
				do: [outStream nextPutAll: 'ENDSEC;\END-ISO-10303-21;\' withCRs]]
]

{ #category : #accessing }
PlatypusModelContentsP28XmlWriter >> stream: anOutputStream modelContents: aModelContents values: values p21Syntax: useP21Syntax [ 
	self modelContents: aModelContents.
	outStream := anOutputStream.
	p21Syntax := useP21Syntax.
	Cursor write
		showWhile: [values acceptTry: self 
				separatedBy: [outStream nextPut: Character cr]]
]
