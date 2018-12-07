Class {
	#name : #PlatypusExpressStructure2VWTranslater,
	#superclass : #PlatypusExpressStructure2SmalltalkTranslater,
	#instVars : [
		'level',
		'convertCharDict'
	],
	#category : #'Platypus-HW-translater-private'
}

{ #category : #accessing }
PlatypusExpressStructure2VWTranslater class >> expressionTranslaterClassName [
	^ #PlatypusExpressExpression2VWTranslater
]

{ #category : #accessing }
PlatypusExpressStructure2VWTranslater class >> statementTranslaterClassName [
	^ #PlatypusExpressStatement2VWTranslater
]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> asXmlText: aString [ 
	| wStr |
	wStr := WriteStream on: (String new: aString size).
	^ (self writeXmlText: aString on: wStr) contents
]

{ #category : #'generating from schemaInstance' }
PlatypusExpressStructure2VWTranslater >> buildInitializeMethodFromSchemaInstance: e [ 
	| selector clsName code |
	clsName := e generatedClassName.
	selector := 'initialize'.
	code := '	PlatypusPharoSmalltalk initialize. self reinitializeSingleton. self singleton buildIndexes.'.
	self 
		fileOutMethodSource: selector , ' ' , code
		className: clsName
		meta: true
		category: 'initializing'
]

{ #category : #'generating from entity' }
PlatypusExpressStructure2VWTranslater >> buildRootEntityClass [
	super buildRootEntityClass.
	self 
		fileOutMethodSource: 'new ^ super new stepInitialize'
		className: self rootClassName
		meta: true
		packageName: self rootClassSystemCategory
		category: 'instance-creation'.
	self 
		fileOutMethodSource: 'stepInitialize'
		className: self rootClassName
		meta: false
		packageName: self rootClassSystemCategory
		category: 'initializing'
]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> commentFromMetaData: e classname: aClassName [ 
	self tag: 'comment'
		do: 
			[self tag: 'class-id' with: self environment , '.' , aClassName.
			self tag: 'body'
				do: 
					[self nextPutAllCr: (self 
								asXmlText:PlatypusCoreObject expressSchemaCodeStartMark , String cr , e prettyPrintedExpressCode 
										, String cr ,PlatypusCoreObject expressSchemaCodeStopMark)]]
]

{ #category : #accessing }
PlatypusExpressStructure2VWTranslater >> convertCharDict [
	^ convertCharDict
]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> fileOutClassDefinition: aClassName superClassName: superClassName instVars: instVars classVars: classVars namespace: namespace packageName: packageName category: aCategoryName [ 
	self tag: 'class'
		do: 
			[self tag: 'name' with: aClassName.
			self tag: 'environment' with: namespace.
			self tag: 'super' with: superClassName.
			self tag: 'private' with: 'false'.
			self tag: 'indexed-type' with: 'none'.
			self tag: 'inst-vars' with: instVars.
			self tag: 'class-inst-vars' with: classVars.
			self tag: 'imports' with: ''.
			self tag: 'category' with: aCategoryName.
			self tag: 'attributes' do: [self tag: 'package' with: packageName]].
	self 
		buildPlatypusSignatureMethodForClass: aClassName
		namespace: namespace
		packageName: packageName
		category: aCategoryName
]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> fileOutDoIt: aSource [ 
	self tag: 'do-it'
		do: 
			[self
				nextPutAllCr: aSource
				]

]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> fileOutMethodSource: aSource className: aClassName meta: isMeta packageName: packageName category: aCategorySymbol [ 
	self
		tag: 'methods'
		do: [self tag: 'class-id' with: packageName , '.' , aClassName
					, (isMeta
							ifTrue: [' class']
							ifFalse: ['']).
			self tag: 'category' with: self namesBuilder methodCategoryPrefix , '-' , aCategorySymbol.
			self
				tag: 'body'
				attributes: 'package="' , packageName , '"'
				with: (self
						asXmlText:aSource)]
]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> fileOutNamespaceDefinition: aNamespaceName imports: imports environment: envName packageName: packageName category: aCategoryName [ 
	self tag: 'name-space'
		do: 
			[self tag: 'name' with: aNamespaceName.
			self tag: 'environment' with: envName.
			self tag: 'private' with: 'false'.
			self tag: 'imports'
				with: 'private Smalltalk.* Refactory.SmaCC.* Platypus.* ' 
						,  imports.
			self tag: 'category' with: aCategoryName.
			self tag: 'attributes' do: [self tag: 'package' with: packageName]]
]

{ #category : #accessing }
PlatypusExpressStructure2VWTranslater >> finalResultFrom: aString [ 
	^ '<?xml version="1.0"?>' , String cr , '<st-source>' , String cr , (super  finalResultFrom: aString) , '</st-source>'
]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> indent [
	level timesRepeat: [self nextPutAll: '    ']
]

{ #category : #'initialize/release' }
PlatypusExpressStructure2VWTranslater >> initialize [
	super initialize.
convertCharDict := Dictionary new.
	0 to: 31
		do: [:each | convertCharDict at: each put: '(' , each asString , ' asCharacter)'].
	32 to: 47
		do: [:each | convertCharDict at: each put: '&#' , each asString , ';'].
	65534 to: 65535
		do: [:each | convertCharDict at: each put: '(' , each asString , ' asCharacter)'].
	convertCharDict
		at: $& asciiValue put: '&amp;';
		at: $< asciiValue put: '&lt;';
		at: $> asciiValue put: '&gt;';
		at: $' asciiValue put: '&apos;';
		at: $" asciiValue put: '&quot;'.
	convertCharDict
		removeKey: Character space asciiValue;
		removeKey: Character tab asciiValue;
		removeKey: Character cr asciiValue;
		removeKey: Character lf asciiValue.
	convertCharDict
		removeKey: $/ asciiValue;
		removeKey: $- asciiValue;
		removeKey: $. asciiValue.
	level := 0.

]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> mapType: aSymbol [ 
	aSymbol == #normal
		ifTrue: [^ #none].
	aSymbol == #variable
		ifTrue: [^ #objects].
	^ aSymbol
]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> mcCategory: aCat [ 
	^ aCat
]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> qualifiedClassNameOf: e [ 
	^ e generatedNamespaceName, '.', e generatedClassName
]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> tag: aString attributes: attrString with: contentString [ 
	self indent.
	self
		nextPutAll: '<';
		nextPutAll: aString;
		nextPutAll: ' ' , attrString;
		nextPutAll: '>'.
	self nextPutAll: (contentString).
	self
		nextPutAll: '</';
		nextPutAll: aString;
		nextPutAll: '>';
		cr
]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> tag: aString do: aBlock [ 
	self indent.
	self nextPutAll: '<';
		 nextPutAll: aString;
		 nextPutAll: '>';
		 cr.
		level := level + 1.
	aBlock value.
		level := level - 1.
	self indent.
	self nextPutAll: '</';
		 nextPutAll: aString;
		 nextPutAll: '>';
		 cr
]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> tag: aString with: contentString [ 
	self indent.
	self
		nextPutAll: '<';
		nextPutAll: aString;
		nextPutAll: '>'.
	self nextPutAll: (contentString).
	self
		nextPutAll: '</';
		nextPutAll: aString;
		nextPutAll: '>';
		cr
]

{ #category : #utilities }
PlatypusExpressStructure2VWTranslater >> writeXmlText: aString on: aWriteStream [ 
	| cDict wStr |
	cDict := self convertCharDict.
	wStr := aWriteStream.
	aString do: 
			[:eachChar | 
			| val |
			val := eachChar asciiValue.
			val >= 127 
				ifTrue: 
					[wStr
						nextPutAll: '&#';
						nextPutAll: val asString;
						nextPut: $;]
				ifFalse: 
					[| conv |
					conv := cDict at: val ifAbsent: [].
					conv isNil 
						ifTrue: [wStr nextPut: eachChar]
						ifFalse: [wStr nextPutAll: conv]]].
	^ wStr
]
