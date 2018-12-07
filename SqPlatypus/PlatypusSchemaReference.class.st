Class {
	#name : #PlatypusSchemaReference,
	#superclass : #PlatypusExpressElementReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #accessing }
PlatypusSchemaReference class >> lexicalElement [
	^#'schema'
]

{ #category : #'drag and drop' }
PlatypusSchemaReference >> acceptDroppingMorph: aTransfertMorph copy: shouldCopy [ 
	(aTransfertMorph respondsTo: #passenger) ifFalse: [^false].
	(aTransfertMorph passenger isKindOf: PlatypusSchemaElementReference) 
		ifTrue: 
			[(self copyListItemHereFromTransfertMorph: aTransfertMorph) 
				ifTrue: [shouldCopy ifFalse: [aTransfertMorph passenger remove]. ^ true]].

^ false
]

{ #category : #accessing }
PlatypusSchemaReference >> accessibleSchemata [
	^self schemaInstance schemata
]

{ #category : #'code updating' }
PlatypusSchemaReference >> buildSubReferencesFrom: start to: stop addingOrReplacing: addingReplacingOrReplacingAllSymbol [ 
	| newLink |
	super
		buildSubReferencesFrom: start
		to: stop
		addingOrReplacing: addingReplacingOrReplacingAllSymbol.
		self subReferences removeAllSuchThat: [:e | e isKindOf: PlatypusSchemaInterfaceReference].
	self metaData interface
		do: [:str | 
			newLink := PlatypusSchemaInterfaceReference from: str .
			newLink owner: self.
			self subReferences add: newLink]
]

{ #category : #testing }
PlatypusSchemaReference >> canBeMovedDown [
	"true if self can be moved up (in my owner children
	collection) "
	^ self isMoveable
		and: [self owner subReferences size > 1
		and: [(self owner subReferences indexOf: self)
				< self owner subReferences size]]
]

{ #category : #testing }
PlatypusSchemaReference >> canBeMovedUp [
	"true if self can be moved up (in my owner children
	collection)"
	^ self isMoveable 
		and: [self owner subReferences size > 1
				and: [(self owner subReferences indexOf: self)
						> 1]]
]

{ #category : #'code accessing' }
PlatypusSchemaReference >> codeStreamClassFor: aTokenList from: aStartNode to: aSopNode [ 
	^ super codeStreamClassFor: aTokenList from: aStartNode to: aSopNode 
]

{ #category : #checking }
PlatypusSchemaReference >> doInternalChecking [
	super doInternalChecking.
	self knownAsInvalid
		ifFalse: [self assert: self metaData owner notNil.
			self metaData interfaceSchemata
				do: [:sch | sch
						ifNotNil: [self assert: sch owner notNil]]]
]

{ #category : #menus }
PlatypusSchemaReference >> elementKindStartContentsFor: elementKindSymbol name: aName [ 
	elementKindSymbol == #type
		ifTrue: [^ ('	type ' , aName , ' = string; \	end_type;') withCRs].
	elementKindSymbol == #entity
		ifTrue: [^ ('	entity ' , aName , ';\	end_entity;') withCRs].
	elementKindSymbol == #rule
		ifTrue: [^ ('	rule ' , aName , ' for ( at_least_an_entity_name );\	where\		wr1 : true; -- obviously something else\	end_rule;') withCRs].
	elementKindSymbol == #procedure
		ifTrue: [^ ('	procedure ' , aName , ';\		local\		end_local;\\	end_procedure;') withCRs].
	elementKindSymbol == #function
		ifTrue: [^ ('	function ' , aName , ' : integer;\		local\		end_local;\\		return (0);\	end_function;') withCRs].
	^ ('	' , elementKindSymbol , ' ' , aName , ';\	end_' , elementKindSymbol , ' ;') withCRs
]

{ #category : #accessing }
PlatypusSchemaReference >> entities [
	^ self metaData entities
]

{ #category : #accessing }
PlatypusSchemaReference >> entitiesReferences [
	^self subReferencesOfKind: PlatypusEntityReference
]

{ #category : #accessing }
PlatypusSchemaReference >> functionsReferences [
	^self subReferencesOfKind: PlatypusFunctionReference
]

{ #category : #testing }
PlatypusSchemaReference >> haveMetaSchemata [
	^ self metaData notNil and: [self metaData haveMetaSchemata]
]

{ #category : #accessing }
PlatypusSchemaReference >> icon [
	^ (self isPlatypusPrimitiveSchema
			or: [self usePlatypusPrimitiveSchemata])
		ifTrue: [TamIcons mimeIcon: '10x10/mimetypes/meta_schema']
		ifFalse: [self haveMetaSchemata
				ifTrue: [TamIcons mimeIcon: '10x10/mimetypes/meta_schema_instancier']
				ifFalse: [TamIcons mimeIcon: '10x10/mimetypes/schema']]
]

{ #category : #'code updating' }
PlatypusSchemaReference >> insertReference: anotherReference [ 
	| parserResult code |
	((anotherReference isKindOf: PlatypusExpressReference)
			and: [anotherReference isSchemaElement])
		ifFalse: [^ super insertReference: anotherReference].
	anotherReference owner == self
		ifTrue: [^ false].
	code := anotherReference codeString.
	parserResult := self expressParserClass
				parseStream: code readStream
				startingAt: anotherReference smaCCStartingState
				owner: self metaData.
	self updateWithParserResult: parserResult.
	self treeHasChanged.
	^ true
]

{ #category : #testing }
PlatypusSchemaReference >> isMoveable [
	^ true
]

{ #category : #testing }
PlatypusSchemaReference >> isPlatypusPrimitiveSchema [
	^ self metaData notNil and: [self metaData isPlatypusPrimitiveSchema]
]

{ #category : #testing }
PlatypusSchemaReference >> isSchemaReference [
	^ true
]

{ #category : #menus }
PlatypusSchemaReference >> menuEvaluateAllRules [
	self rules
		do: [:r | 
			Transcript show: r metaData name , '\' withCRs.
			r evaluate]
]

{ #category : #menus }
PlatypusSchemaReference >> menuExpress2SqlOracle [
	| visiteur ws functionsVisitor |
	visiteur := PlatypusExpress2SqlOracleVisitor
				outStream: (WriteStream on: String new).
	visiteur createTypeBoolean.
	visiteur createTypeLogical.
	"Execute la gÈeneration du code SQL"
	self metaData acceptTry: visiteur.
	"visiteur allSqlContainer inspect."
	"visiteur allSqlContainer  
	do: [:item | Transcript show: item contents].  
	visiteur allSqlContainer keys inspect."
	"ws := Workspace new.  
	ws contents: visiteur outStream contents.  
	ws openLabel: 'Fichier SQL (Oracle)'."
	visiteur sortMsgSql.
	"functionsVisitor := PlatypusAccesFunctionsVisitor
				new: visiteur allSqlContainer
				outStream: visiteur outStream
				dict: visiteur dicoOfName.
	self metaData acceptTry: functionsVisitor."
	ws := Workspace new.
	ws contents: visiteur outStream contents.
	ws openLabel: self metaData name , '.SQL (Oracle)'.
	Transcript show: 'Traitement termine';
		 cr
]

{ #category : #menus }
PlatypusSchemaReference >> menuExpress2SqlPostgres [
	| visiteur ws functionsVisitor |
	visiteur := PlatypusExpress2SqlPostgresVisitor
				outStream: (WriteStream on: String new).
	visiteur createTypeBoolean.
	visiteur createTypeLogical.
	"Execute la gÈeneration du code SQL"
	self metaData acceptTry: visiteur.
	"visiteur allSqlContainer inspect."
	"ws := Workspace new.  
	ws contents: visiteur outStream contents.  
	ws openLabel: 'Fichier SQL (PostgreSQL)'."
	visiteur sortMsgSql.
	functionsVisitor := PlatypusAccesFunctionsPosgresVisitor
				new: visiteur allSqlContainer
				outStream: visiteur outStream
				dict: visiteur dicoOfName.
	self metaData acceptTry: functionsVisitor.
	ws := Workspace new.
	ws contents: visiteur outStream contents.
	ws openLabel: self metaData name , '.SQL (PostgreSQL)'.
	Transcript show: 'Traitement termine';
		 cr
]

{ #category : #menus }
PlatypusSchemaReference >> menuNewElement: elementKind [ 
	| key startContents startingStateSelector parserResult |
	(key := UIManager default request: 'new ' , elementKind , ' name' initialAnswer: '')
		ifNotNil: [:e | 
			startContents := self elementKindStartContentsFor: elementKind name: key.
			startingStateSelector := (#startingStateFor , elementKind capitalized , 'Entry') asSymbol.
			parserResult := self expressParserClass
						parseStream: startContents readStream
						startingAt: (PlatypusExpressParser perform: startingStateSelector)
						owner: self metaData.
			self updateWithParserResult: parserResult.
			self treeHasChanged]
]

{ #category : #menus }
PlatypusSchemaReference >> menuNewEntity [
	^ self menuNewElement: #entity
]

{ #category : #menus }
PlatypusSchemaReference >> menuNewFunction [
	^ self menuNewElement: #function
]

{ #category : #menus }
PlatypusSchemaReference >> menuNewProcedure [
	^ self menuNewElement: #procedure
]

{ #category : #menus }
PlatypusSchemaReference >> menuNewRule [
	^ self menuNewElement: #rule
]

{ #category : #menus }
PlatypusSchemaReference >> menuNewType [
	^ self menuNewElement: #type
]

{ #category : #accessing }
PlatypusSchemaReference >> moveDown [
	^ self owner moveDownSchemaReference: self
]

{ #category : #accessing }
PlatypusSchemaReference >> moveUp [
	^ self owner moveUpSchemaReference: self
]

{ #category : #accessing }
PlatypusSchemaReference >> proceduresReferences [
	^self subReferencesOfKind: PlatypusProcedureReference
]

{ #category : #accessing }
PlatypusSchemaReference >> rules [
	^ self subReferences select: [:sr | sr isKindOf: PlatypusRuleReference]
]

{ #category : #accessing }
PlatypusSchemaReference >> rulesReferences [
	^self subReferencesOfKind: PlatypusRuleReference
]

{ #category : #accessing }
PlatypusSchemaReference >> schemaInterfacesReferences [
	^ self subReferencesOfKind: PlatypusSchemaInterfaceReference
]

{ #category : #accessing }
PlatypusSchemaReference >> smaCCStartingState [
	^ self expressParserClass startingStateForSchemaEntry
]

{ #category : #menus }
PlatypusSchemaReference >> specificMenu: menu shifted: b [ 
	"Set up the menu to apply to the receiver's, honoring 
	the #shifted boolean"
	| newMenu menuExpress |
	super specificMenu: menu shifted: b.
	menu addLine.
	newMenu := MenuMorph new.
	newMenu defaultTarget: self.
	newMenu addList: #(#('type' #menuNewType) #('entity' #menuNewEntity) #('procedure' #menuNewProcedure) #('function' #menuNewFunction) #('rule' #menuNewRule) ).
	menuExpress := MenuMorph new.
	menuExpress add: 'new ...' subMenu: newMenu.
	{#-. #('save... (s)' #menuSave). #('save as... (S)' #menuSaveAs) . #-. #('code pane (p)' #menuCodePane ). #-. #('evaluate all rules' #menuEvaluateAllRules ). #('clean all evaluation results' #menuCleanAllEvaluations ). #-. #('translate here (t)' #menuTranslate2Pharo ). #('translate to VisualWorks' #menuTranslate2VisualWorks )}
		do: [:item | item == #-
				ifTrue: [menuExpress addLine]
				ifFalse: [menuExpress
						add: item first
						target: self
						selector: item second]].
	menu
		add: 'express ...'
		target: self
		selector: nil
		argumentList: #().
	menu lastItem subMenu: menuExpress.
	menu addLine.
	^ menu
]

{ #category : #accessing }
PlatypusSchemaReference >> subElementSymbols [
	^ PlatypusSchemaElementReference allSubclasses collect: [ :c | c lexicalElement]
]

{ #category : #'sublists handling' }
PlatypusSchemaReference >> subListsDefsArray [
	"return an array of array. Each element array is for one
	sublist and 
	contains first a selector for sublist accessing and second a label
	for the sublist"
	| subs |
	subs := OrderedCollection new.
	subs addAll: super subListsDefsArray.
	subs addAll: #(#(#schemaInterfacesReferences #interface) #(#typesReferences #types) #(#entitiesReferences #entities) #(#functionsReferences #functions) #(#proceduresReferences #procedures) #(#rulesReferences #rules) ).
	^ subs
]

{ #category : #'sublists handling' }
PlatypusSchemaReference >> subListsReferenceClassName [
	^#PlatypusExpressSubListReference
]

{ #category : #accessing }
PlatypusSchemaReference >> typesReferences [
	^self subReferencesOfKind: PlatypusTypeReference
]

{ #category : #testing }
PlatypusSchemaReference >> usePlatypusPrimitiveSchemata [
	^ self metaData notNil and: [self metaData usePlatypusPrimitiveSchemata]
]
