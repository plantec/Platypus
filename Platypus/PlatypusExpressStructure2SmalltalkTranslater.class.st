Class {
	#name : #PlatypusExpressStructure2SmalltalkTranslater,
	#superclass : #PlatypusExpressTranslater,
	#instVars : [
		'translationsDone',
		'namesBuilder',
		'localTranslationOnly',
		'schemaInstance'
	],
	#category : #'Platypus-HW-translater-private'
}

{ #category : #'instance creation' }
PlatypusExpressStructure2SmalltalkTranslater class >> namesBuilder: aNamesBuilder [
	^ self new namesBuilder: aNamesBuilder
]

{ #category : #accessing }
PlatypusExpressStructure2SmalltalkTranslater class >> translaterRequiredAspects [
	^ #(
		#classPrefix
		#systemCategoryPrefix
		#rootClassName
		#rootClassSystemCategory
	)
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> acceptDerivedAttribute: e [ 
	(translationsDone includes: e)
		ifFalse: [translationsDone add: e.
			self doDerivedAttribute: e.
			]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> acceptEntityDefinition: e [ 
	(translationsDone includes: e)
		ifFalse: [translationsDone add: e.
			schemaInstance = e schemaInstance
				ifTrue: [self doEntityDefinition: e.
					super acceptEntityDefinition: e]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> acceptExplicitAttribute: e [ 
	(translationsDone includes: e)
		ifFalse: [translationsDone add: e.
			self doExplicitAttribute: e.
			]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> acceptFunctionDeclaration: e [ 
	(translationsDone includes: e)
		ifFalse: [translationsDone add: e.
			self doAlgorithmDeclaration: e]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> acceptGlobalRule: e [ 
	(translationsDone includes: e)
		ifFalse: [translationsDone add: e.
			self doGlobalRule: e]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> acceptInverseAttribute: e [ 
	(translationsDone includes: e)
		ifFalse: [translationsDone add: e.
			self doInverseAttribute: e]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> acceptProcedureDeclaration: e [ 
	(translationsDone includes: e)
		ifFalse: [translationsDone add: e.
			self doAlgorithmDeclaration: e]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> acceptSchemaDefinition: e [ 
	(translationsDone includes: e) 
		ifFalse: 
			[translationsDone add: e.
			self doSchemaDefinition: e.self localTranslationOnly ifFalse: [
			super acceptSchemaDefinition: e]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> acceptSchemaInstance: e [ 
	(translationsDone includes: e)
		ifFalse: [translationsDone add: e.
			self doSchemaInstance: e.
			e internalSchemata
				do: [:sch | sch acceptTry: self]]
]

{ #category : #'visit generic' }
PlatypusExpressStructure2SmalltalkTranslater >> acceptTry: e [
	schemaInstance
		ifNil: [schemaInstance := e schemaInstance].
	^ super acceptTry: e

]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> acceptWhereRule: e [ 
	(translationsDone includes: e) 
		ifFalse: 
			[translationsDone add: e.
			self doWhereRule: e]
]

{ #category : #'generating from algorithm' }
PlatypusExpressStructure2SmalltalkTranslater >> buildAlgorithmCodeFrom: e [ 
	| clsName invoquing paramInfos localInfos count ln allInfos affect code |
	clsName := e generatedClassName.
	paramInfos := self namesBuilder normalizedAlgorithmFormalParametersInfosFrom: e.
	localInfos := self namesBuilder normalizedAlgorithmLocalVariablesInfosFrom: e.
	allInfos := paramInfos asOrderedCollection , localInfos.
	invoquing := self namesBuilder functionInvokingFrom: e.
	paramInfos isEmpty
		ifFalse: [paramInfos size < 6
				ifTrue: [self
						fileOutMethodSource: invoquing , '	^ self new ' , invoquing
						className: clsName
						meta: false
						category: 'instance-creation'.
					count := 0.
					code := ''.
					paramInfos
						do: [:sp | 
							count := count + 1.
							code := code , '	self ' , sp first , ':  (values at: ' , count asString , ').'].
					self
						fileOutMethodSource: 'fromValues: values ' , code
						className: clsName
						meta: false
						category: 'accessing'.
					paramInfos size > 1
						ifTrue: [code := ''.
							paramInfos
								do: [:sp | code := code , '	self ' , sp first , ': ' , sp second , '.'].
							self
								fileOutMethodSource: invoquing , code
								className: clsName
								meta: false
								category: 'accessing']]].
	allInfos isEmpty
		ifFalse: [allInfos
				do: [:sp | 
					affect := (sp fourth isPltAggregationType
									and: [sp third])
								ifTrue: [sp second , ' ifNil: ['
										, (self namesBuilder smalltalkInitializingExpressionOf: sp fourth) , '] ifNotNil: [' , sp second , ' as: '
										, (self namesBuilder smalltalkTypeOf: sp fourth) , ']']
								ifFalse: [sp second].
					code := '	' , sp first , ' := ' , affect.
					self
						fileOutMethodSource: sp first , ': ' , sp second , '  ' , code
						className: clsName
						meta: false
						category: 'accessing'].
			allInfos
				do: [:sp | self
						fileOutMethodSource: sp first , '	 ^' , sp first
						className: clsName
						meta: false
						category: 'accessing']].
	code := '" ---------- locals assignments ----------"'.
	(e locals
		select: [:l | l initializer notNil])
		do: [:l | 
			ln := self namesBuilder normalizedVarNameFrom: l name.
			code := code , 'self ' , ln , ': (' , (self expressionTranslaterClass 
							accept: l initializer
							fromTranslater: self
							resultStream: (WriteStream on: String new)) result.
			code := code , ').'].
	code := code , '" ---------- statements ----------"'.
	e statements
		do: [:stmt | code := code , (self statementTranslaterClass
							accept: stmt
							fromTranslater: self
							resultStream: (WriteStream on: String new)) result].
	self
		fileOutMethodSource: 'invoke ' , code
		className: clsName
		meta: false
		category: 'invoking'
]

{ #category : #'generating from entity' }
PlatypusExpressStructure2SmalltalkTranslater >> buildClassificationMethodFromEntity: e [ 
	| selector clsName |
	clsName := e generatedClassName.
	selector := 'is' , clsName.
	self 
		fileOutMethodSource: selector , ' ' , '^ true'
		className: clsName
		meta: false
		category: 'classifying'.
	self 
		fileOutMethodSource: selector , ' ' , '^ false'
		className: self rootClassName
		meta: false
		packageName: self rootClassSystemCategory
		category: (self mcCategory: ((e schemaDefinition  systemCategoryFromNamesBuilder: self namesBuilder) , '-classifying' ))
]

{ #category : #'generating from schema' }
PlatypusExpressStructure2SmalltalkTranslater >> buildContextAccessingMethodsFromSchema: e [ 
	| selector clsName |
	clsName := e generatedClassName.
	selector := 'context'.
		self 
					fileOutMethodSource: selector , '	^ self schemaInstance context' 
					className: clsName
					meta: false
					category: 'context-accessing'
]

{ #category : #'generating from schemaInstance' }
PlatypusExpressStructure2SmalltalkTranslater >> buildContextAccessingMethodsFromSchemaInstance: e [ 
	| clsName |
	clsName := e generatedClassName.
	self 
		fileOutMethodSource: 'context	^context'
		className: clsName
		meta: false
		category: 'context-accessing'.
	self 
		fileOutMethodSource: 'context:  aContext context := aContext. super context: aContext'
		className: clsName
		meta: false
		category: 'context-accessing'
]

{ #category : #'generating from entity' }
PlatypusExpressStructure2SmalltalkTranslater >> buildCopyGroupToMethodFromEntity: e [ 
	| arg1vn arg2vn selector1 selector2 code |
	arg1vn := self namesBuilder localVarName: 'aClassSymbol' inScope: e.
	arg2vn := self namesBuilder localVarName: 'anObject' inScope: e.
	selector1 := 'pltCopyGroup:'.
	selector2 := 'to: '.
	code :=  '	self class name == ' , arg1vn , ' ifTrue: [self pltCopyTo: ' , arg2vn , '] ifFalse: [super ' , selector1 , ' ' , arg1vn , ' ' , selector2 , ' ', arg2vn , ']'.
			
		self 
		fileOutMethodSource: (selector1 , arg1vn , ' ' , selector2 , arg2vn , ' ', code)
		className: e generatedClassName 
		meta: false
		category: 'copying'
]

{ #category : #'generating from entity' }
PlatypusExpressStructure2SmalltalkTranslater >> buildCopyToMethodFromEntity: e [ 
	| selector clsName argvn code localCopyMthName |
	clsName := e generatedClassName.
	localCopyMthName := self namesBuilder localCopyMethodNameFromEntity: e.
	argvn := self namesBuilder localVarName: 'another' inScope: e.
	selector := 'pltCopyTo:'.
	code := '	super pltCopyTo: ' , argvn , '. self ', localCopyMthName,  ' ', argvn 
				, '.'.
	self 
		fileOutMethodSource: selector , argvn , ' ' , code
		className: clsName
		meta: false
		category: 'copying'
]

{ #category : #'generating from schema' }
PlatypusExpressStructure2SmalltalkTranslater >> buildEntitiesMethodsFromSchema: e [ 
	| clsName cpt buildSelector prefix |
	clsName := e generatedClassName.
	prefix := 'entityDefinition'.
	cpt := 0.
	e entities do: 
			[:elem | 
			cpt := cpt + 1.
			buildSelector := prefix , cpt asString.
			self 
				fileOutMethodSource: buildSelector , '^ #( #''' , elem name , ''' #' 
						, (elem generatedClassNameFromNamesBuilder: self namesBuilder) , ' )'
				className: clsName
				meta: false
				category: 'entities'].
	buildSelector := prefix , 'Count'.
	self 
		fileOutMethodSource: buildSelector , ' ^ ' , cpt asString
		className: clsName
		meta: false
		category: 'entities'
]

{ #category : #'generating from schemaInstance' }
PlatypusExpressStructure2SmalltalkTranslater >> buildExpressMetaSchemaCodeMethodFromSchemaInstance: e [ 
	self
		buildExpressMetaSchemaCodeMethodFromSchemaInstance: e
		intoClassNamed: (e generatedClassName)
]

{ #category : #'generating from schemaInstance' }
PlatypusExpressStructure2SmalltalkTranslater >> buildExpressSchemaCodeMethodFromSchemaInstance: e [ 
	self
		buildExpressSchemaCodeMethodFromSchemaInstance: e
		intoClassNamed: (e generatedClassName)
]

{ #category : #'generating from schemaInstance' }
PlatypusExpressStructure2SmalltalkTranslater >> buildExpressSchemaCodeMethodFromSchemaInstance: e intoClassNamed: aClassName [ 
	| express |
	express := e translatedSchemaCode.
	self
		fileInSplittedBaseSelector: 'expressSchemaCode'
		contents: express
		className: aClassName
		category: 'schema-accessing'
		step: 200
		meta: false
]

{ #category : #'generating from schemaInstance' }
PlatypusExpressStructure2SmalltalkTranslater >> buildExternalsSchemaInstancesMethodFromSchemaInstance: e [ 
	| selector clsName code |
	clsName := e generatedClassName.
	selector := 'externalSchemaInstanceClassNames'.
	code := '	^ #('.
	e externalSchemaInstances 
		do: [:s | code := code, '	#' , s generatedClassName].
code := code, ')'.	self 
		fileOutMethodSource: selector,  ' ', code
		className: clsName
		meta: false
		category: 'accessing'.
		

]

{ #category : #'generating from schema' }
PlatypusExpressStructure2SmalltalkTranslater >> buildFunctionsMethodsFromSchema: e [ 
	| clsName cpt buildSelector prefix |
	clsName := e generatedClassName.
	prefix := 'functionDeclaration'.
	cpt := 0.
	e functionDeclarations do: 
			[:elem | 
			cpt := cpt + 1.
			buildSelector := prefix , cpt asString.
			self 
				fileOutMethodSource: buildSelector , ' ^ #( #''' , elem name , ''' #' 
						, (elem generatedClassNameFromNamesBuilder: self namesBuilder) , ' )'
				className: clsName
				meta: false
				category: 'functions'].
	buildSelector := prefix , 'Count'.
	self 
		fileOutMethodSource: buildSelector , ' ^ ' , cpt asString
		className: clsName
		meta: false
		category: 'functions'.

]

{ #category : #'generating from attribute' }
PlatypusExpressStructure2SmalltalkTranslater >> buildGetAccessorMethodFromDerivedAttribute: e [ 
	| selector clsName contextvn calledSelector receivervn receiverPart code |
	clsName := e generatedClassName.
	selector := e getSelectorWithContextArgFromNamesBuilder: self namesBuilder.
	receiverPart := 'receiver:'.
	contextvn := self namesBuilder contextArgNameFromAttribute: e.
	receivervn := self namesBuilder receiverArgNameFromAttribute: e.
	self
		fileOutMethodSource: selector , contextvn , '	^ self ' , selector , ' ' , contextvn , ' ' , receiverPart , ' self'
		className: clsName
		meta: false
		category: 'deriving'.
	code := (self expressionTranslaterClass
				receiverName: receivervn
				accept: e assign
				fromTranslater: self
				resultStream: (WriteStream on: String new)) result.
	self
		fileOutMethodSource: selector , ' ' , contextvn , ' ' , receiverPart , ' ' , receivervn , ' ^' , code
		className: clsName
		meta: false
		category: 'deriving'.
	calledSelector := selector.
	selector := e getSelectorFromNamesBuilder: self namesBuilder.
	self
		fileOutMethodSource: selector , '	^ self ' , calledSelector , self contextAccessingCode
		className: clsName
		meta: false
		category: 'deriving'
]

{ #category : #'generating from attribute' }
PlatypusExpressStructure2SmalltalkTranslater >> buildGetAccessorMethodFromInverseAttribute: e [ 
	| selector clsName invertedAttrOwnerClassName invertedAttrGetterSelector foundvn currvn contextvn cmp calledSelector code |
	clsName := e generatedClassName.
	selector := e getSelectorWithContextArgFromNamesBuilder: self namesBuilder.
	contextvn := self namesBuilder contextArgNameFromAttribute: e.
	invertedAttrOwnerClassName := e invertedAttr ref generatedClassNameFromNamesBuilder: self namesBuilder.
	invertedAttrGetterSelector := e invertedAttr ref getSelectorFromNamesBuilder: self namesBuilder.
	currvn := self namesBuilder localVarName: 'curr' inScope: e owner.
	e minCardinality
		ifNil: [e invertedAttr ref domain isPltAggregationType
				ifTrue: [cmp := 'includes: ']
				ifFalse: [cmp := ' = '].
			code := contextvn , '  allInstancesOf: ' , invertedAttrOwnerClassName , ' do: [ :repo :inst |  ((inst ' , invertedAttrGetterSelector , ') ' , cmp , ' self) ifTrue: [^ inst ]]. ^ nil']
		ifNotNil: [foundvn := self namesBuilder localVarName: 'founds' inScope: e owner.
			code := '	| ' , foundvn , ' |'.
			e duplicates
				ifTrue: [code := code , ' ' , foundvn , ' := Bag new.']
				ifFalse: [code := code , ' ' , foundvn , ' := Set new.'].
			code := code , contextvn , '  allInstancesOf: ' , invertedAttrOwnerClassName , ' do: [ :repo :inst |  | ' , currvn , ' |	(' , currvn , ' := inst ' , invertedAttrGetterSelector , ') == self ifTrue: [' , foundvn , ' add: ' , currvn , ']].' , ' ^ ' , foundvn].
	self
		fileOutMethodSource: selector , ' ' , contextvn , ' ' , code
		className: clsName
		meta: false
		category: 'inverse-accessing'.
	selector := e getSelectorFromNamesBuilder: self namesBuilder.
	calledSelector := e getSelectorWithContextArgFromNamesBuilder: self namesBuilder.
	self
		fileOutMethodSource: selector , '	^ self ' , calledSelector , self contextAccessingCode
		className: clsName
		meta: false
		category: 'inverse-accessing'
]

{ #category : #'generating from attribute' }
PlatypusExpressStructure2SmalltalkTranslater >> buildGetAccessorMethodFromWhereRule: e [ 
	| selector clsName contextvn calledSelector code |
	clsName := e generatedClassName.
	selector := e getSelectorWithContextArgFromNamesBuilder: self namesBuilder.
	contextvn :=  'aContext'.
	code := '	^ ' , (self expressionTranslaterClass
					accept: e whereValue
					fromTranslater: self
					resultStream: (WriteStream on: String new)) result.
	self
		fileOutMethodSource: selector , contextvn , code
		className: clsName
		meta: false
		category: 'rules'.
	calledSelector := selector.
	selector := e getSelectorFromNamesBuilder: self namesBuilder.
	self
		fileOutMethodSource: selector , '	^ self ' , calledSelector , self contextAccessingCode
		className: clsName
		meta: false
		category: 'rules'
]

{ #category : #'generating from attribute' }
PlatypusExpressStructure2SmalltalkTranslater >> buildGetAndSetAccessorMethodFromExpliciteAttribute: e [ 
	| vname argName selector lowSet clsName getSelector |
	vname := e instVarNameFromNamesBuilder: self namesBuilder.
	clsName := e generatedClassName.
	argName := self namesBuilder argNameFor: e domain scopeMetaData: e owner.
	lowSet := self lowSetExpressionFromAttribute: e.
	selector := e getSelectorFromNamesBuilder: self namesBuilder.
	self 
					fileOutMethodSource: selector , '	 ^' , vname
					className: clsName
					meta: false
					category: 'accessing'.
	selector := e setSelectorFromNamesBuilder: self namesBuilder.
	self 
					fileOutMethodSource: selector , argName , '	self ' 
							, (e lowSetSelectorFromNamesBuilder: self namesBuilder) , argName
					className: clsName
					meta: false
					category: 'set-accessing'.
	selector := e lowSetSelectorFromNamesBuilder: self namesBuilder.
	self 
					fileOutMethodSource: selector , argName , '	' , vname , ' := ' , lowSet
					className: clsName
					meta: false
					category: 'accessing'.
	selector := e fastSetSelectorFromNamesBuilder: self namesBuilder.
	self 
					fileOutMethodSource: selector , argName , '	' , vname , ' := ' , argName
					className: clsName
					meta: false
					category: 'fast-set-accessing'.
	selector := e getSelectorWithContextArgFromNamesBuilder: self namesBuilder.
	argName := self namesBuilder contextArgNameFromAttribute: e.
	getSelector := e getSelectorFromNamesBuilder: self namesBuilder.
self 
					fileOutMethodSource: selector , argName , '	^ self ' , getSelector
					className: clsName
					meta: false
					category: 'with-context-accessing'
]

{ #category : #'generating from algorithm' }
PlatypusExpressStructure2SmalltalkTranslater >> buildGlobalRuleAccessingFrom: e [ 
	|  clsName localInfos affect code|
	clsName := e generatedClassName.
	localInfos := self namesBuilder normalizedAlgorithmLocalVariablesInfosFrom: e.
	localInfos
				do: [:sp | 
					affect := (sp fourth isPltAggregationType
									and: [sp third])
								ifTrue: [sp second , ' ifNil: ['
										, (self namesBuilder smalltalkInitializingExpressionOf: sp fourth) , '] ifNotNil: [' , sp second , ' as: '
										, (self namesBuilder smalltalkTypeOf: sp fourth) , ']']
								ifFalse: [sp second].
					code := '	' , sp first , ' := ' , affect.
					self
						fileOutMethodSource: sp first , ': ' , sp second , '  ' , code
						className: clsName
						meta: false
						category: 'accessing'].
			localInfos
				do: [:sp | self
						fileOutMethodSource: sp first , '	 ^' , sp first
						className: clsName
						meta: false
						category: 'accessing']
]

{ #category : #'generating from algorithm' }
PlatypusExpressStructure2SmalltalkTranslater >> buildGlobalRuleInitializeFrom: e [ 
	| code clsName |
	clsName := e generatedClassName.
	code := String cr, String tab, 'super initialize.', String cr.
	code := code, String tab, '" ---------- locals assignments ----------"'.
	(e locals select: [:l | l initializer notNil])
		do: [:l | | ln |
			ln := self namesBuilder normalizedVarNameFrom: l name.
			code := code , String cr, String tab, 'self ' , ln , ': (' , (self expressionTranslaterClass 
							accept: l initializer
							fromTranslater: self
							resultStream: (WriteStream on: String new)) result.
			code := code , ').'].
	e forEntities isEmpty
		ifFalse: [
			code := code, String cr, String tab, '" ---------- entity instance set assignments ----------"'.
			code := code, (String 
				streamContents: [:strm | 
					e forEntities do: [:fe | | ent |
						ent := fe entityRef ref. 
						strm nextPutAll: String cr, String tab, fe name, ' := self myContext allInstancesOf: ', ent generatedClassName, '.']])].	
	self
		fileOutMethodSource: 'initialize' , code
		className: clsName
		meta: false
		category: 'initializing'
]

{ #category : #'generating from algorithm' }
PlatypusExpressStructure2SmalltalkTranslater >> buildGlobalRuleWhereRulesCodeFrom: e [ 
	| code clsName |
	clsName := e generatedClassName.
	e whereRules do: [:wr | self doWhereRule: wr].
	e whereRules 
		ifNotEmpty: [
			code := String tab, '" ---------- global checking ----------"', String cr, String tab, ' ^ self ', e whereRules first label, ' '.
			e whereRules copyWithoutFirst do: [:wr | code := code, ' and: [ self ', wr label ].
			1 to: (e whereRules size) - 1 do: [:i | code := code, '] '].
			self
				fileOutMethodSource: 'invoke ' , code
				className: clsName
				meta: false
				category: 'invoking']

]

{ #category : #'generating from entity' }
PlatypusExpressStructure2SmalltalkTranslater >> buildInitializeMethodFromEntity: e [ 
	| selector clsName code |
	clsName := e generatedClassName.
	selector := 'stepInitialize'.
	code := '	super ' , selector , '.'.
	e explicitAttributesDo: 
			[:a | 
			code := code , '	' , (self initializeStatementFromAttribute: a)].
	self 
		fileOutMethodSource: selector , ' ' , code
		className: clsName
		meta: false
		category: 'initializing'
]

{ #category : #'generating from schemaInstance' }
PlatypusExpressStructure2SmalltalkTranslater >> buildInitializeMethodFromSchemaInstance: e [ 
	| selector clsName code |
	clsName := e generatedClassName.
	selector := 'initialize'.
	code := '	self reinitializeSingleton. self singleton buildIndexes.'.
	self 
		fileOutMethodSource: selector , ' ' , code
		className: clsName
		meta: true
		category: 'initializing'
]

{ #category : #'generating from entity' }
PlatypusExpressStructure2SmalltalkTranslater >> buildLocalCopyToMethodFromEntity: e [ 
	| selector clsName argvn getterSelector setterSelector code |
	clsName := e generatedClassName.
	argvn := self namesBuilder localVarName: 'another' inScope: e.
	selector := self namesBuilder localCopyMethodNameFromEntity: e.
	code := ''.
	e explicitAttributesDo: 
			[:a | 
			getterSelector := a getSelectorFromNamesBuilder: self namesBuilder.
			setterSelector := a fastSetSelectorFromNamesBuilder: self namesBuilder.
			code := code , '	' , argvn , ' ' , setterSelector , ' (self ' 
						, getterSelector , ').'].
	self 
		fileOutMethodSource: selector , argvn , ' ' , code
		className: clsName
		meta: false
		category: 'copying'.
	self 
		fileOutMethodSource: ('pltLocalCopyTo: ' , argvn , ' self ', selector, argvn)
		className: clsName
		meta: false
		category: 'copying'
]

{ #category : #'generating from entity' }
PlatypusExpressStructure2SmalltalkTranslater >> buildLocalGroupAccessingMethodFromEntity: e [ 
	| clsName setterSelector selectorsAndArgs reservedvn setter argvn localvn getterSelector selector code localFromValuesSelector localToValuesSelector |
	clsName := e generatedClassName.
	selectorsAndArgs := OrderedCollection new.
	reservedvn := OrderedCollection new.
	e explicitAttributesDo: 
			[:a | 
			setter := a lowSetSelectorFromNamesBuilder: self namesBuilder.
			argvn := self namesBuilder 
						argNameFor: a domain
						scopeMetaData: e
						reservedNames: reservedvn.
			selectorsAndArgs add: (Array 
						with: a
						with: setter
						with: argvn)].
	e numberOfExplicitAttributes > 1 
		ifTrue: 
			[selector := ''.
			selectorsAndArgs 
				do: [:selarg | selector := selector , selarg second , ' ' , selarg third]
				separatedBy: [selector := selector , ' '].
			code := ''.
			selectorsAndArgs do: 
					[:selarg | 
					setterSelector := selarg first 
								setSelectorFromNamesBuilder: self namesBuilder.
					code := code , '	self ' , setterSelector , selarg third , '.'].
			false ifTrue: [self 
				fileOutMethodSource: selector , ' ' , code
				className: clsName
				meta: false
				category: 'group-accessing']].
	argvn := self namesBuilder localVarName: 'values' inScope: e.
	localvn := self namesBuilder localVarName: argvn , 'loc' inScope: e.
	code := '	| ' , localvn , ' |' , localvn , ' := ' , argvn 
				, ' asOrderedCollection.'.
	selectorsAndArgs do: 
			[:selarg | 
			setterSelector := selarg first 
						setSelectorFromNamesBuilder: self namesBuilder.
			code := code , '	self ' , setterSelector , localvn , ' removeFirst.'].
	code := code , '	^ ' , localvn.
	localFromValuesSelector := self namesBuilder 
				localFromValuesMethodNameFromEntity: e.
	localToValuesSelector := self namesBuilder 
				localToValuesMethodNameFromEntity: e.
	self 
		fileOutMethodSource: localFromValuesSelector , argvn , ' ' , code
		className: clsName
		meta: false
		category: 'group-accessing'.
	code := ''.
	selectorsAndArgs do: 
			[:selarg | 
			getterSelector := selarg first 
						getSelectorFromNamesBuilder: self namesBuilder.
			code := code , '	' , argvn , ' add: (self ' , getterSelector , ').'].
	code := code , '	^ ' , argvn.
	self 
		fileOutMethodSource: localToValuesSelector , argvn , ' ' , code
		className: clsName
		meta: false
		category: 'group-accessing'.
	code := '	^ self ' , localToValuesSelector , ' (super toValues: ' , argvn 
				, ')'.
	self 
		fileOutMethodSource: 'toValues:' , argvn , ' ' , code
		className: clsName
		meta: false
		category: 'group-accessing'.
	code := '	^ self ' , localFromValuesSelector , ' (super fromValues: ' 
				, argvn , ')'.
	self 
		fileOutMethodSource: 'fromValues:' , argvn , ' ' , code
		className: clsName
		meta: false
		category: 'group-accessing'.
	self 
		fileOutMethodSource: 'localFromValues: ' , argvn , ' ^ self ' , localFromValuesSelector 
				, argvn
		className: clsName
		meta: false
		category: 'group-accessing'.
	self 
		fileOutMethodSource: 'localToValues: ' , argvn , ' ^ self ' , localToValuesSelector 
				, argvn
		className: clsName
		meta: false
		category: 'group-accessing'.

]

{ #category : #'generating from schemaInstance' }
PlatypusExpressStructure2SmalltalkTranslater >> buildMetaDataFileContentsMethodFromSchemaInstance: e [ 
	| clsName metaDataStream |
	clsName := e generatedClassName.
	metaDataStream := WriteStream on: String new.
	e metaDataToStream: metaDataStream.
	self
		fileInSplittedBaseSelector: 'metaDataFileContents'
		contents: metaDataStream contents
		className: clsName
		category: 'meta-data-accessing'
		step: 200
		meta: false
]

{ #category : #'generating from schemaInstance' }
PlatypusExpressStructure2SmalltalkTranslater >> buildNamesBuilderClassNameMethodFromSchemaInstance: e [ 
	| selector clsName |
	clsName := e generatedClassName.
	selector := 'namesBuilderClassName'.
	self 
		fileOutMethodSource: selector , '	^ #' , self namesBuilder class name
		className: clsName
		meta: false
		category: 'accessing'
]

{ #category : #'generating from schemaInstance' }
PlatypusExpressStructure2SmalltalkTranslater >> buildNamesBuilderMethodFromSchemaInstance: e [ 
	| selector clsName code |
	clsName := e generatedClassName.
	selector := 'namesBuilder'.
	code := '	| namesBuilder |'.
	code := code , '	namesBuilder := self namesBuilderClass new.'.
	self class translaterRequiredAspects do: 
			[:aspect | 
			code := code , '	namesBuilder ' , aspect , ': ' 
						, (self perform: aspect) printString , '.'].
	code := code , '	^ namesBuilder'.
	self 
		fileOutMethodSource: selector , code
		className: clsName
		meta: false
		category: 'accessing'
]

{ #category : #'generating from entity' }
PlatypusExpressStructure2SmalltalkTranslater >> buildPlatypusSignatureMethodForClass: className namespace: namespace packageName: packageName category: aCategoryName [ 
	self 
		fileOutMethodSource: 'translatedFromISO10303P11 ^ true.'
		className: className
		meta: true packageName: packageName
		category: 'platypus-signature'.
	self 
		fileOutMethodSource: 'iso10303P11Translater ^ ''Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'''
		className: className
		meta: true packageName: packageName
		category: 'platypus-signature'.
	self 
		fileOutMethodSource: 'vwNamespaceName ^#''' , namespace , ''''
		className: className
		meta: true packageName: packageName
		category: 'platypus-signature'
]

{ #category : #'generating from schemaInstance' }
PlatypusExpressStructure2SmalltalkTranslater >> buildRepositoryMethodFromSchemaInstance: e [ 
	| selector clsName repositoryClassName |
	clsName := e generatedClassName.
	repositoryClassName := e 
				repositoryClassNameFromNamesBuilder: self namesBuilder.
	selector := 'repositoryClassName'.
	self 
		fileOutMethodSource: selector , '	^ #' , repositoryClassName
		className: clsName
		meta: false
		category: 'accessing'.
	selector := 'generatedMetaDataSchemaInstanceName'.
	self 
		fileOutMethodSource: selector , '	^  #' , clsName
		className: repositoryClassName
		meta: true
		category: 'accessing'
]

{ #category : #'generating from entity' }
PlatypusExpressStructure2SmalltalkTranslater >> buildRootEntityClass [
	| rootClsName selector code |
	(translationsDone includes: (rootClsName := self rootClassName asSymbol)) 
		ifFalse: 
			[translationsDone add: rootClsName.
			self 
				fileOutNamespaceDefinition: self rootClassSystemCategory
				imports: ''
				environment: 'Smalltalk'
				packageName: self rootClassSystemCategory
				category: self rootClassSystemCategory.
			self 
				fileOutClassDefinition: rootClsName
				superClassName: 'Object'
				instVars: ''
				classVars: ''
				namespace: self rootClassSystemCategory
				packageName: self rootClassSystemCategory
				category: self rootClassSystemCategory.
			selector := 'platypusMetaData'.
			code := '	^ self schemaDefinition metaDataFor: self name asSymbol'.
			self 
				fileOutMethodSource: selector , ' ' , code
				className: rootClsName
				meta: true
				packageName: self rootClassSystemCategory
				category: 'meta-data-accessing'.
			selector := 'platypusMetaData'.
			code := '	^ self class platypusMetaData'.
			self 
				fileOutMethodSource: selector , ' ' , code
				className: rootClsName
				meta: false
				packageName: self rootClassSystemCategory
				category: 'meta-data-accessing'.
			selector := 'context'.
			self 
				fileOutMethodSource: selector , ' ^ self schemaDefinition context'
				className: rootClsName
				meta: true
				packageName: self rootClassSystemCategory
				category: 'context-accessing']
]

{ #category : #'generating from entity' }
PlatypusExpressStructure2SmalltalkTranslater >> buildSchemaDefinitionMethodFromAlgorithm: e [ 
	| selector clsName schemaClassName code |
	clsName := e generatedClassName.
	schemaClassName := e owner 
				generatedClassNameFromNamesBuilder: self namesBuilder.
	selector := 'schemaDefinition'.
	code :=  '	^ ' , schemaClassName , ' singleton'.
	self 
		fileOutMethodSource: selector,  ' ' , code
		className: clsName
		meta: true
		category: 'meta-data-accessing'
]

{ #category : #'generating from entity' }
PlatypusExpressStructure2SmalltalkTranslater >> buildSchemaDefinitionMethodFromEntity: e [ 
	| selector clsName schemaClassName code |
	clsName := e generatedClassName.
	schemaClassName := e owner 
				generatedClassNameFromNamesBuilder: self namesBuilder.
	selector := 'schemaDefinition'.
	code := '	^ ' , schemaClassName , ' singleton'.

	self 
		fileOutMethodSource: selector , ' ' , code
		className: clsName
		meta: true
		category: 'meta-data-accessing'
]

{ #category : #'generating from schemaInstance' }
PlatypusExpressStructure2SmalltalkTranslater >> buildSchemaDefinitionsMethodsFromSchemaInstance: e [ 
	| clsName cpt buildSelector prefix code |
	clsName := e generatedClassName.
	cpt := 0.
	prefix := 'schemaDefinition'.
	e internalSchemata do: 
			[:elem | 
			cpt := cpt + 1.
			buildSelector := prefix , cpt asString.
			code := ' ^ #( #''' , elem name , ''' #' 
						, (elem generatedClassNameFromNamesBuilder: self namesBuilder) , ' )'.
			self 
				fileOutMethodSource: buildSelector , '	' , code
				className: clsName
				meta: false
				category: 'schemata-accessing'].
	buildSelector := prefix , 'Count'.
	self 
		fileOutMethodSource: buildSelector , '	^ ' , cpt asString
		className: clsName
		meta: false
		category: 'schemata-accessing'
]

{ #category : #'generating from schema' }
PlatypusExpressStructure2SmalltalkTranslater >> buildSchemaInstanceClassNameMethodsFromSchema: e [ 
	| clsName schInstClsName selector |
	clsName := e generatedClassName.
	schInstClsName := e owner 
				generatedClassNameFromNamesBuilder: self namesBuilder.
	selector := 'schemaInstanceClassName'.	
	self 
		fileOutMethodSource: selector , ' ^ #' , schInstClsName 
		className: clsName
		meta: false
		category: 'meta-data-accessing'
]

{ #category : #'generating from entity' }
PlatypusExpressStructure2SmalltalkTranslater >> buildSchemaInstanceMethodFromEntity: e [ 
	| selector clsName schemaInstanceClassName code |
	clsName := e generatedClassName.
	schemaInstanceClassName := e schemaInstance 
				generatedClassName.
	selector := 'schemaInstance'.
	code := '	^ ' , schemaInstanceClassName , ' singleton'.
	self 
		fileOutMethodSource: selector , ' ' , code
		className: clsName
		meta: true
		category: 'meta-data-accessing'
]

{ #category : #'generating from entity' }
PlatypusExpressStructure2SmalltalkTranslater >> buildVisitMethodFromEntity: e [ 
	| selector clsName code category |
	clsName := e generatedClassName.
	selector := 'accept: aVisitor'.
	code :=  '	^ aVisitor accept' 
				, (self namesBuilder normalizedNameFrom: e name first: true) , ': self.'.
	self 
		fileOutMethodSource: selector , ' ' , code
		className: clsName
		meta: false
		category: 'visiting'.
		
	clsName := self namesBuilder abstractVisitorClassName.
	category :=  'visiting' 
						, (self namesBuilder normalizedNameFrom: e lookUpSchemaDefinition name
								first: true).
	selector := 'accept' 
				, (self namesBuilder normalizedNameFrom: e name first: true) , ': e'.
	code := ' "my subclasses have to redefine it"'.
	self 
		fileOutMethodSource: selector , ' ' , code
		className: clsName
		meta: false
		category: category.

]

{ #category : #accessing }
PlatypusExpressStructure2SmalltalkTranslater >> classPrefix [
	^ self namesBuilder classPrefix
]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> commentFromMetaData: e [ 
	| clsName |
	clsName := e generatedClassName.
	self commentFromMetaData: e classname: clsName
]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> commentFromMetaData: e classname: aClassName [ 
	self subclassResponsibility 
]

{ #category : #'generating from attribute' }
PlatypusExpressStructure2SmalltalkTranslater >> contextAccessingCode [
	^ ' self class context'
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> doAlgorithmDeclaration: e [ 
	| paramInfos localInfos allInfos instv |
	paramInfos := self namesBuilder 
				normalizedAlgorithmFormalParametersInfosFrom: e.
	localInfos := self namesBuilder 
				normalizedAlgorithmLocalVariablesInfosFrom: e.
	allInfos := paramInfos asOrderedCollection , localInfos.
	instv := ''.
	allInfos do: [:sp | instv := instv , sp first , ' '].
	self 
		fileOutClassDefinition: e generatedClassName
		superClassName: self platypusVWNamespace, '.PlatypusCoreAlgorithmDeclaration'
		instVars: instv
		classVars: ''
		category: e generatedSystemCategory.
	self commentFromMetaData: e.
	self buildAlgorithmCodeFrom: e.
	self buildSchemaDefinitionMethodFromAlgorithm: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> doDerivedAttribute: e [ 
	 self buildGetAccessorMethodFromDerivedAttribute: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> doEntityDefinition: e [ 
	| superClassname instv classv |
	self localTranslationOnly 
		ifTrue: [self acceptSchemaInstance: e schemaInstance]
		ifFalse: [self buildRootEntityClass].
	e supertypes ifNotEmpty: 
			[:supertypes | 
			self localTranslationOnly 
				ifFalse: [supertypes do: [:st | self acceptEntityDefinition: st ref]].
			superClassname := e generatedSystemCategoryPrefix , '.' 
						, e supertypes first generatedClassName]
		ifEmpty: 
			[superClassname := self rootClassSystemCategory , '.' , self rootClassName].
	instv := ''.
	(self namesBuilder allInstVarNamesFromEntity: e) 
		do: [:n | instv := instv , n]
		separatedBy: [instv := instv , ' '].
	classv := ''.
	(self namesBuilder allClassVarNamesFromEntity: e) 
		, (self namesBuilder allClassInstVarNamesFromEntity: e) 
			do: [:n | classv := classv , n]
			separatedBy: [classv := classv , ' '].
	superClassname = (e generatedSystemCategory , '.' , e generatedClassName) 
		ifTrue: [superClassname := 'Object'].
	self 
		fileOutClassDefinition: e generatedClassName
		superClassName: superClassname
		instVars: instv
		classVars: classv
		category: e generatedSystemCategory.
	self commentFromMetaData: e.
	self buildInitializeMethodFromEntity: e.
	self buildClassificationMethodFromEntity: e.
	self buildVisitMethodFromEntity: e.
	self buildLocalCopyToMethodFromEntity: e.
	self buildCopyToMethodFromEntity: e.
	self buildCopyGroupToMethodFromEntity: e.
	self buildLocalGroupAccessingMethodFromEntity: e.
	self buildSchemaDefinitionMethodFromEntity: e.
	self buildSchemaInstanceMethodFromEntity: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> doExplicitAttribute: e [ 
	self buildGetAndSetAccessorMethodFromExpliciteAttribute: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> doGlobalRule: e [ 
	|  instv allInfos |
	allInfos := self namesBuilder normalizedAlgorithmLocalVariablesInfosFrom: e.
	instv := ''.
	allInfos do: [:sp | instv := instv , sp first , ' '].
	instv := instv, ' ', (String streamContents: [:strm | e forEntities do: [:fe | strm nextPutAll: fe name, ' ']]).
	self 
		fileOutClassDefinition: e generatedClassName
		superClassName: self platypusVWNamespace, '.PlatypusCoreAlgorithmDeclaration'
		instVars: instv
		classVars: ''
		category: e generatedSystemCategory.
	self commentFromMetaData: e.
	self buildGlobalRuleInitializeFrom: e.
	self buildGlobalRuleAccessingFrom: e.
	self buildSchemaDefinitionMethodFromAlgorithm: e.
	self buildGlobalRuleWhereRulesCodeFrom: e

]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> doInverseAttribute: e [ 
	self buildGetAccessorMethodFromInverseAttribute: e 
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> doSchemaDefinition: e [ 
	self 
		fileOutClassDefinition: e generatedClassName
		superClassName: self platypusVWNamespace , '.PlatypusCoreSchema'
		instVars: ''
		classVars: ''
		category: e generatedSystemCategory.
	self commentFromMetaData: e.
	self buildSchemaInstanceClassNameMethodsFromSchema: e.
	self buildContextAccessingMethodsFromSchema: e.
	self buildEntitiesMethodsFromSchema: e.
	self buildFunctionsMethodsFromSchema: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> doSchemaInstance: e [ 
	| clsName |
	self
		fileOutNamespaceDefinition: self environment
		imports: self rootClassSystemCategory , '.* '
		environment: 'Smalltalk'
		packageName: self environment
		category: self environment.
	self
		fileOutClassDefinition: (clsName := e generatedClassName)
		superClassName: self platypusVWNamespace , '.PlatypusCoreSchemaInstance'
		instVars: 'context'
		classVars: ''
		category: e generatedSystemCategory.
	self commentFromMetaData: e classname: clsName.
	self buildNamesBuilderClassNameMethodFromSchemaInstance: e.
	self buildNamesBuilderMethodFromSchemaInstance: e.
	self buildSchemaDefinitionsMethodsFromSchemaInstance: e.
	self buildContextAccessingMethodsFromSchemaInstance: e.
	self
		fileOutClassDefinition: (e repositoryClassNameFromNamesBuilder: self namesBuilder)
		superClassName: self platypusVWNamespace , '.PlatypusCoreRepository'
		instVars: ''
		classVars: ''
		category: e generatedSystemCategory.
	self buildRepositoryMethodFromSchemaInstance: e.
	self buildExternalsSchemaInstancesMethodFromSchemaInstance: e.
	self
		fileOutClassDefinition: self namesBuilder abstractVisitorClassName
		superClassName: self platypusVWNamespace , '.PlatypusCoreAbstractVisitor'
		instVars: ''
		classVars: ''
		category: e generatedSystemCategory.
	self buildInitializeMethodFromSchemaInstance: e
]

{ #category : #'visit dictionary schema' }
PlatypusExpressStructure2SmalltalkTranslater >> doWhereRule: e [ 
	e label ifNotNil: [
	self buildGetAccessorMethodFromWhereRule: e]
]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> environment [
	^ self namesBuilder systemCategoryPrefix

]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> fileInSplittedBaseSelector: selector contents: aBigString className: clsName category: category step: step meta: isMeta [ 
	|  lines prev buildSelector count code |
	lines := OrderedCollection new.
	aBigString linesDo: [:line | lines add: line , '(*\\*)'].
	prev := 1.
	count := 0.
	1 to: lines size
		by: step
		do: 
			[:cpt | 
			count := count + 1.
			buildSelector := selector , count asString.
			code := '	^'.
			prev to: (lines size min: prev + step - 1)
				do: [:cpt2 | code := code , '	' , (lines at: cpt2) printString , ','].
			code := code , '	'''''.
			self 
				fileOutMethodSource: buildSelector , code
				className: clsName
				meta: isMeta
				category: category.
			prev := prev + step].
	buildSelector := selector , 'PartsCount'.
	code := ' ^' , count asString.
	self 
		fileOutMethodSource: buildSelector , code
		className: clsName
		meta: isMeta
		category: category
]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> fileOutClassDefinition: aClassName superClassName: superClassName instVars: instVars classVars: classVars category: aCategoryName [ 
	self 
		fileOutClassDefinition: aClassName
		superClassName: superClassName
		instVars: instVars
		classVars: classVars
		namespace: self environment
		packageName: self environment
		category: aCategoryName
]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> fileOutClassDefinition: aClassName superClassName: superClassName instVars: instVars classVars: classVars namespace: namespace packageName: packageName category: aCategoryName [ 
	self subclassResponsibility 
]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> fileOutDoIt: aSource [ 
		self subclassResponsibility

]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> fileOutMethodSource: aSource className: aClassName meta: isMeta category: aCategorySymbol [ 
	self 
		fileOutMethodSource: aSource
		className: aClassName
		meta: isMeta
		packageName: self environment
		category: aCategorySymbol
]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> fileOutMethodSource: aSource className: aClassName meta: isMeta packageName: packageName category: aCategorySymbol [ 
		self subclassResponsibility 
]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> fileOutNamespaceDefinition: aNamespaceName imports: imports environment: envName packageName: packageName category: aCategoryName [ 
		self subclassResponsibility 
]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> finalResultFrom: aString [

 ^ super finalResultFrom: aString

]

{ #category : #'initialize/release' }
PlatypusExpressStructure2SmalltalkTranslater >> initialize [
	super initialize.
	translationsDone := Set new.

]

{ #category : #'generating from attribute' }
PlatypusExpressStructure2SmalltalkTranslater >> initializeStatementFromAttribute: e [ 
	| varName initExpr |
	varName := e instVarNameFromNamesBuilder: self namesBuilder.
	e optionalFlag
		ifTrue: [^ varName , ' := nil.']
		ifFalse: [initExpr := self namesBuilder smalltalkInitializingExpressionOf: e domain.
			^ varName , ' := ' , initExpr , '.']
]

{ #category : #accessing }
PlatypusExpressStructure2SmalltalkTranslater >> localTranslationOnly [
	^ localTranslationOnly ifNil: [localTranslationOnly := false]
]

{ #category : #accessing }
PlatypusExpressStructure2SmalltalkTranslater >> localTranslationOnly: anObject [
	localTranslationOnly := anObject
]

{ #category : #'generating from attribute' }
PlatypusExpressStructure2SmalltalkTranslater >> lowSetExpressionFromAttribute: e [ 
	| domain argName |
	domain := e domain referenced.
	argName := self namesBuilder argNameFor: domain scopeMetaData: e owner.
	domain isPltAggregationType
		ifTrue: [^ argName , ' ifNil: ['
				, (self namesBuilder smalltalkInitializingExpressionOf: domain) , '] ifNotNil: [' , argName , ' as: '
				, (self namesBuilder smalltalkTypeOf: domain) , ']']
		ifFalse: [(domain isPltDefinedType
					and: [domain domain isPltEnumerationType])
				ifTrue: [^ argName , ' asUppercase asSymbol']
				ifFalse: [^ argName]]
]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> mcCategory: aCat [ 
	self subclassResponsibility
]

{ #category : #accessing }
PlatypusExpressStructure2SmalltalkTranslater >> namesBuilder [
	^ namesBuilder 
		
]

{ #category : #accessing }
PlatypusExpressStructure2SmalltalkTranslater >> namesBuilder: aNamesBuilder [
	
	 namesBuilder := aNamesBuilder

]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> platypusVWNamespace [
	^ 'Platypus'
]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> prettyPrint: aString [ 
	^ PlatypusVWPackageExporterScanner new outPut: aString
]

{ #category : #utilities }
PlatypusExpressStructure2SmalltalkTranslater >> qualifiedClassNameOf: e [ 
		self subclassResponsibility
]

{ #category : #accessing }
PlatypusExpressStructure2SmalltalkTranslater >> rootClassName [
	^self namesBuilder  rootClassName
]

{ #category : #accessing }
PlatypusExpressStructure2SmalltalkTranslater >> rootClassSystemCategory [
	^  self namesBuilder  rootClassSystemCategory 
		
]

{ #category : #accessing }
PlatypusExpressStructure2SmalltalkTranslater >> systemCategoryPrefix [
	^  self namesBuilder  systemCategoryPrefix 

]

{ #category : #'public accessing' }
PlatypusExpressStructure2SmalltalkTranslater >> translate: aMetaData [ 
	Cursor wait
		showWhile: [self acceptTry: aMetaData.
			self fileOutDoIt: (self qualifiedClassNameOf: aMetaData schemaInstance)
					, ' initialize.'.
			^ self finalResult]

]

{ #category : #accessing }
PlatypusExpressStructure2SmalltalkTranslater >> xtraMethodCategory: name xtraClassname: aClassName schema: aSchema [ 
	^ String cr , '!' , aClassName , ' methodsFor: ''' , '*'
		, (aSchema systemCategoryFromNamesBuilder: self namesBuilder) , '-' , name , '''!'
]
