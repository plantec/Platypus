Class {
	#name : #PlatypusNamesBuilder,
	#superclass : #Object,
	#instVars : [
		'classPrefix',
		'systemCategoryPrefix',
		'rootClassName',
		'rootClassSystemCategory'
	],
	#category : #'Platypus-HW-translater-private'
}

{ #category : #utilities }
PlatypusNamesBuilder class >> capitalize: aString first: firstCapitalized [ 
	^ aString capitalizeFirst: firstCapitalized
]

{ #category : #'instance creation' }
PlatypusNamesBuilder class >> classPrefix: aClassPrefix systemCategoryPrefix: aSysCatPrefix rootClassName: aRootClassName  rootClassSystemCategory: aRootClassSystemCategory [ 
	^ self new 
		classPrefix: aClassPrefix
		systemCategoryPrefix: aSysCatPrefix
		rootClassName: aRootClassName
		rootClassSystemCategory: aRootClassSystemCategory
]

{ #category : #'instance creation' }
PlatypusNamesBuilder class >> default [
	^ self prefixedBy: #PTs 
	
]

{ #category : #'instance creation' }
PlatypusNamesBuilder class >> meta [
	^ self 
		classPrefix: #Plt
		systemCategoryPrefix: #Platypus
		rootClassName: #PltEntityInstance
		rootClassSystemCategory: #'Platypus-PlatypusDictionarySchemaSchema'
]

{ #category : #'instance creation' }
PlatypusNamesBuilder class >> prefixedBy: aPrefix [ 
	^ self
		classPrefix: aPrefix
		systemCategoryPrefix: aPrefix
		rootClassName: aPrefix , 'CoreEntity'
		rootClassSystemCategory: aPrefix , '-CoreEntity'
]

{ #category : #accessing }
PlatypusNamesBuilder class >> querySymbols [
	^ #(#argName #smalltalkType #smalltalkInitializingExpression)
]

{ #category : #utilities }
PlatypusNamesBuilder class >> uncapitalize: aString [ 
	| instr outstr resString curr |
	instr := ReadStream on: aString.
	outstr := WriteStream on: String new.
	outstr nextPut: instr next asLowercase.
	[instr atEnd]
		whileFalse: [(curr := instr next) isUppercase
				ifTrue: [outstr nextPut: $_;
						 nextPut: curr asLowercase]
				ifFalse: [outstr nextPut: curr asLowercase]].
	resString := outstr contents.
	^ resString
]

{ #category : #naming }
PlatypusNamesBuilder >> abstractVisitorClassName [
	^ systemCategoryPrefix, 'AbstractVisitor'
]

{ #category : #accessing }
PlatypusNamesBuilder >> allClassInstVarNamesFromEntity: e [ 
	| cls nativesClassInstVar |
	(cls := self classFromMetaData: e)
		ifNil: [nativesClassInstVar := #()]
		ifNotNil: [nativesClassInstVar := cls class instVarNames].
	^ nativesClassInstVar
]

{ #category : #accessing }
PlatypusNamesBuilder >> allClassVarNamesFromEntity: e [ 
	| cls nativesClassVar |
	(cls := self classFromMetaData: e)
		ifNil: [nativesClassVar := #()]
		ifNotNil: [nativesClassVar := cls classVarNames].
	^ nativesClassVar
]

{ #category : #accessing }
PlatypusNamesBuilder >> allInstVarNamesFromEntity: e [ 
	| nativesInstVar cls inherited instVarNames locals |
	inherited := Set new.
	locals := Set new.
	e
		inheritedExplicitAttributesDo: [:attr | attr redeclaring
				ifNil: [inherited
						add: (attr instVarNameFromNamesBuilder: attr owner namesBuilder)]].
	e
		explicitAttributesDo: [:attr | attr redeclaring
				ifNil: [locals
						add: (attr instVarNameFromNamesBuilder: self)]].
	(cls := self classFromMetaData: e)
		ifNil: [nativesInstVar := #()]
		ifNotNil: [nativesInstVar := cls instVarNames].
	instVarNames := nativesInstVar asSet.
	instVarNames removeAllFoundIn: inherited.
	instVarNames addAll: locals.
	^ instVarNames
]

{ #category : #accessing }
PlatypusNamesBuilder >> allReservedNamesFromEntity: e [ 
	| nativesInstVar cls inherited instVarNames |
	inherited := Set new.
	e
		inheritedExplicitAttributesDo: [:attr | attr redeclaring
				ifNil: [inherited
						add: (attr instVarNameFromNamesBuilder: attr owner namesBuilder)]].
	(cls := self classFromMetaData: e)
		ifNil: [nativesInstVar := #()]
		ifNotNil: [nativesInstVar := cls instVarNames].
	instVarNames := nativesInstVar asSet.
	instVarNames addAll: inherited.
	^ instVarNames
]

{ #category : #querying }
PlatypusNamesBuilder >> argNameFor: aMetaData [ 
	^ (PlatypusSmartNamer query: #argName namesBuilder: self) acceptTry: aMetaData
]

{ #category : #querying }
PlatypusNamesBuilder >> argNameFor: aMetaData scopeMetaData: aScope [ 
	^ self argNameFor: aMetaData scopeMetaData: aScope reservedNames: OrderedCollection new
	
]

{ #category : #querying }
PlatypusNamesBuilder >> argNameFor: aMetaData scopeMetaData: aScope reservedNames: aListOfString [ 
	^ self 
		localVarName: (self argNameFor: aMetaData)
		inScope: aScope
		reservedNames: aListOfString
]

{ #category : #querying }
PlatypusNamesBuilder >> argNameSuffixFor: aMetaData [
	| argname |
	argname := self argNameFor: aMetaData.
	argname size = 1
		ifTrue: [^ argname].
	argname first = $a
		ifTrue: [argname := argname copyFrom: 2 to: argname size].
	argname size = 1
		ifTrue: [^ argname].
	argname first = $n
		ifTrue: [argname := argname copyFrom: 2 to: argname size].
	^ argname
]

{ #category : #utilities }
PlatypusNamesBuilder >> capitalize: aString first: firstCapitalized [ 
	^ self class capitalize: aString first: firstCapitalized
]

{ #category : #'generated class accessing' }
PlatypusNamesBuilder >> classFromMetaData: aMetaData [ 
	^ PlatypusPharoSmalltalk
		at: (aMetaData generatedClassNameFromNamesBuilder: self) asSymbol
		ifAbsent: []
]

{ #category : #accessing }
PlatypusNamesBuilder >> classPrefix [
	^ classPrefix

]

{ #category : #accessing }
PlatypusNamesBuilder >> classPrefix: anObject [ 
	classPrefix := anObject
]

{ #category : #accessing }
PlatypusNamesBuilder >> classPrefix: aClassPrefix systemCategoryPrefix: aSysCatPrefix rootClassName: aRootClassName rootClassSystemCategory: aRootClassSystemCategory [ 
	self classPrefix: aClassPrefix.
	self systemCategoryPrefix: aSysCatPrefix.
	self rootClassName: aRootClassName.
	self rootClassSystemCategory: aRootClassSystemCategory
]

{ #category : #naming }
PlatypusNamesBuilder >> contextArgNameFromAttribute: e [ 
	^ self contextArgNameFromEntity: e owner
]

{ #category : #naming }
PlatypusNamesBuilder >> contextArgNameFromEntity: e [ 
	^ self localVarName: 'aContext' inScope: e
]

{ #category : #naming }
PlatypusNamesBuilder >> contextArgNameFromQualifier: e [ 
	| parent |
	^ (parent := self parentAttributeOf: e) ifNotNil: [
	self contextArgNameFromAttribute: (parent)]
]

{ #category : #accessing }
PlatypusNamesBuilder >> functionInvokingFrom: anAlgorithm [ 
	| code selectorParts |
	code := WriteStream on: String new.
	selectorParts := self 
				normalizedAlgorithmFormalParametersInfosFrom: anAlgorithm.
	selectorParts do: 
			[:sp | 
			code nextPutAll: sp first , ': '.
			code nextPutAll: sp second]
		separatedBy: [code nextPutAll: ' '].
	^code contents
]

{ #category : #naming }
PlatypusNamesBuilder >> localCopyMethodNameFromEntity: e [
	^ (self normalizedNameFrom: e name first: false), 'CopyTo:'
]

{ #category : #naming }
PlatypusNamesBuilder >> localFromValuesMethodNameFromEntity: e [ 
	^ (self normalizedNameFrom: e name first: false) , 'FromValues:'
]

{ #category : #naming }
PlatypusNamesBuilder >> localToValuesMethodNameFromEntity: e [ 
	^ (self normalizedNameFrom: e name first: false) , 'ToValues:'
]

{ #category : #naming }
PlatypusNamesBuilder >> localVarName: aPrefix inScope: aScopeMetaData [ 
	^ self
		localVarName: aPrefix
		inScope: aScopeMetaData
		reservedNames: OrderedCollection new
]

{ #category : #naming }
PlatypusNamesBuilder >> localVarName: aPrefix inScope: aScopeMetaData reservedNames: aListOfString [ 
	| allInstVars |
	allInstVars := self allReservedNamesFromEntity: aScopeMetaData.
	aListOfString addAll: allInstVars.
	^ self localVarName: aPrefix reservedNames: aListOfString
]

{ #category : #naming }
PlatypusNamesBuilder >> localVarName: aPrefix reservedNames: aListOfString [ 
	| candidat cpt |
	candidat := aPrefix asSymbol.
	cpt := 0.
	[aListOfString includes: candidat]
		whileTrue: [cpt := cpt + 1.
			candidat := (aPrefix , cpt asString) asSymbol].
	aListOfString add: candidat.
	^ candidat
]

{ #category : #naming }
PlatypusNamesBuilder >> methodCategoryPrefix [
	^ 'platypus-generated'
]

{ #category : #utilities }
PlatypusNamesBuilder >> nameWithUnderbar: aName [ 
	1 to: aName size do: [:pos | ((aName at: pos) = $_) ifTrue: [^true]].
	^false
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedAlgorithmFormalParametersInfosFrom: aFunctionDeclaration [ 
	| selp parts reserved arg |
	parts := OrderedCollection new.
	reserved := Set new.
	aFunctionDeclaration formalParameters copy
		do: [:fps | 
			selp := self normalizedVarNameFrom: fps name.
			arg := self
						localVarName: (self argNameFor: fps domain)
						reservedNames: reserved.
			parts add: (Array with: selp with: arg with: fps byCopy with:fps domain)].
	^ parts
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedAlgorithmLocalVariablesInfosFrom: anAlgorithm [ 
	| selp parts reserved arg |
	parts := OrderedCollection new.
	reserved := Set new.
	anAlgorithm locals copy
		do: [:fps | 
			selp := self normalizedVarNameFrom: fps name.
			arg := self
						localVarName: (self argNameFor: fps domain)
						reservedNames: reserved.
			parts add: (Array with: selp with:  arg with: true with:  fps domain)].
	^ parts
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedClassNameFrom: aName [ 
	^ self normalizedClassNameFrom: aName suffix: ''
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedClassNameFrom: aName suffix: aSuffix [
	^self classPrefix ,(self normalizedNameFrom: aName first: true) , aSuffix
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedGetSelectorFrom: aName prefix: aPrefix suffix: aSuffix [ 
	^ (aPrefix
		ifNil: [(self normalizedVarNameFrom: aName)
				, aSuffix]
		ifNotNil: [aPrefix
				, (self normalizedVarSuffixFrom: aName) , aSuffix]) asSymbol
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedGetSelectorFrom: aName suffix: aSuffix [ 
	^ self normalizedGetSelectorFrom: aName prefix: nil suffix: aSuffix 
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedGetSelectorWithArgFrom: aName prefix: aPrefix suffix: aSuffix [ 
	^ (self normalizedGetSelectorFrom: aName prefix: aPrefix suffix: aSuffix), ':' 
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedMethodCategory: aName className: aClassName meta: isMeta [ 
	aName first = $* 
		ifTrue: 
			[
	^ String cr , '!' , aClassName , (isMeta ifTrue: [' class'] ifFalse: ['']) 
		, ' methodsFor: ''' 
		
		, aName , '''!']
	ifFalse: [
			^ String cr , '!' , aClassName , (isMeta ifTrue: [' class'] ifFalse: ['']) 
		, ' methodsFor: ''' 
		, self methodCategoryPrefix , '-' 
		, aName , '''!']
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedMethodCategory: aName nameSpace: aNameSpace className: aClassName meta: isMeta [ 
	^ String cr , '!' , aNameSpace, '.', aClassName
		, (isMeta
				ifTrue: [' class']
				ifFalse: ['']) , ' methodsFor: ''' , self methodCategoryPrefix , '-' , aName , '''!'
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedNameFrom: aName first: firstCapitalized [ 
	^(self nameWithUnderbar: aName ) 
		ifTrue: [self capitalize: aName first: firstCapitalized]
		ifFalse: [aName asIdentifier: firstCapitalized]
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedNameSpaceFrom: aName suffix: aSuffix [ 
	^ ((self capitalize: aName first: true)
				asIdentifier: true) , aSuffix
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedSetSelectorFrom: aName prefix: aPrefix suffix: aSuffix [ 
	^ (aPrefix
		ifNil: [(self normalizedVarNameFrom: aName)
				, aSuffix , ':']
		ifNotNil: [aPrefix
				, (self normalizedVarSuffixFrom: aName) , aSuffix , ':']) asSymbol
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedSetSelectorFrom: aName suffix: aSuffix [ 
 ^ self normalizedSetSelectorFrom: aName prefix: nil suffix: aSuffix 
	
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedSystemCategoryNameFrom: aName suffix: aSuffix [ 
	^ self systemCategoryPrefix , '-'
		, ((self capitalize: aName first: true)
				asIdentifier: true) , aSuffix
]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedVarNameFrom: aName [ 
	^(self normalizedNameFrom: aName first: false) 

]

{ #category : #'naming basic' }
PlatypusNamesBuilder >> normalizedVarSuffixFrom: aName [ 
	| strim |
	aName size > 1
		ifTrue: [
			strim := WriteStream on: String new.
			strim nextPut: aName first asUppercase.
			strim nextPutAll: (self
						normalizedVarNameFrom: (aName copyFrom: 2 to: aName size)).
			^ strim contents].
		^ aName asUppercase
]

{ #category : #utilities }
PlatypusNamesBuilder >> parentAttributeOf: aMetaData [ 
	| md |
	md := aMetaData.
	[md isPltAttribute] whileFalse: 
			[(md respondsTo: #owner) ifFalse: [^nil].
			md owner isNil ifTrue: [^ nil].
			md := md owner].
	^md
]

{ #category : #accessing }
PlatypusNamesBuilder >> querySymbols [
	^ self class querySymbols
]

{ #category : #naming }
PlatypusNamesBuilder >> receiverArgNameFromAttribute: e [ 
	^ self receiverArgNameFromEntity: e owner
]

{ #category : #naming }
PlatypusNamesBuilder >> receiverArgNameFromEntity: e [ 
	^ self localVarName: 'aReceiver' inScope: e
]

{ #category : #accessing }
PlatypusNamesBuilder >> rootClassName [
	^rootClassName
]

{ #category : #accessing }
PlatypusNamesBuilder >> rootClassName: anObject [
	rootClassName := anObject
]

{ #category : #accessing }
PlatypusNamesBuilder >> rootClassSystemCategory [
	^rootClassSystemCategory
]

{ #category : #accessing }
PlatypusNamesBuilder >> rootClassSystemCategory: anObject [
	rootClassSystemCategory := anObject
]

{ #category : #querying }
PlatypusNamesBuilder >> smalltalkInitializingExpressionOf: aMetaData [ 
	^ (PlatypusSmartNamer query: #smalltalkInitializingExpression namesBuilder: self) 
		acceptTry: aMetaData	
]

{ #category : #querying }
PlatypusNamesBuilder >> smalltalkTypeOf: aMetaData [ 
^ (PlatypusSmartNamer query: #smalltalkType
		namesBuilder: self) acceptTry: aMetaData

]

{ #category : #accessing }
PlatypusNamesBuilder >> systemCategoryPrefix [
	^ systemCategoryPrefix

]

{ #category : #accessing }
PlatypusNamesBuilder >> systemCategoryPrefix: anObject [ 
	systemCategoryPrefix := anObject
]

{ #category : #utilities }
PlatypusNamesBuilder >> uncapitalize: aString [
	^ self class uncapitalize: aString
]

{ #category : #naming }
PlatypusNamesBuilder >> uniqueBlockVarName: aPrefix owner: aMetaData [ 
	^ aPrefix , aMetaData basicIdentityHash asString
]
