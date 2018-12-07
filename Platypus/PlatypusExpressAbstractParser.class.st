Class {
	#name : #PlatypusExpressAbstractParser,
	#superclass : #SmaCCParser,
	#category : #'Platypus-HW-parsers'
}

{ #category : #accessing }
PlatypusExpressAbstractParser class >> parse: aString owner: owner onError: aBlock [ 
	^ [self parseStream: aString readStream owner: owner]
		on: SmaCCParserError
		do: [:ex | ex
				return: (aBlock value: ex description value: ex signaler position)]
]

{ #category : #accessing }
PlatypusExpressAbstractParser class >> parse: aString startingAt: anInteger owner: owner onError: aBlock [ 
	^ [self
		parseStream: aString readStream
		startingAt: anInteger
		owner: owner]
		on: SmaCCParserError
		do: [:ex | ex
				return: (aBlock value: ex description value: ex tag position)]
]

{ #category : #accessing }
PlatypusExpressAbstractParser class >> parseStream: aStream owner: owner [
	^ self
		parseStream: aStream
		startingAt: self defaultStartingState
		owner: owner
]

{ #category : #accessing }
PlatypusExpressAbstractParser class >> parseStream: aStream startingAt: anInteger owner: owner [ 
	| parser result |
	parser := self on: aStream.
	owner ownerPath
		do: [:o | parser pushContext: o].
	parser pushContext: owner.
	parser setStartingState: anInteger.
	result := parser parse.
	[parser contextsStack isEmpty]
		whileFalse: [parser popContext].
	^ result
]

{ #category : #'generated-comments' }
PlatypusExpressAbstractParser class >> parserDefinitionComment [

	"%left ""="" "">="" "">"" ""in"" "":=:"" "":<>:"" ""<="" ""<"" ""like"" ""<>"";
%left ""-""	 ""+"" ""or"" ""xor"";
%left ""/"" ""mod"" ""div"" ""*"" ""and"" ""andor"" ""||""	;
%right ""**"";
%left ""not"" ;

%id <logical> <integer> <real> <binary> <string> <encodedString> <identifier> <remarkRef> <nativeAlgorithm>;

%start SchemaInstanceEntry SchemaEntry  SchemaContentsEntry ConstantsEntry TypeEntry EntityEntry FunctionEntry ProcedureEntry RuleEntry StatementsEntry ExpressionEntry;

SchemaInstanceEntry 
: SchemaInstance { self schemaInstanceEntry: '1' value}
;

SchemaInstance
: RemarkReference* SchemaEntry* { self schemaInstance: '1' value }
;

ConceptIdentifier
: RemarkReference SimpleIdentifier { self conceptIdentifier: '2' value }
| RemarkReference SimpleIdentifier ""{"" Expression ""}""  { self conceptIdentifier: '2' metaExpression: '4'  }
| SimpleIdentifier { self conceptIdentifier: '1' value }
| SimpleIdentifier ""{"" Expression ""}""  { self conceptIdentifier: '1' metaExpression: '3'  }
;

SchemaIdentifier
: ConceptIdentifier { self schemaIdentifier: '1' value }
;

Semicolon
: "";"" RemarkReference*
;

RemarkReference
: <remarkRef> { self remarkReference: '1' value }
;

StatementsEntry
: Statement* { self statementsEntry: '1' value }
;

ExpressionEntry
: Expression { self expressionEntry: '1' value}
;

SchemaEntry
: Schema
{
	self schemaEntry: '1' value
}
;

SchemaContentsEntry
: SchemaContents { self schemaContentsEntry: '1' value }
;


Schema 	
: ""schema"" SchemaIdentifier Semicolon InterfaceSpecification* SchemaContents ""end_schema"" Semicolon 
{
	self schema: '2' value interfaces: '4' blocks: '5'
}
;

SchemaContents
: Block* { '1' value }
;

InterfaceSpecification	
: UseOrReference ""from"" SimpleIdentifier InterfaceList? Semicolon 
{
	self interfaceSpecification: '1' value schema: '3' value interfaceList: '4' value .
}
| ""meta"" ""from"" SimpleIdentifier Semicolon 
{
	self externalMetaSchema: '3' value.
}
;

UseOrReference 
: ""use"" { #USED }
| ""reference"" { #REFERENCED }
;

InterfaceList
: ""("" ExplicitlyImportedItemsList "")"" 
{
	self explicitlyImportedItems: '2' value
}
;

ExplicitlyImportedItemsList 
: ExplicitlyImportedItem { OrderedCollection with: '1' value }
| ExplicitlyImportedItemsList "","" ExplicitlyImportedItem { OrderedCollection new addAll: '1' value; add: '3' value; yourself }
;

ExplicitlyImportedItem
: SimpleIdentifier { self explicitlyImportedItem: '1' value renamedAs: '1' value }
| SimpleIdentifier ""as"" SimpleIdentifier { self explicitlyImportedItem: '1' value renamedAs: '3' value }
;

ConstantsEntry
: ConstantsDecl
{
	self constantsEntry: '1' value 
}
;

ConstantsDecl	
: ""constant"" ConstantBody* ""end_constant"" Semicolon 
{
	self constantsDecl: '2' 
}
;

ConstantBody 
: ConceptIdentifier "":"" BaseType "":="" Expression Semicolon
{
	self constantBody: '1' value baseType: '3' value expression: '5' value
}
;

Block
: ConstantsEntry { self block: '1' value }
| TypeEntry  { self block: '1' value }
| EntityEntry { self block: '1' value }
| FunctionEntry  { self block: '1' value }
| ProcedureEntry { self block: '1' value }
| RuleEntry { self block: '1' value }
;

RuleEntry
: Rule
{
	self ruleEntry: '1' value 
}
;

Rule		
: ""rule"" RuleIdentifier ""for"" ""("" IdentifiersList "")"" Semicolon ActionBody WhereClause ""end_rule"" Semicolon
{ 
	self rule: '2' value entities: '5' value actionBody: '8' value whereClause: '9' value	
}
;

RuleIdentifier
: ConceptIdentifier {	self ruleIdentifier: '1' value }
;

FunctionEntry
: Function
{
	self functionEntry: '1' value
}
;

Function
: ""function"" FunctionIdentifier FormalParametersDecl? "":"" ParameterType Semicolon ActionBody ""end_function"" Semicolon
{ 
	self function: '2' value formalParametersDecl: '3' value returnType: '5' value actionBody: '7' value.
}
;

FunctionIdentifier
: ConceptIdentifier { 	self functionIdentifier: '1' value }
;

ProcedureEntry
: Procedure
{
	self procedureEntry: '1' value
}
;

Procedure
: ""procedure"" ProcedureIdentifier FormalParametersDecl?  Semicolon ActionBody ""end_procedure"" Semicolon
{ 
	self procedure: '2' value formalParametersDecl: '3' value actionBody: '5' value
}
;

ProcedureIdentifier
: ConceptIdentifier {	self procedureIdentifier: '1' value }
;

ActionBody
: ActionBodyDecl* Statement*
{
	self actionBodyDecl: '1' value statements: '2' value. 
}
;

ActionBodyDecl
: Block { '1' value }
| LocalDecl { '1' value }
;

Statement		
: AliasStatement { self statement: '1' value } 
| AssignmentStatement { self statement: '1' value }
| CaseStatement { self statement: '1' value }
| CompoundStatement { self statement: '1' value }
| EscapeStatement { self statement: '1' value }
| IfStatement { self statement: '1' value }
| RepeatStatement { self statement: '1' value }
| ReturnStatement { self statement: '1' value }
| SkipStatement { self statement: '1' value }
| OutputStatement { self statement: '1' value }
| SplitmarkStatement { self statement: '1' value }
| EndSplitmarkStatement { self statement: '1' value } 
| NativeStatement { self statement: '1' value }
| ProcedureCallStatement { self statement: '1' value } 
| NullStatement { self statement: '1' value }
;

NullStatement
: Semicolon { self nullStatement }
;

Assignable
: AssignableList
{
	self assignable: '1' value
}
;

ProcedureCallStatement
: Identifier Semicolon { self procedureCall: '1' value } 
;

AssignableList
: AssignableList Qualifier { OrderedCollection new addAll: '1' value;  add: '2' value; yourself }
| Identifier { OrderedCollection with: '1' value }
;

NativeStatement
: NativeAlgorithm
{
	self nativeStatement: '1' value
}
;

NativeExpression
: NativeAlgorithm
{
	self nativeExpression: '1' value
}
;

NativeAlgorithm
: <nativeAlgorithm>+
{
	self nativeAlgorithm: '1' value
}
;

AliasStatement		
: ""alias"" AliasStatementVariable  Semicolon Statement* ""end_alias"" Semicolon
{
	self aliasStatement: '2' value statements: '4' value
}
;

AliasStatementVariable
: SimpleIdentifier ""for"" Assignable
{
	self aliasStatementVariable: '1' value for: '3' value
}
;

AssignmentStatement	
: Assignable "":="" Expression Semicolon
{
	self assignmentStatement: '1' value from: '3' value
}
;

CaseAction		
: ExpressionsList "":"" Statement
{
	self caseAction: '1' value statement: '3' value
}
;

CaseOtherwise		
: ""otherwise"" "":"" Statement
{
	self caseOtherwise: '3' value
}
;

CaseStatement		
: ""case"" Expression ""of"" CaseAction*  CaseOtherwise? ""end_case"" Semicolon
{
	self caseStatement: '2' value caseActions: '4' value caseOtherwise: '5' value 
}
;

CompoundStatement	
:  CompoundStatementBegin Statement* ""end"" Semicolon
{
	self compoundStatement: '1' value statements: '2' value
}
;

CompoundStatementBegin
: ""begin"" { self compoundStatementBegin }
;

EscapeStatement
: ""escape"" Semicolon
{
	self escapeStatement
}
;

IfStatement		
: ""if"" Expression ""then"" Statement* ""end_if"" Semicolon
{
	self ifStatement: '2' value then: '4' value else: nil
}
| ""if"" Expression ""then"" Statement*  ""else"" Statement* ""end_if"" Semicolon
{
	self ifStatement: '2' value then: '4' value else: '6' value
}
;

ByExpression
: ""by"" Expression
{
	'2' value
}
;

IncrementControl	
: SimpleIdentifier "":="" Expression ""to"" Expression ByExpression?
{
	self incrementControl: '1' value first: '3' last: '5' value step: '6' value
}
;

WhileControl
: ""while"" Expression
{
	'2' value
}
;

UntilControl
: ""until"" Expression
{
	'2' value
}
;

RepeatStatement	
: ""repeat"" IncrementControl? WhileControl? UntilControl? Semicolon Statement* ""end_repeat"" Semicolon
{
	self repeatStatement: '2' value whileControl: '3' value untilControl: '4' value statements: '6' value 
}
;

ReturnStatement	
: ""return"" Semicolon
{
	self returnStatement: nil
}
| ""return"" ""("" Expression "")"" Semicolon
{
	self returnStatement: '3' value
}
;

SkipStatement
: ""skip"" Semicolon
{
	self skipStatement
}
;

OutputStatement
: ""|"" Expression ""|"" Semicolon
{
	self outputStatement: '2' value 
}
;

SplitmarkStatement
: ""{*""  ""*""? ""splitmark"" Expression ""*}""
{
	self beginSplitmarkStatement: '4' value append: '2' notNil
}
;

EndSplitmarkStatement
: ""{*"" ""*""? ""end_splitmark"" ""*}""
{
	self endSplitmarkStatement
}
;

LocalDecl	
: ""local"" LocalBody* ""end_local"" Semicolon 
{
	self localDecl: '2' value
}
;

LocalBody 
: IdentifiersList "":"" BaseType Semicolon
{
	self localBody: '1' value baseType: '3' value initializer: nil
}
| IdentifiersList "":"" BaseType "":="" Expression Semicolon
{
	self localBody: '1' value baseType: '3' value initializer: '5' value
}
;

FormalParametersDecl
: ""("" FormalParametersList "")""
{
	self formalParametersList: '2' value
}
;

FormalParametersList
: FormalParameter { OrderedCollection with: '1' value }
| FormalParametersList Semicolon FormalParameter { OrderedCollection new addAll: '1' value; add: '3' value; yourself }
;

FormalParameter
: Var IdentifiersList "":"" ParameterType
{
	self formalParameter: '2' value parameterType: '4' value var: '1' value 
}
;

Var
: ""var"" { true }
| 	{ false }
;

EntityEntry
: Entity
{
	self entityEntry: '1' value
}
;

Entity
: ""entity"" EntityIdentifier EntitySubSuper? Semicolon  ExplicitAttribute*  DeriveClause?  InverseClause?  UniqueClause?  WhereClause?  ""end_entity"" Semicolon 
{
	self entity: '2' value subSuper: '3' value explicitAttributes: '5' value deriveClause: '6' value inverseClause: '7' value uniqueClause: '8' value whereClause: '9' value
}
;

EntityIdentifier
: ConceptIdentifier { self entityIdentifier: '1' value }
;

EntitySubSuper
: SupertypeConstraint { self entitySupertype: '1' value subtype: nil }
| SubtypeDeclaration { self entitySupertype: nil subtype: '1' value}
| SupertypeConstraint SubtypeDeclaration { self entitySupertype: '1' value subtype: '2' value }
;

SubtypeDeclaration
: ""subtype"" ""of"" ""("" SubtypeIdentifiersList "")""
{
	self subtypeDeclaration: '4' value
}
;

SubtypeIdentifiersList
: SubtypeIdentifier { OrderedCollection with: '1' value }
| SubtypeIdentifiersList "","" SubtypeIdentifier { OrderedCollection new addAll: '1' value; add: '3' value; yourself }
;

SubtypeIdentifier
: SimpleIdentifier { self subtypeIdentifier: '1' value }
;

SupertypeConstraint
: ""abstract"" ""supertype"" SupertypeRuleTail?
{
	self abstractSupertypeConstraint: '3' value
}
| ""supertype"" SupertypeRuleTail
{
	self supertypeConstraint: '2' value
}
;

SupertypeRuleTail
: ""of"" ""("" SupertypeExpression "")""
{
	'3' value
}
; 

SupertypeExpression
: SimpleIdentifier
{
	self supertypeEntityReference: '1' value
}
| SupertypeExpression ""andor"" SupertypeExpression
{
	self supertypeExpression: '1' value andor: '3' value
}
| SupertypeExpression ""and"" SupertypeExpression
{
	self supertypeExpression: '1' value and: '3' value
}
| ""oneof"" ""("" SupertypeExpressionsList "")""
{
	self supertypeOneofExpression: '3' value
}
| ""("" SupertypeExpression "")""
{
	'2' value
}
;

SupertypeExpressionsList 
: SupertypeExpression  { OrderedCollection with: '1' value }
| SupertypeExpressionsList "","" SupertypeExpression  { OrderedCollection new addAll: '1' value; add: '3' value; yourself }
;

AttributeNameDecl
: ConceptIdentifier
{
	self attributeName:  '1' value groupRef: nil
}
| ""self"" ""\"" SimpleIdentifier ""."" ConceptIdentifier
{
	self attributeName:  '5' value groupRef: '3' value
}
;

SimpleAttributeNameDecl
: SimpleIdentifier
{
	self simpleAttributeName:  '1' value groupRef: nil
}
| ""self"" ""\"" SimpleIdentifier ""."" SimpleIdentifier
{
	self simpleAttributeName:  '5' value groupRef: '3' value
}
;

AttributesNameDeclList
: AttributeNameDecl  { OrderedCollection with: '1' value }
| AttributesNameDeclList "","" AttributeNameDecl  { OrderedCollection new addAll: '1' value; add: '3' value; yourself }
;

ExplicitAttribute
: AttributesNameDeclList "":""  Optional BaseType Semicolon
{
	self explicitAttributes: '1' value baseType: '4' value optional: '3' value 
}
;

Optional
: ""optional"" { true }
| { false }
;

DeriveClause		
: ""derive"" RemarkReference* DerivedAttribute+ 
{
	self deriveClause: '3' value
}
;

DerivedAttribute
: AttributeNameDecl "":"" BaseType "":="" Expression Semicolon
{
	self derivedAttribute: '1' value baseType: '3' value expression: '5' value
}
;

InverseClause
: ""inverse"" RemarkReference* InverseAttribute+
{
	self inverseClause: '3' value
}
;

InverseAttribute
: AttributeNameDecl "":"" InverseAttributeDomain ""for"" SimpleIdentifier Semicolon
{
	self inverseAttribute: '1' value baseType: '3' value for: '5' value
}
;

InverseAttributeDomain
: BaseType { self inverseAttributeDomain: '1' value }
;

UniqueClause
: ""unique"" RemarkReference* UniqueAttributesList+
{
	self uniqueClause: '3' value
}
;

UniqueAttributesList
: UniqueListHead UniqueNamesList Semicolon
{
	self uniqueAttributesList: '2' value head: '1' value
}
| UniqueNamesList Semicolon
{
	self uniqueAttributesList: '1' value head: nil
}
;

UniqueListHead
: SimpleIdentifier "":"" 
{
	'1' value
}
;

UniqueNamesList
: SimpleAttributeNameDecl { OrderedCollection with: '1' value }
| UniqueNamesList "","" SimpleAttributeNameDecl { OrderedCollection new addAll: '1' value; add: '3' value; yourself }
;

TypeEntry
: Type
{ 
	self typeEntry: '1' value
}
;

Type
: ""type"" TypeIdentifier ""="" UnderlyingType Semicolon WhereClause? ""end_type"" Semicolon 
{
	self type: '2' value underlyingType: '4' value whereClause: '6' value
}
| ""map"" MapIdentifiersPath ""to""  Expression Semicolon ""end_map"" Semicolon { self typeMapFrom: '2' to: '4' }
| ""map"" ""to"" Expression Semicolon   MapIdentifiersPathAndSemicolon*   ""end_map"" Semicolon { self typeMapTo: '3' from: '5' value }
| ""map"" ""to"" Expression Semicolon WhereClause ""end_map"" Semicolon  { self typeMapWhereClause: '5' to: '3' } 
;

MapIdentifiersPathAndSemicolon
: MapIdentifiersPath Semicolon { '1' value }
;

MapIdentifiersPath
: SimpleIdentifier { OrderedCollection with: '1' value }
| MapIdentifiersPath ""."" SimpleIdentifier { OrderedCollection new addAll: '1' value; add: '3' value; yourself }
;

TypeIdentifier
: ConceptIdentifier
{
	self typeIdentifier: '1' value
}
;

WhereClause
: ""where"" RemarkReference* WhereRule+
{
	self whereClause: '3' value
}
;

WhereRule
: WhereRuleHead Expression Semicolon
{
	self whereRule: '2' value head: '1' value
}
| Expression Semicolon
{
	self whereRule: '1' value head: nil
}
;

WhereRuleHead
: SimpleIdentifier "":""
{
	'1' value
}
;

UnderlyingType
: DomainType
{
	'1' value
}
;

ConstructedType
: SelectType
{
	'1' value
}
| EnumerationType
{
	'1' value
}
;

EnumerationType
: ""enumeration"" ""of"" ""("" IdentifiersList "")""
{
	self enumerationType: '4' value
}
;

SelectType
: ""select"" ""("" IdentifiersList "")""
{
	self selectType: '3' value
}
;

BaseType
: DomainType
{
	'1' value
}
;

ParameterType
: DomainType
{
	'1' value
}
;

DomainType
: AggregationType
{
	'1' value
}
| ConstructedType
{
	'1' value
}
| SimpleType
{
	'1' value
}
| NamedType
{
	'1' value
}
| GenericType
{
	'1' value
}
;

GenericType
: ""generic""
{
	self genericType: nil
}
| ""generic"" "":"" SimpleIdentifier
{
	self genericType: '3' value
}
;


AggregationType
: ArrayType
{
	'1' value
}
| ListType
{
	'1' value
}
| BagType
{
	'1' value
}
| SetType
{
	'1' value
}
| AggregateType
{
	'1' value
}
;

OptionalOrUnique
: ""optional"" ""unique""
{
	Array with: #optional with: #unique
}
| ""unique"" ""optional""
{
	Array with: #optional with: #unique
}
| ""optional"" 
{
	Array with: #optional 
}
| ""unique"" 
{
	Array with: #unique
}
;

IndexSpec	
: ""["" Expression "":"" Expression ""]""
{
	self indexSpecFrom: '2' value to: '4' value
}
;

ListType
: ""list"" IndexSpec? ""of"" ""unique""? BaseType
{
	self listType: '2' value baseType: '5' value unique: '4' value
}
;

ArrayType
: ""array"" IndexSpec? ""of"" OptionalOrUnique? BaseType
{
	self arrayType: '2' value baseType: '5' value optionalOrUnique: '4' value
}
;

BagType
: ""bag"" IndexSpec? ""of"" BaseType
{
	self bagType: '2' value baseType: '4' value 
}
;

SetType
: ""set"" IndexSpec? ""of"" BaseType
{
	self setType: '2' value baseType: '4' value
}
;

AggregateType
: ""aggregate"" ""of"" ParameterType
{
	self aggregateType: nil parameterType: '3' value
}
| ""aggregate"" "":"" SimpleIdentifier ""of"" ParameterType
{
	self aggregateType: '3' value parameterType: '5' value
}
;

SimpleType
: ""string"" FixedOrNotPrecisionSpec?
{
	self stringType: '2' value
}
| ""binary"" FixedOrNotPrecisionSpec?
{
	self binaryType: '2' value
}
| ""number"" 
{
	self numberType
}
| ""real"" PrecisionSpec?
{
	self realType: '2' value
}
| ""integer"" PrecisionSpec?
{
	self integerType: '2' value
}
| ""logical""
{
	self logicalType
}
| ""boolean""
{
	self booleanType
}
;

FixedOrNotPrecisionSpec 
: PrecisionSpec FixedOrNot
{
	Array with: '1' value with: '2' value 
}
;

FixedOrNot
: ""fixed"" { true }
| { false }
;

PrecisionSpec
: ""("" Expression "")""
{
	self precisionSpec: '2' value
}
;

NamedType
: ConceptIdentifier
{
	self namedType: '1' value
}
;

Expression 
: SimpleExpression
{
	'1' value
}
| SimpleExpression ""<"" SimpleExpression
{
	self expression: '1' value lessThan: '3' value
}
| SimpleExpression "">"" SimpleExpression
{
	self expression: '1' value greaterThan: '3' value
}
| SimpleExpression ""="" SimpleExpression
{
	self expression: '1' value equal: '3' value
}
| SimpleExpression ""<="" SimpleExpression
{
	self expression: '1' value lessThanOrEqual: '3' value
}
| SimpleExpression "">="" SimpleExpression
{
	self expression: '1' value greaterThanOrEqual: '3' value
}
| SimpleExpression ""<>"" SimpleExpression
{
	self expression: '1' value notEqual: '3' value
}
| SimpleExpression "":=:"" SimpleExpression
{
	self expression: '1' value instEqual: '3' value
}
| SimpleExpression "":<>:"" SimpleExpression
{
	self expression: '1' value instNotEqual: '3' value
}
| SimpleExpression ""in"" SimpleExpression
{
	self expression: '1' value in: '3' value
}
| SimpleExpression ""like"" SimpleExpression
{
	self expression: '1' value like: '3' value
}
;

SimpleExpression
: Term
{
	'1' value
}
| SimpleExpression ""or"" SimpleExpression
{
	self expression: '1' value or: '3' value
}
| SimpleExpression ""xor"" SimpleExpression
{
	self expression: '1' value xor: '3' value
}
| SimpleExpression ""+"" SimpleExpression
{
	self expression: '1' value plus: '3' value
}
| SimpleExpression ""-"" SimpleExpression
{
	self expression: '1' value minus: '3' value
}
;

Term
: Factor
{
	'1' value
}
| Term ""and"" Term
{
	self expression: '1' value and: '3' value
}
| Term ""mod"" Term
{
	self expression: '1' value mod: '3' value
}
| Term ""/"" Term
{
	self expression: '1' value div: '3' value
}
| Term ""div"" Term
{
	self expression: '1' value realDiv: '3' value
}
| Term ""*"" Term
{
	self expression: '1' value mult: '3' value
}
| Term ""||"" Term
{
	self expression: '1' value instConst: '3' value
}
;

Factor
: SimpleFactor
{
	'1' value
}
| Factor ""**"" Factor
{
	self expression: '1' value expo: '3' value
}
;

SimpleFactor
: SignedSimpleFactor
{
	'1' value
}
| AggregateInitializer
{
	'1' value
}
| SimpleFactor Qualifier+
{
	self qualifiedExpression: '1' value qualifiers: '2' 
}
| Literal
{
	'1' value
}
| Identifier
{
	'1' value
}
| ""("" Expression "")""
{
	self expressionBetweenParenthesis: '2' value
}
| ""%"" Expression ""%""
{
	self escapedExpression: '2' value
}
| Interval
{
	'1' value
}
| QueryExpression
{
	'1' value
}
| ""not"" SimpleFactor
{
	self not: '2' value
}
| SimpleFactor CardinalityOp SimpleFactor
{
	self expression: '1' value cardinality: '2' value expression: '3' value
}
| NativeExpression 
{
	'1' value
}
;

SignedSimpleFactor
: ""+"" SimpleFactor
{
	self positiveExpression: '2' value
} 
| ""-"" SimpleFactor 
{
	self negativeExpression: '2' value
} 
;

QueryExpression	
: ""query"" ""("" QueryVariable ""<*"" Expression ""|"" Expression "")""
{
	self queryExpression: '3' value source: '5' value suchThat: '7' value
}
;

QueryVariable
: SimpleIdentifier 
{
	self queryVariable: '1' value
}
;

Interval		
: ""{"" SimpleExpression IntervalOp SimpleExpression IntervalOp SimpleExpression ""}""
{
	self intervalExpression: '2' value op: '3' value expression: '4' value op: '5' value expression: '6' value
}
;

IntervalOp		
: ""<"" 
{
	#'<'
}
| ""<=""
{
	#'<='
}
;

Literal			
: <integer> 
{
	self integerLiteral: '1' value asNumber
}
| <real> 
{
	self realLiteral: '1' value asNumber
}
| <string> 
{
	self stringLiteral: '1' value
}
| <encodedString> 
{
	self encodedStringLiteral: '1' value
}
| ""true""
{
	self logicalLiteral: #true
}
| ""false""
{
	self logicalLiteral: #false
}
| ""unknown""
{
	self logicalLiteral: #unknown
}
| <binary> 
{
	self binaryLiteral: '1' value
}
| ""pi""
{
	self piConstant
}
| ""const_e""
{
	self eConstant
}
;

Identifier
: ""self""
{
	self selfIdentifier
}
| ""?""
{
	self missingValue: false
}
| SimpleIdentifier
{
	self identifier: '1' value
}
| ArgumentedIdentifier { '1' value }
;

ArgumentedIdentifier
: SimpleIdentifier ""("" ExpressionsList? "")""
{
	self identifier: '1' value arguments: '3' value
}
;

GroupRef
: ""\"" SimpleIdentifier
{
	self groupRef: '2' value
}
;

Qualifier		
:  ""."" SimpleIdentifier
{
	self attributeQualifier: '2' value
}
| GroupRef
{
	'1' value
}
| ""["" SimpleExpression ""]""
{
	self elementQualifier: '2' value
}
| ""["" SimpleExpression "":"" SimpleExpression ""]""
{
	self rangeQualifierFrom: '2' value to: '4' value
}
;

CardinalityOp		
: ""{"" Expression "":"" Expression ""}""
{
	self cardinalityExpressionFrom: '2' value to: '4' value
}
;

AggregateInitializer
: ""["" AggregateInitBody ""]""
{
	self aggregateInitializer: '2' value
}
| ""[""  ""]""
{
	self aggregateInitializer: #()
}
;

AggregateInitElement
: Expression
{
	self aggregateInitializerElement: '1' value repetition: nil
}
| Expression "":"" Expression
{ 
	self aggregateInitializerElement: '1' value repetition: '3' value
}
;

AggregateInitBody
: AggregateInitElement  { OrderedCollection with: '1' value }
| AggregateInitBody "","" AggregateInitElement { OrderedCollection new addAll: '1' value; add: '3' value; yourself }
;

SimpleIdentifier 
: <identifier> { '1' value }
;

IdentifiersList
: SimpleIdentifier RemarkReference* { OrderedCollection with: '1' value }
| IdentifiersList Colon SimpleIdentifier  RemarkReference* { OrderedCollection new addAll: '1' value; add: '3' value; yourself }
;

Colon
: "",""  RemarkReference*
;

ExpressionsList 
: Expression { OrderedCollection with: '1' value }
| ExpressionsList "","" Expression { OrderedCollection new addAll: '1' value; add: '3' value; yourself }
;

"
]

{ #category : #'generated-accessing' }
PlatypusExpressAbstractParser class >> scannerClass [
	^PlatypusExpressScanner
]

{ #category : #'generated-starting states' }
PlatypusExpressAbstractParser class >> startingStateForConstantsEntry [
	^5
]

{ #category : #'generated-starting states' }
PlatypusExpressAbstractParser class >> startingStateForEntityEntry [
	^7
]

{ #category : #'generated-starting states' }
PlatypusExpressAbstractParser class >> startingStateForExpressionEntry [
	^12
]

{ #category : #'generated-starting states' }
PlatypusExpressAbstractParser class >> startingStateForFunctionEntry [
	^8
]

{ #category : #'generated-starting states' }
PlatypusExpressAbstractParser class >> startingStateForProcedureEntry [
	^9
]

{ #category : #'generated-starting states' }
PlatypusExpressAbstractParser class >> startingStateForRuleEntry [
	^10
]

{ #category : #'generated-starting states' }
PlatypusExpressAbstractParser class >> startingStateForSchemaContentsEntry [
	^4
]

{ #category : #'generated-starting states' }
PlatypusExpressAbstractParser class >> startingStateForSchemaEntry [
	^3
]

{ #category : #'generated-starting states' }
PlatypusExpressAbstractParser class >> startingStateForSchemaInstanceEntry [
	^2
]

{ #category : #'generated-starting states' }
PlatypusExpressAbstractParser class >> startingStateForStatementsEntry [
	^11
]

{ #category : #'generated-starting states' }
PlatypusExpressAbstractParser class >> startingStateForTypeEntry [
	^6
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> abstractSupertypeConstraint: supertypeConstraintOrNil [ 
	| r | r := OrderedCollection new. r add: #abstractSupertype; add: supertypeConstraintOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> actionBodyDecl: declarationsOrNil statements: statementsOrNil [
	| r | r := OrderedCollection new. r add: #actionBodyDecl; add: declarationsOrNil; add: statementsOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> aggregateInitializer: initList [ 
	| r | r := OrderedCollection new. r add: #aggregateInitializer; add: initList. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> aggregateInitializerElement: expression repetition: expressionOrNil [ 
	| r | r := OrderedCollection new. r add: #aggregateInitializerElement; add: expression; add: expressionOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> aggregateType: keyIdentOrNil parameterType: parameterType [ 
	| r | r := OrderedCollection new. r add: #aggregateType; add: keyIdentOrNil; add: parameterType. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> aliasStatement: ident statements: statements [ 
	| r | r := OrderedCollection new. r add: #aliasStatement; add: ident; add: statements. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> aliasStatementVariable: anIdentifier for: assignable [
	| r | r := OrderedCollection new. r add: #aliasStatementVariable; add: anIdentifier; add: assignable. ^ r

]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> arrayType: indexSpecOrNil baseType: baseType optionalOrUnique: arrayOfSymbols [
	| r | r := OrderedCollection new. r add: #arrayType; add: indexSpecOrNil; add: baseType; add: arrayOfSymbols. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> assignable: aCollection [ 
	| r | r := OrderedCollection new. r add:  #assignable; add: aCollection. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> assignmentStatement: assignable from: expression [ 
	| r | r := OrderedCollection new. r add: #assignementStatement; add: assignable; add: expression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> attributeName: simpleIdent groupRef: aGroupIdentOrNil [
	| r | r := OrderedCollection new. r add: #attributeName; add: simpleIdent; add: aGroupIdentOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> attributeQualifier: aQualifier [ 
	| r | r := OrderedCollection new. r add: #attributeQualifier; add: aQualifier. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> bagType: indexSpecOrNil baseType: baseType [ 
	| r | r := OrderedCollection new. r add: #bagType; add: indexSpecOrNil; add: baseType. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> beginSplitmarkStatement: stringExpression [ 
	| r | r := OrderedCollection new. r add: #beginSplitmark; add: stringExpression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> binaryLiteral: aBinary [ 
	| r | r := OrderedCollection new. r add: #binaryLiteral; add: aBinary. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> binaryType: FixedOrNotPrecisionSpecOrNil [ 
	| r | r := OrderedCollection new. r add: #binaryType; add: FixedOrNotPrecisionSpecOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> block: aParserResult [ 
	^ aParserResult isCollection
		ifTrue: [aParserResult]
		ifFalse: [aParserResult metaData]
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> booleanType [
	| r | r := OrderedCollection new. r add: #booleanType. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> buildParserResultWith: aMetaData [ 
	^ aMetaData
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> cardinalityExpressionFrom: expression1 to: expression2 [ 
	| r | r := OrderedCollection new. r add: #cardinalityExpression; add: expression1; add: expression2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> caseAction: expressionsList statement: aStatement [ 
	| r | r := OrderedCollection new. r add: #caseAction; add: expressionsList; add: aStatement. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> caseOtherwise: aStatement [ 
	| r | r := OrderedCollection new. r add: #caseOtherwise; add: aStatement. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> caseStatement: caseSelectorExpression caseActions: caseActionsListOrNil caseOtherwise: caseOtherwiseOrNil [ 
	| r | r := OrderedCollection new. r add: #caseStatement; add: caseSelectorExpression; add: caseActionsListOrNil; add: caseOtherwiseOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> compoundStatement: aCompoundStatement statements: statementsListOrNil [ 
	| r | r := OrderedCollection new. r add: #compoundStatement; add: statementsListOrNil . ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> compoundStatementBegin [
	^ #'begin'
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> conceptIdentifier: anIdent [
	^ anIdent
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> conceptIdentifier: anIdent metaExpression: aMetaExpression [ 
	| r | r := OrderedCollection new. r add: #conceptIdent; add: anIdent; add: #metaExpression; add: aMetaExpression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> constantBody: ident baseType: baseType expression: initExpression [ 
	| r | r := OrderedCollection new. r add: #constantBody; add: ident; add: baseType; add: initExpression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> constantsDecl: constantsBodyCollectionOrNil [
	| r | r := OrderedCollection new. r add: #constantsDecl; add: constantsBodyCollectionOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> constantsEntry: constantsList [
	^ self buildParserResultWith: constantsList
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> deriveClause: derivedAttributesList [ 
	| r | r := OrderedCollection new. r add: #deriveClause; add: derivedAttributesList. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> derivedAttribute: attribute baseType: baseType expression: expression [ 
	| r | r := OrderedCollection new. r add: #derivedAttribute; add: attribute; add: baseType; add: expression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> eConstant [
	| r | r := OrderedCollection new. r add: #eConstant. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> elementQualifier: anExpression [
	| r | r := OrderedCollection new. r add: #elementQualifier; add: anExpression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> encodedStringLiteral: anEncodedString [ 
	| r | r := OrderedCollection new. r add:  
		#encodedStringLiteral.
		^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> endSplitmarkStatement [
	| r | r := OrderedCollection new. r add: #endSplitmarkStatement. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> entity: ident subSuper: anArrayOrNil explicitAttributes: explicitAttrListOrNil deriveClause: derivedClauseOrNil inverseClause: inverseClauseOrNil uniqueClause: uniqueClauseOrNil whereClause: whereClauseOrNil [ 
	| r | r := OrderedCollection new. r add: #entity; add: ident; add: anArrayOrNil; add: explicitAttrListOrNil; add: derivedClauseOrNil; add: inverseClauseOrNil; add: uniqueClauseOrNil; add: whereClauseOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> entityEntry: anEntity [
	^ self buildParserResultWith: anEntity
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> entityIdentifier: anIdent [
	^ anIdent
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> entitySupertype: supertypeConstraintOrNil subtype: subtypeDeclarationOrNil [
	| r | r := OrderedCollection new. r add: #entitySubSuper; add: supertypeConstraintOrNil; add: subtypeDeclarationOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> enumerationType: identList [ 
	| r | r := OrderedCollection new. r add: #enumerationType; add: identList. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> escapeStatement [
	| r | r := OrderedCollection new. r add: #escapeStatement. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> escapedExpression: anExpression [
	^ Array with: #escapedExpression with: anExpression
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> explicitAttributes: arg1 baseType: arg4 optional: arg3 [ 
	| r | r := OrderedCollection new. r add: #explicitAttributes; add: arg1; add: arg4; add: arg3. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> explicitlyImportedItem: name renamedAs: localName [
	| r | r := OrderedCollection new. r add: #explicitlyImportedItem; add: name; add:  localName. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> explicitlyImportedItems: aCollectionOfDomainEquivalentItems [
	| r | r := OrderedCollection new. r add: #explicitlyImportedItems; add: aCollectionOfDomainEquivalentItems. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 and: op2 [ 
	| r | r := OrderedCollection new. r add: #andExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: exp1 cardinality: op expression: exp2 [ 
	| r | r := OrderedCollection new. r add: #cardinalityExpression; add: exp1; add: op; add: exp2 . ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 div: op2 [ 
	| r | r := OrderedCollection new. r add: #divExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 equal: op2 [ 
	| r | r := OrderedCollection new. r add: #equalExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 expo: op2 [ 
	| r | r := OrderedCollection new. r add: #expoExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 greaterThan: op2 [ 
	| r | r := OrderedCollection new. r add: #greaterThanExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 greaterThanOrEqual: op2 [ 
	| r | r := OrderedCollection new. r add: #greaterThanOrEqualExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 in: op2 [ 
	| r | r := OrderedCollection new. r add: #inExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 instConst: op2 [ 
	| r | r := OrderedCollection new. r add: #instanceConstructionExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 instEqual: op2 [ 
	| r | r := OrderedCollection new. r add: #instEqualExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 instNotEqual: op2 [ 
	| r | r := OrderedCollection new. r add: #instNotEqualExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 lessThan: op2 [ 
	| r | r := OrderedCollection new. r add: #lessThanExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 lessThanOrEqual: op2 [ 
	| r | r := OrderedCollection new. r add: #lessThanOrEqualExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 like: op2 [ 
	| r | r := OrderedCollection new. r add: #likeExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 minus: op2 [ 
	| r | r := OrderedCollection new. r add: #minusExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 mod: op2 [ 
	| r | r := OrderedCollection new. r add: #modExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 mult: op2 [ 
	| r | r := OrderedCollection new. r add: #multExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 notEqual: op2 [ 
	| r | r := OrderedCollection new. r add: #notQualExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 or: op2 [ 
	| r | r := OrderedCollection new. r add: #orExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 plus: op2 [ 
	| r | r := OrderedCollection new. r add: #plusExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 realDiv: op2 [ 
	| r | r := OrderedCollection new. r add: #realDicExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expression: op1 xor: op2 [ 
	| r | r := OrderedCollection new. r add: #xorExpression; add: op1; add: op2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expressionBetweenParenthesis: expression [
	^ expression
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> expressionEntry: expression [
	^ expression
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> externalMetaSchema: schemaIdent [ 
	| r | r := OrderedCollection new. r add: #externalMetaShema; add: schemaIdent. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> formalParameter: identList parameterType: type var: varOrNotBoolean [ 
	| r | r := OrderedCollection new. r add: #formalParameter; add: identList; add: type; add: varOrNotBoolean. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> formalParametersList: aCollection [ 
	| r | r := OrderedCollection new. r add: #formalParametersList; add: aCollection. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> function: functionIdent formalParametersDecl: parametersListOrNil returnType: returnType actionBody: actionBody [ 
	| r | r := OrderedCollection new. r add: #function; add: functionIdent; add: parametersListOrNil; add: returnType; add: actionBody. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> functionEntry: aFunction [
	^ self buildParserResultWith: aFunction
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> functionIdentifier: anIdentifier [ 
	^ anIdentifier
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> genericType: keyIdentOrNil [
	| r | r := OrderedCollection new. r add: #genericType; add: keyIdentOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> groupRef: groupIdent [ 
	| r | r := OrderedCollection new. r add: #groupRef; add: groupIdent. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> identifier: aString [
	| r | r := OrderedCollection new. r add: #identifier. aString. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> identifier: aString arguments: arguments [
	| r | r := OrderedCollection new. r add: #identifier; add: aString; add: arguments. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> ifStatement: cond then: thenStatementOrNil else: elseStatementOrNil [ 
	| r | r := OrderedCollection new. r add: #ifStatement; add: cond; add: thenStatementOrNil; add: elseStatementOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> implementedSchemata: anIdentifier [ 
	| r | r := OrderedCollection new. r add: #implemented; add:  anIdentifier. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> incrementControl: ident first: firstValueExpression last: lastValueExpression step: byExpressionOrNil [ 
	| r | r := OrderedCollection new. r add: #incrementControl; add: ident; add: firstValueExpression; add: lastValueExpression; add: byExpressionOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> indexSpecFrom: lowIndex to: hiIndex [ 
	| r | r := OrderedCollection new. r add: #indexSpec; add: lowIndex; add: hiIndex. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> integerLiteral: anInteger [ 
	| r | r := OrderedCollection new. r add: #integerLiteral; add: anInteger. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> integerType: precisionSpecOrNil [ 
	| r | r := OrderedCollection new. r add: #integerType; add: precisionSpecOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> interfaceSpecification: useOrRefSymbol schema: schemaIdent interfaceList: interfacesListOrNil [ 
	| r | r := OrderedCollection new. r add: #interfaceSpecification; add: useOrRefSymbol; add: schemaIdent; add: interfacesListOrNil.  ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> intervalExpression: expression1 op: lessThanOrLessEqualSymbol1 expression: expression2 op: lessThanOrLessEqualSymbol2 expression: expression3 [ 
	| r | r := OrderedCollection new. r add: #intervalExpression; add: expression1; add: lessThanOrLessEqualSymbol1; add: expression2; add: lessThanOrLessEqualSymbol2; add: expression3. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> inverseAttribute: ident baseType: baseType for: attrIdent [ 
	| r | r := OrderedCollection new. r add: #inverseAttribute; add: ident; add: baseType; add: attrIdent. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> inverseAttributeDomain: baseType [
	^baseType
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> inverseClause: inverseAttributesList [ 
	| r | r := OrderedCollection new. r add: #inverseClause; add: inverseAttributesList. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> listType: indexSpecOrNil baseType: baseType unique: uniqueOrNil [ 
	| r | r := OrderedCollection new. r add: #listType; add: indexSpecOrNil; add: baseType; add: uniqueOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> localBody: ident baseType: baseType initializer: expressionOrNil [ 
	| r | r := OrderedCollection new. r add: #localBody; add: ident; add: baseType; add: expressionOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> localDecl: declarationsOrNil [
	| r | r := OrderedCollection new. r add: #localDecl; add: declarationsOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> logicalLiteral: trueFalseOrUnknown [ 
	| r | r := OrderedCollection new. r add: #logicalLiteral; add: trueFalseOrUnknown. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> logicalType [
	| r | r := OrderedCollection new. r add: #logicalType. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> missingValue: isARedefine [ 
	| r | r := OrderedCollection new. r add: #missingValue; add: isARedefine. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> namedType: anIdentifier [
	| r | r := OrderedCollection new. r add:  #namedType; add: anIdentifier . ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> nativeAlgorithm: aNativeAlgorithm [ 
	| r | r := OrderedCollection new. r add: #nativeAlgorithm; add: aNativeAlgorithm lexicalElement. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> nativeExpression: expr [
	| r | r := OrderedCollection new. r add: #nativeExpression; add: expr. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> nativeStatement: aNativeAlgorithm [ 
	| r | r := OrderedCollection new. r add: #nativeStatement; add: aNativeAlgorithm. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> negativeExpression: expression [ 
	| r | r := OrderedCollection new. r add: #negativeExpression; add: expression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> not: expression [ 
	| r | r := OrderedCollection new. r add: #notExpression; add: expression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> nullStatement [
	| r | r := OrderedCollection new. r add: #nullStatement . ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> numberType [
	| r | r := OrderedCollection new. r add: #numberType. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> outputStatement: expression [ 
	| r | r := OrderedCollection new. r add: #outputStatement; add: expression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> piConstant [
	| r | r := OrderedCollection new. r add: #piConstant. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> positiveExpression: expression [ 
	| r | r := OrderedCollection new. r add: #positiveExpression; add: expression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> precisionSpec: anExpression [ 
	| r | r := OrderedCollection new. r add: #precisionSpec; add: anExpression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> procedure: ident formalParametersDecl: parametersListOrNil actionBody: actionBody [ 
	| r | r := OrderedCollection new. r add: #procedure; add: ident; add: parametersListOrNil; add: actionBody. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> procedureCall: ident [
	| r | r := OrderedCollection new. r add: #procedureCall; add: ident. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> procedureEntry: aProcedure [
	^ self buildParserResultWith: aProcedure
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> procedureIdentifier: anIdentifier [ 
	^ anIdentifier
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> qualifiedExpression: expression qualifiers: qualifiersList [ 
	| r | r := OrderedCollection new. r add: #qualifiedExpression; add: expression; add: qualifiersList. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> queryExpression: ident source: sourceExpression suchThat: suchThatExpression [ 
	| r | r := OrderedCollection new. r add: #queryExpression; add: ident; add: sourceExpression; add: suchThatExpression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> queryVariable: ident [
	| r | r := OrderedCollection new. r add:  #queryVariable; add: ident. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> rangeQualifierFrom: lowExpression to: highExpression [ 
	| r | r := OrderedCollection new. r add: #rangeQualifier; add: lowExpression; add: highExpression. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> realLiteral: aReal [ 
	| r | r := OrderedCollection new. r add: #realLiteral; add: aReal. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> realType: precisionSpecOrNil [ 
	| r | r := OrderedCollection new. r add: #RealType; add: precisionSpecOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> realizationEntities: aListOrNil [ 
	| r | r := OrderedCollection new. r add: #realizationEntities; add: aListOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> realizationIdentifier: anIdentifier [ 
	^ anIdentifier
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> realizedSchemata: aListOrNil [
	| r | r := OrderedCollection new. r add: #realizedSchemata; add: aListOrNil. ^ r
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForActionBody1: nodes [
	^ self actionBodyDecl: (nodes at: 1) value statements: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForActionBodyDecl1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForActionBodyDecl2: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregateInitBody1: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregateInitBody2: nodes [
	^ OrderedCollection new
		addAll: (nodes at: 1) value;
		add: (nodes at: 3) value;
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregateInitElement1: nodes [
	^ self aggregateInitializerElement: (nodes at: 1) value repetition: nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregateInitElement2: nodes [
	^ self aggregateInitializerElement: (nodes at: 1) value repetition: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregateInitializer1: nodes [
	^ self aggregateInitializer: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregateInitializer2: nodes [
	^ self aggregateInitializer: #()
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregateType1: nodes [
	^ self aggregateType: nil parameterType: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregateType2: nodes [
	^ self aggregateType: (nodes at: 3) value parameterType: (nodes at: 5) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregationType1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregationType2: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregationType3: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregationType4: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAggregationType5: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAliasStatement1: nodes [
	^ self aliasStatement: (nodes at: 2) value statements: (nodes at: 4) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAliasStatementVariable1: nodes [
	^ self aliasStatementVariable: (nodes at: 1) value for: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForArgumentedIdentifier1: nodes [
	^ self identifier: (nodes at: 1) value arguments: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForArrayType1: nodes [
	^ self arrayType: (nodes at: 2) value baseType: (nodes at: 5) value optionalOrUnique: (nodes at: 4) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAssignable1: nodes [
	^ self assignable: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAssignableList1: nodes [
	^ OrderedCollection new
		addAll: (nodes at: 1) value;
		add: (nodes at: 2) value;
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAssignableList2: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAssignmentStatement1: nodes [
	^ self assignmentStatement: (nodes at: 1) value from: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAttributeNameDecl1: nodes [
	^ self attributeName: (nodes at: 1) value groupRef: nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAttributeNameDecl2: nodes [
	^ self attributeName: (nodes at: 5) value groupRef: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAttributesNameDeclList1: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForAttributesNameDeclList2: nodes [
	^ OrderedCollection new
		addAll: (nodes at: 1) value;
		add: (nodes at: 3) value;
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForBagType1: nodes [
	^ self bagType: (nodes at: 2) value baseType: (nodes at: 4) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForBaseType1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForBlock1: nodes [
	^ self block: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForBlock2: nodes [
	^ self block: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForBlock3: nodes [
	^ self block: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForBlock4: nodes [
	^ self block: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForBlock5: nodes [
	^ self block: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForBlock6: nodes [
	^ self block: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForByExpression1: nodes [
	^ (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForCardinalityOp1: nodes [
	^ self cardinalityExpressionFrom: (nodes at: 2) value to: (nodes at: 4) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForCaseAction1: nodes [
	^ self caseAction: (nodes at: 1) value statement: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForCaseOtherwise1: nodes [
	^ self caseOtherwise: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForCaseStatement1: nodes [
	^ self caseStatement: (nodes at: 2) value caseActions: (nodes at: 4) value caseOtherwise: (nodes at: 5) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForCompoundStatement1: nodes [
	^ self compoundStatement: (nodes at: 1) value statements: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForCompoundStatementBegin1: nodes [
	^ self compoundStatementBegin
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForConceptIdentifier1: nodes [
	^ self conceptIdentifier: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForConceptIdentifier2: nodes [
	^ self conceptIdentifier: (nodes at: 2) metaExpression: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForConceptIdentifier3: nodes [
	^ self conceptIdentifier: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForConceptIdentifier4: nodes [
	^ self conceptIdentifier: (nodes at: 1) metaExpression: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForConstantBody1: nodes [
	^ self constantBody: (nodes at: 1) value baseType: (nodes at: 3) value expression: (nodes at: 5) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForConstantsDecl1: nodes [
	^ self constantsDecl: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForConstantsEntry1: nodes [
	^ self constantsEntry: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForConstructedType1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForConstructedType2: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForDeriveClause1: nodes [
	^ self deriveClause: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForDerivedAttribute1: nodes [
	^ self derivedAttribute: (nodes at: 1) value baseType: (nodes at: 3) value expression: (nodes at: 5) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForDomainType1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForDomainType2: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForDomainType3: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForDomainType4: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForDomainType5: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForEndSplitmarkStatement1: nodes [
	^ self endSplitmarkStatement
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForEntity1: nodes [
	^ self
		entity: (nodes at: 2) value
		subSuper: (nodes at: 3) value
		explicitAttributes: (nodes at: 5) value
		deriveClause: (nodes at: 6) value
		inverseClause: (nodes at: 7) value
		uniqueClause: (nodes at: 8) value
		whereClause: (nodes at: 9) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForEntityEntry1: nodes [
	^ self entityEntry: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForEntityIdentifier1: nodes [
	^ self entityIdentifier: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForEntitySubSuper1: nodes [
	^ self entitySupertype: (nodes at: 1) value subtype: nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForEntitySubSuper2: nodes [
	^ self entitySupertype: nil subtype: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForEntitySubSuper3: nodes [
	^ self entitySupertype: (nodes at: 1) value subtype: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForEnumerationType1: nodes [
	^ self enumerationType: (nodes at: 4) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForEscapeStatement1: nodes [
	^ self escapeStatement
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExplicitAttribute1: nodes [
	^ self explicitAttributes: (nodes at: 1) value baseType: (nodes at: 4) value optional: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExplicitlyImportedItem1: nodes [
	^ self explicitlyImportedItem: (nodes at: 1) value renamedAs: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExplicitlyImportedItem2: nodes [
	^ self explicitlyImportedItem: (nodes at: 1) value renamedAs: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExplicitlyImportedItemsList1: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExplicitlyImportedItemsList2: nodes [
	^ OrderedCollection new
		addAll: (nodes at: 1) value;
		add: (nodes at: 3) value;
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpression10: nodes [
	^ self expression: (nodes at: 1) value in: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpression11: nodes [
	^ self expression: (nodes at: 1) value like: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpression1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpression2: nodes [
	^ self expression: (nodes at: 1) value lessThan: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpression3: nodes [
	^ self expression: (nodes at: 1) value greaterThan: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpression4: nodes [
	^ self expression: (nodes at: 1) value equal: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpression5: nodes [
	^ self expression: (nodes at: 1) value lessThanOrEqual: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpression6: nodes [
	^ self expression: (nodes at: 1) value greaterThanOrEqual: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpression7: nodes [
	^ self expression: (nodes at: 1) value notEqual: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpression8: nodes [
	^ self expression: (nodes at: 1) value instEqual: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpression9: nodes [
	^ self expression: (nodes at: 1) value instNotEqual: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpressionEntry1: nodes [
	^ self expressionEntry: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpressionsList1: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForExpressionsList2: nodes [
	^ OrderedCollection new
		addAll: (nodes at: 1) value;
		add: (nodes at: 3) value;
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForFactor1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForFactor2: nodes [
	^ self expression: (nodes at: 1) value expo: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForFixedOrNot1: nodes [
	^ true
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForFixedOrNot2: nodes [
	^ false
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForFixedOrNotPrecisionSpec1: nodes [
	^ Array with: (nodes at: 1) value with: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForFormalParameter1: nodes [
	^ self formalParameter: (nodes at: 2) value parameterType: (nodes at: 4) value var: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForFormalParametersDecl1: nodes [
	^ self formalParametersList: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForFormalParametersList1: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForFormalParametersList2: nodes [
	^ OrderedCollection new
		addAll: (nodes at: 1) value;
		add: (nodes at: 3) value;
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForFunction1: nodes [
	^ self
		function: (nodes at: 2) value
		formalParametersDecl: (nodes at: 3) value
		returnType: (nodes at: 5) value
		actionBody: (nodes at: 7) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForFunctionEntry1: nodes [
	^ self functionEntry: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForFunctionIdentifier1: nodes [
	^ self functionIdentifier: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForGenericType1: nodes [
	^ self genericType: nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForGenericType2: nodes [
	^ self genericType: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForGroupRef1: nodes [
	^ self groupRef: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForIdentifier1: nodes [
	^ self selfIdentifier
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForIdentifier2: nodes [
	^ self missingValue: false
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForIdentifier3: nodes [
	^ self identifier: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForIdentifier4: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForIdentifiersList1: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForIdentifiersList2: nodes [
	^ OrderedCollection new
		addAll: (nodes at: 1) value;
		add: (nodes at: 3) value;
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForIfStatement1: nodes [
	^ self ifStatement: (nodes at: 2) value then: (nodes at: 4) value else: nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForIfStatement2: nodes [
	^ self ifStatement: (nodes at: 2) value then: (nodes at: 4) value else: (nodes at: 6) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForIncrementControl1: nodes [
	^ self
		incrementControl: (nodes at: 1) value
		first: (nodes at: 3)
		last: (nodes at: 5) value
		step: (nodes at: 6) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForIndexSpec1: nodes [
	^ self indexSpecFrom: (nodes at: 2) value to: (nodes at: 4) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForInterfaceList1: nodes [
	^ self explicitlyImportedItems: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForInterfaceSpecification1: nodes [
	^ self interfaceSpecification: (nodes at: 1) value schema: (nodes at: 3) value interfaceList: (nodes at: 4) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForInterfaceSpecification2: nodes [
	^ self externalMetaSchema: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForInterval1: nodes [
	^ self
		intervalExpression: (nodes at: 2) value
		op: (nodes at: 3) value
		expression: (nodes at: 4) value
		op: (nodes at: 5) value
		expression: (nodes at: 6) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForIntervalOp1: nodes [
	^ #<
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForIntervalOp2: nodes [
	^ #<=
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForInverseAttribute1: nodes [
	^ self inverseAttribute: (nodes at: 1) value baseType: (nodes at: 3) value for: (nodes at: 5) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForInverseAttributeDomain1: nodes [
	^ self inverseAttributeDomain: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForInverseClause1: nodes [
	^ self inverseClause: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForListType1: nodes [
	^ self listType: (nodes at: 2) value baseType: (nodes at: 5) value unique: (nodes at: 4) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLiteral10: nodes [
	^ self eConstant
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLiteral1: nodes [
	^ self integerLiteral: (nodes at: 1) value asNumber
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLiteral2: nodes [
	^ self realLiteral: (nodes at: 1) value asNumber
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLiteral3: nodes [
	^ self stringLiteral: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLiteral4: nodes [
	^ self encodedStringLiteral: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLiteral5: nodes [
	^ self logicalLiteral: #true
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLiteral6: nodes [
	^ self logicalLiteral: #false
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLiteral7: nodes [
	^ self logicalLiteral: #unknown
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLiteral8: nodes [
	^ self binaryLiteral: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLiteral9: nodes [
	^ self piConstant
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLocalBody1: nodes [
	^ self localBody: (nodes at: 1) value baseType: (nodes at: 3) value initializer: nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLocalBody2: nodes [
	^ self localBody: (nodes at: 1) value baseType: (nodes at: 3) value initializer: (nodes at: 5) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForLocalDecl1: nodes [
	^ self localDecl: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForMapIdentifiersPath1: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForMapIdentifiersPath2: nodes [
	^ OrderedCollection new
		addAll: (nodes at: 1) value;
		add: (nodes at: 3) value;
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForMapIdentifiersPathAndSemicolon1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForNamedType1: nodes [
	^ self namedType: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForNativeAlgorithm1: nodes [
	^ self nativeAlgorithm: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForNativeExpression1: nodes [
	^ self nativeExpression: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForNativeStatement1: nodes [
	^ self nativeStatement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForNullStatement1: nodes [
	^ self nullStatement
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptional1: nodes [
	^ true
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptional2: nodes [
	^ false
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalOrUnique1: nodes [
	^ Array with: #optional with: #unique
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalOrUnique2: nodes [
	^ Array with: #optional with: #unique
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalOrUnique3: nodes [
	^ Array with: #optional
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalOrUnique4: nodes [
	^ Array with: #unique
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXByExpression1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXByExpression2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXCaseOtherwise1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXCaseOtherwise2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXDeriveClause1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXDeriveClause2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXEntitySubSuper1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXEntitySubSuper2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXExpressionsList1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXExpressionsList2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXFixedOrNotPrecisionSpec1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXFixedOrNotPrecisionSpec2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXFormalParametersDecl1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXFormalParametersDecl2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXIncrementControl1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXIncrementControl2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXIndexSpec1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXIndexSpec2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXInterfaceList1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXInterfaceList2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXInverseClause1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXInverseClause2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXOptionalOrUnique1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXOptionalOrUnique2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXPrecisionSpec1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXPrecisionSpec2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXSupertypeRuleTail1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXSupertypeRuleTail2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXUniqueClause1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXUniqueClause2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXUntilControl1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXUntilControl2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXWhereClause1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXWhereClause2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXWhileControl1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXWhileControl2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXXXX1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXXXX2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXXuniqueX1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOptionalXXXuniqueX2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForOutputStatement1: nodes [
	^ self outputStatement: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForParameterType1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForPrecisionSpec1: nodes [
	^ self precisionSpec: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForProcedure1: nodes [
	^ self procedure: (nodes at: 2) value formalParametersDecl: (nodes at: 3) value actionBody: (nodes at: 5) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForProcedureCallStatement1: nodes [
	^ self procedureCall: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForProcedureEntry1: nodes [
	^ self procedureEntry: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForProcedureIdentifier1: nodes [
	^ self procedureIdentifier: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForQualifier1: nodes [
	^ self attributeQualifier: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForQualifier2: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForQualifier3: nodes [
	^ self elementQualifier: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForQualifier4: nodes [
	^ self rangeQualifierFrom: (nodes at: 2) value to: (nodes at: 4) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForQueryExpression1: nodes [
	^ self queryExpression: (nodes at: 3) value source: (nodes at: 5) value suchThat: (nodes at: 7) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForQueryVariable1: nodes [
	^ self queryVariable: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRemarkReference1: nodes [
	^ self remarkReference: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatStatement1: nodes [
	^ self
		repeatStatement: (nodes at: 2) value
		whileControl: (nodes at: 3) value
		untilControl: (nodes at: 4) value
		statements: (nodes at: 6) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXMultipleXXDerivedAttribute1: nodes [
	^ OrderedCollection with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXMultipleXXDerivedAttribute2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXMultipleXXInverseAttribute1: nodes [
	^ OrderedCollection with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXMultipleXXInverseAttribute2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXMultipleXXQualifier1: nodes [
	^ OrderedCollection with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXMultipleXXQualifier2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXMultipleXXUniqueAttributesList1: nodes [
	^ OrderedCollection with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXMultipleXXUniqueAttributesList2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXMultipleXXWhereRule1: nodes [
	^ OrderedCollection with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXMultipleXXWhereRule2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXMultipleXXXnativeAlgorithmX1: nodes [
	^ OrderedCollection with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXMultipleXXXnativeAlgorithmX2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXActionBodyDecl1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXActionBodyDecl2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXBlock1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXBlock2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXCaseAction1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXCaseAction2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXConstantBody1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXConstantBody2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXExplicitAttribute1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXExplicitAttribute2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXInterfaceSpecification1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXInterfaceSpecification2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXLocalBody1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXLocalBody2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXMapIdentifiersPathAndSemicolon1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXMapIdentifiersPathAndSemicolon2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXRemarkReference1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXRemarkReference2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXSchemaEntry1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXSchemaEntry2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXStatement1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRepeatXXStatement2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForReturnStatement1: nodes [
	^ self returnStatement: nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForReturnStatement2: nodes [
	^ self returnStatement: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRule1: nodes [
	^ self
		rule: (nodes at: 2) value
		entities: (nodes at: 5) value
		actionBody: (nodes at: 8) value
		whereClause: (nodes at: 9) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRuleEntry1: nodes [
	^ self ruleEntry: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForRuleIdentifier1: nodes [
	^ self ruleIdentifier: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSchema1: nodes [
	^ self schema: (nodes at: 2) value interfaces: (nodes at: 4) blocks: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSchemaContents1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSchemaContentsEntry1: nodes [
	^ self schemaContentsEntry: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSchemaEntry1: nodes [
	^ self schemaEntry: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSchemaIdentifier1: nodes [
	^ self schemaIdentifier: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSchemaInstance1: nodes [
	^ self schemaInstance: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSchemaInstanceEntry1: nodes [
	^ self schemaInstanceEntry: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSelectType1: nodes [
	^ self selectType: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSetType1: nodes [
	^ self setType: (nodes at: 2) value baseType: (nodes at: 4) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSignedSimpleFactor1: nodes [
	^ self positiveExpression: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSignedSimpleFactor2: nodes [
	^ self negativeExpression: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleAttributeNameDecl1: nodes [
	^ self simpleAttributeName: (nodes at: 1) value groupRef: nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleAttributeNameDecl2: nodes [
	^ self simpleAttributeName: (nodes at: 5) value groupRef: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleExpression1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleExpression2: nodes [
	^ self expression: (nodes at: 1) value or: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleExpression3: nodes [
	^ self expression: (nodes at: 1) value xor: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleExpression4: nodes [
	^ self expression: (nodes at: 1) value plus: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleExpression5: nodes [
	^ self expression: (nodes at: 1) value minus: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleFactor10: nodes [
	^ self not: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleFactor11: nodes [
	^ self expression: (nodes at: 1) value cardinality: (nodes at: 2) value expression: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleFactor12: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleFactor1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleFactor2: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleFactor3: nodes [
	^ self qualifiedExpression: (nodes at: 1) value qualifiers: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleFactor4: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleFactor5: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleFactor6: nodes [
	^ self expressionBetweenParenthesis: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleFactor7: nodes [
	^ self escapedExpression: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleFactor8: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleFactor9: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleIdentifier1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleType1: nodes [
	^ self stringType: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleType2: nodes [
	^ self binaryType: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleType3: nodes [
	^ self numberType
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleType4: nodes [
	^ self realType: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleType5: nodes [
	^ self integerType: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleType6: nodes [
	^ self logicalType
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSimpleType7: nodes [
	^ self booleanType
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSkipStatement1: nodes [
	^ self skipStatement
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSplitmarkStatement1: nodes [
	^ self beginSplitmarkStatement: (nodes at: 4) value append: (nodes at: 2) notNil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement10: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement11: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement12: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement13: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement14: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement15: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement1: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement2: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement3: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement4: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement5: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement6: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement7: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement8: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatement9: nodes [
	^ self statement: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForStatementsEntry1: nodes [
	^ self statementsEntry: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSubtypeDeclaration1: nodes [
	^ self subtypeDeclaration: (nodes at: 4) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSubtypeIdentifier1: nodes [
	^ self subtypeIdentifier: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSubtypeIdentifiersList1: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSubtypeIdentifiersList2: nodes [
	^ OrderedCollection new
		addAll: (nodes at: 1) value;
		add: (nodes at: 3) value;
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSupertypeConstraint1: nodes [
	^ self abstractSupertypeConstraint: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSupertypeConstraint2: nodes [
	^ self supertypeConstraint: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSupertypeExpression1: nodes [
	^ self supertypeEntityReference: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSupertypeExpression2: nodes [
	^ self supertypeExpression: (nodes at: 1) value andor: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSupertypeExpression3: nodes [
	^ self supertypeExpression: (nodes at: 1) value and: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSupertypeExpression4: nodes [
	^ self supertypeOneofExpression: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSupertypeExpression5: nodes [
	^ (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSupertypeExpressionsList1: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSupertypeExpressionsList2: nodes [
	^ OrderedCollection new
		addAll: (nodes at: 1) value;
		add: (nodes at: 3) value;
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForSupertypeRuleTail1: nodes [
	^ (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForTerm1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForTerm2: nodes [
	^ self expression: (nodes at: 1) value and: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForTerm3: nodes [
	^ self expression: (nodes at: 1) value mod: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForTerm4: nodes [
	^ self expression: (nodes at: 1) value div: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForTerm5: nodes [
	^ self expression: (nodes at: 1) value realDiv: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForTerm6: nodes [
	^ self expression: (nodes at: 1) value mult: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForTerm7: nodes [
	^ self expression: (nodes at: 1) value instConst: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForType1: nodes [
	^ self type: (nodes at: 2) value underlyingType: (nodes at: 4) value whereClause: (nodes at: 6) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForType2: nodes [
	^ self typeMapFrom: (nodes at: 2) to: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForType3: nodes [
	^ self typeMapTo: (nodes at: 3) from: (nodes at: 5) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForType4: nodes [
	^ self typeMapWhereClause: (nodes at: 5) to: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForTypeEntry1: nodes [
	^ self typeEntry: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForTypeIdentifier1: nodes [
	^ self typeIdentifier: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForUnderlyingType1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForUniqueAttributesList1: nodes [
	^ self uniqueAttributesList: (nodes at: 2) value head: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForUniqueAttributesList2: nodes [
	^ self uniqueAttributesList: (nodes at: 1) value head: nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForUniqueClause1: nodes [
	^ self uniqueClause: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForUniqueListHead1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForUniqueNamesList1: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForUniqueNamesList2: nodes [
	^ OrderedCollection new
		addAll: (nodes at: 1) value;
		add: (nodes at: 3) value;
		yourself
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForUntilControl1: nodes [
	^ (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForUseOrReference1: nodes [
	^ #USED
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForUseOrReference2: nodes [
	^ #REFERENCED
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForVar1: nodes [
	^ true
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForVar2: nodes [
	^ false
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForWhereClause1: nodes [
	^ self whereClause: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForWhereRule1: nodes [
	^ self whereRule: (nodes at: 2) value head: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForWhereRule2: nodes [
	^ self whereRule: (nodes at: 1) value head: nil
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForWhereRuleHead1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressAbstractParser >> reduceActionForWhileControl1: nodes [
	^ (nodes at: 2) value
]

{ #category : #'generated-tables' }
PlatypusExpressAbstractParser >> reduceTable [
	^#(
#(132 1 #reduceActionForSchemaEntry1:)
#(133 1 #reduceActionForSchemaContentsEntry1:)
#(134 1 #reduceActionForConstantsEntry1:)
#(135 1 #reduceActionForTypeEntry1:)
#(136 1 #reduceActionForEntityEntry1:)
#(137 1 #reduceActionForFunctionEntry1:)
#(138 1 #reduceActionForProcedureEntry1:)
#(139 1 #reduceActionForRuleEntry1:)
#(140 1 #reduceActionForStatementsEntry1:)
#(141 1 #reduceActionForExpressionEntry1:)
#(142 2 #reduceActionForSchemaInstance1:)
#(143 1 #reduceFor:)
#(144 1 #reduceActionForRemarkReference1:)
#(145 0 #reduceActionForRepeatXXRemarkReference1:)
#(145 2 #reduceActionForRepeatXXRemarkReference2:)
#(146 0 #reduceActionForRepeatXXSchemaEntry1:)
#(146 2 #reduceActionForRepeatXXSchemaEntry2:)
#(147 1 #reduceActionForSimpleIdentifier1:)
#(148 1 #reduceActionForExpression1:)
#(148 3 #reduceActionForExpression2:)
#(148 3 #reduceActionForExpression3:)
#(148 3 #reduceActionForExpression4:)
#(148 3 #reduceActionForExpression5:)
#(148 3 #reduceActionForExpression6:)
#(148 3 #reduceActionForExpression7:)
#(148 3 #reduceActionForExpression8:)
#(148 3 #reduceActionForExpression9:)
#(148 3 #reduceActionForExpression10:)
#(148 3 #reduceActionForExpression11:)
#(149 2 #reduceActionForConceptIdentifier1:)
#(149 5 #reduceActionForConceptIdentifier2:)
#(149 1 #reduceActionForConceptIdentifier3:)
#(149 4 #reduceActionForConceptIdentifier4:)
#(150 1 #reduceActionForSchemaIdentifier1:)
#(151 2 #reduceFor:)
#(152 1 #reduceActionForStatement1:)
#(152 1 #reduceActionForStatement2:)
#(152 1 #reduceActionForStatement3:)
#(152 1 #reduceActionForStatement4:)
#(152 1 #reduceActionForStatement5:)
#(152 1 #reduceActionForStatement6:)
#(152 1 #reduceActionForStatement7:)
#(152 1 #reduceActionForStatement8:)
#(152 1 #reduceActionForStatement9:)
#(152 1 #reduceActionForStatement10:)
#(152 1 #reduceActionForStatement11:)
#(152 1 #reduceActionForStatement12:)
#(152 1 #reduceActionForStatement13:)
#(152 1 #reduceActionForStatement14:)
#(152 1 #reduceActionForStatement15:)
#(153 0 #reduceActionForRepeatXXStatement1:)
#(153 2 #reduceActionForRepeatXXStatement2:)
#(154 7 #reduceActionForSchema1:)
#(155 1 #reduceActionForSchemaContents1:)
#(156 5 #reduceActionForInterfaceSpecification1:)
#(156 4 #reduceActionForInterfaceSpecification2:)
#(157 0 #reduceActionForRepeatXXInterfaceSpecification1:)
#(157 2 #reduceActionForRepeatXXInterfaceSpecification2:)
#(158 1 #reduceActionForSchemaInstanceEntry1:)
#(159 0 #reduceActionForRepeatXXBlock1:)
#(159 2 #reduceActionForRepeatXXBlock2:)
#(160 1 #reduceActionForUseOrReference1:)
#(160 1 #reduceActionForUseOrReference2:)
#(161 3 #reduceActionForInterfaceList1:)
#(162 0 #reduceActionForOptionalXXInterfaceList1:)
#(162 1 #reduceActionForOptionalXXInterfaceList2:)
#(163 1 #reduceActionForExplicitlyImportedItemsList1:)
#(163 3 #reduceActionForExplicitlyImportedItemsList2:)
#(164 1 #reduceActionForExplicitlyImportedItem1:)
#(164 3 #reduceActionForExplicitlyImportedItem2:)
#(165 4 #reduceActionForConstantsDecl1:)
#(166 6 #reduceActionForConstantBody1:)
#(167 0 #reduceActionForRepeatXXConstantBody1:)
#(167 2 #reduceActionForRepeatXXConstantBody2:)
#(168 1 #reduceActionForBaseType1:)
#(169 11 #reduceActionForRule1:)
#(170 1 #reduceActionForRuleIdentifier1:)
#(171 2 #reduceActionForIdentifiersList1:)
#(171 4 #reduceActionForIdentifiersList2:)
#(172 2 #reduceActionForActionBody1:)
#(173 3 #reduceActionForWhereClause1:)
#(174 9 #reduceActionForFunction1:)
#(175 1 #reduceActionForFunctionIdentifier1:)
#(176 3 #reduceActionForFormalParametersDecl1:)
#(177 0 #reduceActionForOptionalXXFormalParametersDecl1:)
#(177 1 #reduceActionForOptionalXXFormalParametersDecl2:)
#(178 1 #reduceActionForParameterType1:)
#(179 7 #reduceActionForProcedure1:)
#(180 1 #reduceActionForProcedureIdentifier1:)
#(181 1 #reduceActionForActionBodyDecl1:)
#(181 1 #reduceActionForActionBodyDecl2:)
#(182 0 #reduceActionForRepeatXXActionBodyDecl1:)
#(182 2 #reduceActionForRepeatXXActionBodyDecl2:)
#(183 4 #reduceActionForLocalDecl1:)
#(184 6 #reduceActionForAliasStatement1:)
#(185 4 #reduceActionForAssignmentStatement1:)
#(186 7 #reduceActionForCaseStatement1:)
#(187 4 #reduceActionForCompoundStatement1:)
#(188 2 #reduceActionForEscapeStatement1:)
#(189 6 #reduceActionForIfStatement1:)
#(189 8 #reduceActionForIfStatement2:)
#(190 8 #reduceActionForRepeatStatement1:)
#(191 2 #reduceActionForReturnStatement1:)
#(191 5 #reduceActionForReturnStatement2:)
#(192 2 #reduceActionForSkipStatement1:)
#(193 4 #reduceActionForOutputStatement1:)
#(194 5 #reduceActionForSplitmarkStatement1:)
#(195 4 #reduceActionForEndSplitmarkStatement1:)
#(196 1 #reduceActionForNativeStatement1:)
#(197 2 #reduceActionForProcedureCallStatement1:)
#(198 1 #reduceActionForNullStatement1:)
#(199 2 #reduceActionForAssignableList1:)
#(199 1 #reduceActionForAssignableList2:)
#(200 1 #reduceActionForAssignable1:)
#(201 1 #reduceActionForIdentifier1:)
#(201 1 #reduceActionForIdentifier2:)
#(201 1 #reduceActionForIdentifier3:)
#(201 1 #reduceActionForIdentifier4:)
#(202 2 #reduceActionForQualifier1:)
#(202 1 #reduceActionForQualifier2:)
#(202 3 #reduceActionForQualifier3:)
#(202 5 #reduceActionForQualifier4:)
#(203 1 #reduceActionForNativeAlgorithm1:)
#(204 1 #reduceActionForNativeExpression1:)
#(205 1 #reduceActionForRepeatXMultipleXXXnativeAlgorithmX1:)
#(205 2 #reduceActionForRepeatXMultipleXXXnativeAlgorithmX2:)
#(206 3 #reduceActionForAliasStatementVariable1:)
#(207 1 #reduceActionForExpressionsList1:)
#(207 3 #reduceActionForExpressionsList2:)
#(208 3 #reduceActionForCaseAction1:)
#(209 3 #reduceActionForCaseOtherwise1:)
#(210 0 #reduceActionForRepeatXXCaseAction1:)
#(210 2 #reduceActionForRepeatXXCaseAction2:)
#(211 0 #reduceActionForOptionalXXCaseOtherwise1:)
#(211 1 #reduceActionForOptionalXXCaseOtherwise2:)
#(212 1 #reduceActionForCompoundStatementBegin1:)
#(213 2 #reduceActionForByExpression1:)
#(214 0 #reduceActionForOptionalXXByExpression1:)
#(214 1 #reduceActionForOptionalXXByExpression2:)
#(215 6 #reduceActionForIncrementControl1:)
#(216 2 #reduceActionForWhileControl1:)
#(217 2 #reduceActionForUntilControl1:)
#(218 0 #reduceActionForOptionalXXIncrementControl1:)
#(218 1 #reduceActionForOptionalXXIncrementControl2:)
#(219 0 #reduceActionForOptionalXXWhileControl1:)
#(219 1 #reduceActionForOptionalXXWhileControl2:)
#(221 0 #reduceActionForOptionalXXXXX1:)
#(221 1 #reduceActionForOptionalXXXXX2:)
#(222 4 #reduceActionForLocalBody1:)
#(222 6 #reduceActionForLocalBody2:)
#(223 0 #reduceActionForRepeatXXLocalBody1:)
#(223 2 #reduceActionForRepeatXXLocalBody2:)
#(224 1 #reduceActionForFormalParametersList1:)
#(224 3 #reduceActionForFormalParametersList2:)
#(225 4 #reduceActionForFormalParameter1:)
#(226 1 #reduceActionForVar1:)
#(226 0 #reduceActionForVar2:)
#(227 11 #reduceActionForEntity1:)
#(228 1 #reduceActionForEntityIdentifier1:)
#(229 1 #reduceActionForEntitySubSuper1:)
#(229 1 #reduceActionForEntitySubSuper2:)
#(229 2 #reduceActionForEntitySubSuper3:)
#(230 0 #reduceActionForOptionalXXEntitySubSuper1:)
#(230 1 #reduceActionForOptionalXXEntitySubSuper2:)
#(231 5 #reduceActionForExplicitAttribute1:)
#(232 0 #reduceActionForRepeatXXExplicitAttribute1:)
#(232 2 #reduceActionForRepeatXXExplicitAttribute2:)
#(233 3 #reduceActionForDeriveClause1:)
#(234 0 #reduceActionForOptionalXXDeriveClause1:)
#(234 1 #reduceActionForOptionalXXDeriveClause2:)
#(235 3 #reduceActionForInverseClause1:)
#(236 0 #reduceActionForOptionalXXInverseClause1:)
#(236 1 #reduceActionForOptionalXXInverseClause2:)
#(237 3 #reduceActionForUniqueClause1:)
#(238 0 #reduceActionForOptionalXXUniqueClause1:)
#(238 1 #reduceActionForOptionalXXUniqueClause2:)
#(239 0 #reduceActionForOptionalXXWhereClause1:)
#(239 1 #reduceActionForOptionalXXWhereClause2:)
#(240 3 #reduceActionForSupertypeConstraint1:)
#(240 2 #reduceActionForSupertypeConstraint2:)
#(241 5 #reduceActionForSubtypeDeclaration1:)
#(242 1 #reduceActionForSubtypeIdentifiersList1:)
#(242 3 #reduceActionForSubtypeIdentifiersList2:)
#(243 1 #reduceActionForSubtypeIdentifier1:)
#(244 4 #reduceActionForSupertypeRuleTail1:)
#(245 0 #reduceActionForOptionalXXSupertypeRuleTail1:)
#(245 1 #reduceActionForOptionalXXSupertypeRuleTail2:)
#(246 1 #reduceActionForSupertypeExpression1:)
#(246 3 #reduceActionForSupertypeExpression2:)
#(246 3 #reduceActionForSupertypeExpression3:)
#(246 4 #reduceActionForSupertypeExpression4:)
#(246 3 #reduceActionForSupertypeExpression5:)
#(247 1 #reduceActionForSupertypeExpressionsList1:)
#(247 3 #reduceActionForSupertypeExpressionsList2:)
#(248 1 #reduceActionForAttributeNameDecl1:)
#(248 5 #reduceActionForAttributeNameDecl2:)
#(249 1 #reduceActionForSimpleAttributeNameDecl1:)
#(249 5 #reduceActionForSimpleAttributeNameDecl2:)
#(250 1 #reduceActionForAttributesNameDeclList1:)
#(250 3 #reduceActionForAttributesNameDeclList2:)
#(251 1 #reduceActionForOptional1:)
#(251 0 #reduceActionForOptional2:)
#(252 6 #reduceActionForDerivedAttribute1:)
#(253 1 #reduceActionForRepeatXMultipleXXDerivedAttribute1:)
#(253 2 #reduceActionForRepeatXMultipleXXDerivedAttribute2:)
#(254 6 #reduceActionForInverseAttribute1:)
#(255 1 #reduceActionForRepeatXMultipleXXInverseAttribute1:)
#(255 2 #reduceActionForRepeatXMultipleXXInverseAttribute2:)
#(256 1 #reduceActionForInverseAttributeDomain1:)
#(257 3 #reduceActionForUniqueAttributesList1:)
#(257 2 #reduceActionForUniqueAttributesList2:)
#(258 1 #reduceActionForRepeatXMultipleXXUniqueAttributesList1:)
#(258 2 #reduceActionForRepeatXMultipleXXUniqueAttributesList2:)
#(259 2 #reduceActionForUniqueListHead1:)
#(260 1 #reduceActionForUniqueNamesList1:)
#(260 3 #reduceActionForUniqueNamesList2:)
#(261 8 #reduceActionForType1:)
#(261 7 #reduceActionForType2:)
#(261 7 #reduceActionForType3:)
#(261 7 #reduceActionForType4:)
#(262 1 #reduceActionForTypeIdentifier1:)
#(263 1 #reduceActionForUnderlyingType1:)
#(264 1 #reduceActionForMapIdentifiersPath1:)
#(264 3 #reduceActionForMapIdentifiersPath2:)
#(265 2 #reduceActionForMapIdentifiersPathAndSemicolon1:)
#(266 0 #reduceActionForRepeatXXMapIdentifiersPathAndSemicolon1:)
#(266 2 #reduceActionForRepeatXXMapIdentifiersPathAndSemicolon2:)
#(267 3 #reduceActionForWhereRule1:)
#(267 2 #reduceActionForWhereRule2:)
#(268 1 #reduceActionForRepeatXMultipleXXWhereRule1:)
#(268 2 #reduceActionForRepeatXMultipleXXWhereRule2:)
#(269 2 #reduceActionForWhereRuleHead1:)
#(270 1 #reduceActionForDomainType1:)
#(270 1 #reduceActionForDomainType2:)
#(270 1 #reduceActionForDomainType3:)
#(270 1 #reduceActionForDomainType4:)
#(270 1 #reduceActionForDomainType5:)
#(271 4 #reduceActionForSelectType1:)
#(272 5 #reduceActionForEnumerationType1:)
#(273 1 #reduceActionForConstructedType1:)
#(273 1 #reduceActionForConstructedType2:)
#(274 1 #reduceActionForAggregationType1:)
#(274 1 #reduceActionForAggregationType2:)
#(274 1 #reduceActionForAggregationType3:)
#(274 1 #reduceActionForAggregationType4:)
#(274 1 #reduceActionForAggregationType5:)
#(275 2 #reduceActionForSimpleType1:)
#(275 2 #reduceActionForSimpleType2:)
#(275 1 #reduceActionForSimpleType3:)
#(275 2 #reduceActionForSimpleType4:)
#(275 2 #reduceActionForSimpleType5:)
#(275 1 #reduceActionForSimpleType6:)
#(275 1 #reduceActionForSimpleType7:)
#(276 1 #reduceActionForNamedType1:)
#(277 1 #reduceActionForGenericType1:)
#(277 3 #reduceActionForGenericType2:)
#(278 5 #reduceActionForArrayType1:)
#(279 5 #reduceActionForListType1:)
#(280 4 #reduceActionForBagType1:)
#(281 4 #reduceActionForSetType1:)
#(282 3 #reduceActionForAggregateType1:)
#(282 5 #reduceActionForAggregateType2:)
#(283 2 #reduceActionForOptionalOrUnique1:)
#(283 2 #reduceActionForOptionalOrUnique2:)
#(283 1 #reduceActionForOptionalOrUnique3:)
#(283 1 #reduceActionForOptionalOrUnique4:)
#(284 5 #reduceActionForIndexSpec1:)
#(285 0 #reduceActionForOptionalXXIndexSpec1:)
#(285 1 #reduceActionForOptionalXXIndexSpec2:)
#(286 0 #reduceActionForOptionalXXXuniqueX1:)
#(286 1 #reduceActionForOptionalXXXuniqueX2:)
#(287 0 #reduceActionForOptionalXXOptionalOrUnique1:)
#(287 1 #reduceActionForOptionalXXOptionalOrUnique2:)
#(288 2 #reduceActionForFixedOrNotPrecisionSpec1:)
#(289 0 #reduceActionForOptionalXXFixedOrNotPrecisionSpec1:)
#(289 1 #reduceActionForOptionalXXFixedOrNotPrecisionSpec2:)
#(290 3 #reduceActionForPrecisionSpec1:)
#(291 0 #reduceActionForOptionalXXPrecisionSpec1:)
#(291 1 #reduceActionForOptionalXXPrecisionSpec2:)
#(292 1 #reduceActionForFixedOrNot1:)
#(292 0 #reduceActionForFixedOrNot2:)
#(293 1 #reduceActionForSimpleExpression1:)
#(293 3 #reduceActionForSimpleExpression2:)
#(293 3 #reduceActionForSimpleExpression3:)
#(293 3 #reduceActionForSimpleExpression4:)
#(293 3 #reduceActionForSimpleExpression5:)
#(294 1 #reduceActionForTerm1:)
#(294 3 #reduceActionForTerm2:)
#(294 3 #reduceActionForTerm3:)
#(294 3 #reduceActionForTerm4:)
#(294 3 #reduceActionForTerm5:)
#(294 3 #reduceActionForTerm6:)
#(294 3 #reduceActionForTerm7:)
#(295 1 #reduceActionForFactor1:)
#(295 3 #reduceActionForFactor2:)
#(296 1 #reduceActionForSimpleFactor1:)
#(296 1 #reduceActionForSimpleFactor2:)
#(296 2 #reduceActionForSimpleFactor3:)
#(296 1 #reduceActionForSimpleFactor4:)
#(296 1 #reduceActionForSimpleFactor5:)
#(296 3 #reduceActionForSimpleFactor6:)
#(296 3 #reduceActionForSimpleFactor7:)
#(296 1 #reduceActionForSimpleFactor8:)
#(296 1 #reduceActionForSimpleFactor9:)
#(296 2 #reduceActionForSimpleFactor10:)
#(296 3 #reduceActionForSimpleFactor11:)
#(296 1 #reduceActionForSimpleFactor12:)
#(297 2 #reduceActionForSignedSimpleFactor1:)
#(297 2 #reduceActionForSignedSimpleFactor2:)
#(298 3 #reduceActionForAggregateInitializer1:)
#(298 2 #reduceActionForAggregateInitializer2:)
#(299 1 #reduceActionForRepeatXMultipleXXQualifier1:)
#(299 2 #reduceActionForRepeatXMultipleXXQualifier2:)
#(300 1 #reduceActionForLiteral1:)
#(300 1 #reduceActionForLiteral2:)
#(300 1 #reduceActionForLiteral3:)
#(300 1 #reduceActionForLiteral4:)
#(300 1 #reduceActionForLiteral5:)
#(300 1 #reduceActionForLiteral6:)
#(300 1 #reduceActionForLiteral7:)
#(300 1 #reduceActionForLiteral8:)
#(300 1 #reduceActionForLiteral9:)
#(300 1 #reduceActionForLiteral10:)
#(301 7 #reduceActionForInterval1:)
#(302 8 #reduceActionForQueryExpression1:)
#(303 5 #reduceActionForCardinalityOp1:)
#(304 1 #reduceActionForQueryVariable1:)
#(305 1 #reduceActionForIntervalOp1:)
#(305 1 #reduceActionForIntervalOp2:)
#(306 4 #reduceActionForArgumentedIdentifier1:)
#(307 0 #reduceActionForOptionalXXExpressionsList1:)
#(307 1 #reduceActionForOptionalXXExpressionsList2:)
#(308 2 #reduceActionForGroupRef1:)
#(309 1 #reduceActionForAggregateInitBody1:)
#(309 3 #reduceActionForAggregateInitBody2:)
#(310 1 #reduceActionForAggregateInitElement1:)
#(310 3 #reduceActionForAggregateInitElement2:)
#(311 2 #reduceFor:)
#(315 0 #reduceActionForOptionalXXUntilControl1:)
#(315 1 #reduceActionForOptionalXXUntilControl2:)
#(316 1 #reduceActionForBlock1:)
#(316 1 #reduceActionForBlock2:)
#(316 1 #reduceActionForBlock3:)
#(316 1 #reduceActionForBlock4:)
#(316 1 #reduceActionForBlock5:)
#(316 1 #reduceActionForBlock6:)
)
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> remarkReference: aRemarkToken [
	| r | r := OrderedCollection new. r add: #remarkRef; add: aRemarkToken lexicalElement. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> repeatStatement: incrementControlOrNil whileControl: whileExpressionOrNil untilControl: untilExpressionOrNil statements: statementsListOrNil [ 
	| r | r := OrderedCollection new. r add: #repeatStatement; add: incrementControlOrNil; add: whileExpressionOrNil; add: untilExpressionOrNil; add: statementsListOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> returnStatement: expressionOrNil [ 
	| r | r := OrderedCollection new. r add: #returnStatement; add: expressionOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> rule: ident entities: fromEntitiesList actionBody: actionBody whereClause: whereClause [ 
	| r | r := OrderedCollection new. r add: #rule; add: ident; add: fromEntitiesList; add: actionBody; add: whereClause. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> ruleEntry: aRule [ 
	^ self buildParserResultWith: aRule
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> ruleIdentifier: anIdentifier [ 
	^ anIdentifier
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> schema: schemaIdent interfaces: interfacesCollectionOrNil blocks: blocksCollectionOrNil [ 
	| r | r := OrderedCollection new. r add: #schema; add: schemaIdent; add: interfacesCollectionOrNil; add: blocksCollectionOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> schemaContentsEntry: schemaContents [ 
	^ self buildParserResultWith: schemaContents
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> schemaEntry: aSchema [ 
	^ self buildParserResultWith: aSchema
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> schemaIdentifier: anIdentifier [
	^ anIdentifier
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> schemaInstance: aCollectionOfSchemata [ 
	| r | r := OrderedCollection new. r add: #schemaInstance; add: aCollectionOfSchemata. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> schemaInstanceEntry: aSchemaInstance [
	^ self buildParserResultWith: aSchemaInstance
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> selectType: identifiersList [ 
	| r | r := OrderedCollection new. r add: #selectType; add: identifiersList. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> selfIdentifier [
	| r | r := OrderedCollection new. r add: #self. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> setType: indexSpecOrNil baseType: baseType [ 
	| r | r := OrderedCollection new. r add: #setType; add: indexSpecOrNil; add: baseType. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> simpleAttributeName: simpleIdent groupRef: aGroupIdentOrNil [ 
	^ self attributeName: simpleIdent groupRef: aGroupIdentOrNil 
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> skipStatement [
	| r | r := OrderedCollection new. r add: #skipStatement. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> sourceEntry: schemataOrNil [
	^ self buildParserResultWith: schemataOrNil
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> statement: aStatement [ 
	^ aStatement
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> statementsEntry: statements [ 
	^ statements
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> stringLiteral: aString [
	| r | r := OrderedCollection new. r add: #stringLiteral; add: aString. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> stringType: FixedOrNotPrecisionSpecOrNil [
	| r | r := OrderedCollection new. r add: #stringType; add: FixedOrNotPrecisionSpecOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> subtypeDeclaration: anIdentifiersList [
	| r | r := OrderedCollection new. r add: #subtypeDeclaration; add: anIdentifiersList. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> subtypeIdentifier: anIdentifier [ 
	^ anIdentifier
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> supertypeConstraint: supertypeExpressionOrNil [
	| r | r := OrderedCollection new. r add: #supertypeConstraint; add: supertypeExpressionOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> supertypeEntityReference: anIdentifier [ 
	| r | r := OrderedCollection new. r add: #supertypeEntityReference; add: anIdentifier. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> supertypeExpression: supertypeExpression1 and: supertypeExpression2 [
	| r | r := OrderedCollection new. r add: #andSupertypeExpression; add: supertypeExpression1; add: supertypeExpression2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> supertypeExpression: supertypeExpression1 andor: supertypeExpression2 [ 
	| r | r := OrderedCollection new. r add: #andorSupertypeExpression; add: supertypeExpression1; add: supertypeExpression2. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> supertypeOneofExpression: identifiersList [ 
	| r | r := OrderedCollection new. r add: #oneofSupertypeExpression; add: identifiersList. ^ r
]

{ #category : #'generated-tables' }
PlatypusExpressAbstractParser >> transitionTable [
	^#(
#[1 0 58 0 53 0 53 0 142 0 57 0 145 0 61 0 158 0 58 0 220 0 58 1 56]
#[1 0 58 0 53 0 53 0 142 0 57 0 145 0 65 0 158 0 58 0 220 0 58 1 56]
#[1 0 69 0 53 0 73 0 132 0 77 0 154]
#[1 0 242 0 2 0 242 0 5 0 242 0 12 0 242 0 14 0 242 0 84 0 242 0 100 0 242 0 116 0 81 0 133 0 85 0 155 0 89 0 159 0 242 1 56]
#[1 0 93 0 14 0 97 0 134 0 101 0 165]
#[1 0 105 0 84 0 109 0 100 0 113 0 135 0 117 1 5]
#[1 0 121 0 116 0 125 0 136 0 129 0 227]
#[1 0 133 0 5 0 137 0 137 0 141 0 174]
#[1 0 145 0 12 0 149 0 138 0 153 0 179]
#[1 0 157 0 2 0 161 0 139 0 165 0 169]
#[1 0 206 0 16 0 206 0 17 0 206 0 18 0 206 0 25 0 206 0 28 0 206 0 31 0 206 0 49 0 206 0 93 0 206 0 96 0 206 0 98 0 206 0 106 0 206 0 107 0 206 0 115 0 206 0 123 0 206 0 130 0 169 0 140 0 173 0 153 0 206 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 9 0 141 1 13 0 147 1 17 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 0 238 1 56]
#[1 0 66 0 53 1 77 0 144 1 81 0 146 1 85 0 220 0 66 1 56]
#[0 0 0 1 56]
#[0 0 0 1 56]
#[1 1 5 0 130 1 89 0 144 1 93 0 147 1 97 0 149 1 101 0 150 1 85 0 220]
#[0 0 0 1 56]
#[0 0 6 0 53 1 56]
#[0 0 0 1 56]
#[0 0 10 1 56]
#[1 0 157 0 2 0 133 0 5 0 145 0 12 0 93 0 14 0 218 0 51 0 105 0 84 0 109 0 100 0 121 0 116 1 105 0 134 1 109 0 135 1 113 0 136 1 117 0 137 1 121 0 138 1 125 0 139 0 101 0 165 0 165 0 169 0 141 0 174 0 153 0 179 0 129 0 227 0 117 1 5 0 218 1 56 1 129 1 60]
#[1 1 38 0 6 1 38 0 130 1 133 0 167 1 38 0 220]
#[0 0 0 1 56]
#[0 0 14 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[1 1 137 0 101 1 5 0 130 1 141 0 147 1 145 1 8]
#[1 1 5 0 130 1 89 0 144 1 93 0 147 1 149 0 149 1 85 0 220 1 153 1 6]
#[0 0 0 1 56]
#[0 0 18 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[1 1 5 0 130 1 89 0 144 1 93 0 147 1 157 0 149 1 85 0 220 1 161 0 228]
#[0 0 0 1 56]
#[0 0 22 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[1 1 5 0 130 1 89 0 144 1 93 0 147 1 165 0 149 1 169 0 175 1 85 0 220]
#[0 0 0 1 56]
#[0 0 26 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[1 1 5 0 130 1 89 0 144 1 93 0 147 1 173 0 149 1 177 0 180 1 85 0 220]
#[0 0 0 1 56]
#[0 0 30 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[1 1 5 0 130 1 89 0 144 1 93 0 147 1 181 0 149 1 185 0 170 1 85 0 220]
#[0 0 0 1 56]
#[0 0 34 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[0 0 0 1 56]
#[1 1 189 0 16 1 193 0 17 1 197 0 18 1 201 0 25 1 205 0 28 0 181 0 31 1 209 0 49 1 213 0 93 1 217 0 96 1 221 0 98 1 225 0 106 1 229 0 107 0 233 0 115 0 237 0 123 1 5 0 130 1 13 0 147 1 233 0 151 1 237 0 152 1 241 0 184 1 245 0 185 1 249 0 186 1 253 0 187 2 1 0 188 2 5 0 189 2 9 0 190 2 13 0 191 2 17 0 192 2 21 0 193 2 25 0 194 2 29 0 195 2 33 0 196 2 37 0 197 2 41 0 198 2 45 0 199 2 49 0 200 2 53 0 201 2 57 0 203 1 33 0 205 2 61 0 212 1 73 1 50 0 38 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 2 65 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 1 210 0 1 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 2 69 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 2 73 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 2 77 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 2 81 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 2 85 0 67 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 2 89 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50 2 93 1 53 2 97 1 54]
#[0 4 250 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 4 254 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 5 2 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 5 14 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 2 101 0 10]
#[0 5 10 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 2 105 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 1 206 0 1 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 1 246 0 4 0 8 0 10 0 11 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 52 0 55 0 56 0 57 0 58 0 60 0 61 0 67 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 88 0 90 0 93 0 95 0 96 0 98 0 101 0 102 0 103 0 105 0 106 0 107 0 108 0 113 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 4 234 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 4 238 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 5 6 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 4 242 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 4 246 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 0 74 0 1 0 3 0 4 0 10 0 11 0 13 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 59 0 60 0 61 0 67 0 75 0 80 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 0 119 0 120 0 121 0 220 1 56]
#[0 0 0 1 56]
#[1 1 214 0 1 1 214 0 4 2 109 0 10 1 214 0 11 1 214 0 15 1 214 0 22 1 214 0 29 1 214 0 32 1 214 0 33 1 214 0 34 1 214 0 35 1 214 0 36 1 214 0 37 1 214 0 38 1 214 0 39 1 214 0 40 1 214 0 41 1 214 0 42 1 214 0 43 1 214 0 44 1 214 0 45 1 214 0 46 1 214 0 47 1 214 0 48 1 214 0 49 1 214 0 52 1 214 0 55 1 214 0 56 1 214 0 57 1 214 0 60 1 214 0 61 1 214 0 67 1 214 0 75 1 214 0 88 1 214 0 90 1 214 0 95 1 214 0 96 1 214 0 101 1 214 0 102 1 214 0 103 1 214 0 108 1 214 0 113 1 214 1 56]
#[0 0 42 1 56]
#[0 4 178 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 1 242 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 4 206 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[1 1 238 0 4 1 238 0 8 1 238 0 10 1 238 0 11 1 238 0 15 1 238 0 16 1 238 0 17 1 238 0 18 1 238 0 19 1 238 0 20 1 238 0 21 1 238 0 22 1 238 0 24 1 238 0 25 1 238 0 26 1 238 0 28 1 238 0 29 1 238 0 30 1 238 0 31 1 238 0 32 1 238 0 33 1 238 0 34 1 238 0 35 1 238 0 36 1 238 0 37 1 238 0 38 1 238 0 39 1 238 0 40 1 238 0 41 1 238 0 42 1 238 0 43 1 238 0 44 1 238 0 45 1 238 0 46 1 238 0 47 1 238 0 48 1 238 0 49 1 238 0 50 1 238 0 52 1 238 0 55 1 238 0 56 1 238 0 57 1 238 0 58 1 238 0 60 1 238 0 61 1 238 0 67 1 238 0 71 1 238 0 75 1 238 0 77 1 238 0 78 1 238 0 79 1 238 0 81 1 238 0 82 1 238 0 83 1 238 0 88 1 238 0 90 1 238 0 93 1 238 0 95 1 238 0 96 1 238 0 98 1 238 0 101 1 238 0 102 1 238 0 103 1 238 0 105 1 238 0 106 1 238 0 107 1 238 0 108 1 238 0 113 1 238 0 115 2 113 0 123 1 238 0 125 1 238 0 126 1 238 0 127 1 238 0 128 1 238 0 129 1 238 0 130 1 238 1 56]
#[1 0 78 0 4 0 78 0 11 0 78 0 15 0 78 0 22 0 78 0 29 2 117 0 32 2 121 0 33 2 125 0 34 2 129 0 35 2 133 0 36 2 137 0 37 2 141 0 38 2 145 0 39 2 149 0 40 2 153 0 41 2 157 0 42 2 161 0 44 2 165 0 45 2 169 0 46 0 78 0 48 0 78 0 49 0 78 0 67 0 78 0 88 0 78 0 90 0 78 0 95 0 78 0 96 0 78 0 101 0 78 0 102 0 78 0 103 0 78 1 56]
#[1 4 106 0 4 4 106 0 11 4 106 0 15 4 106 0 22 4 106 0 29 4 106 0 32 4 106 0 33 4 106 0 34 4 106 0 35 4 106 0 36 4 106 0 37 4 106 0 38 4 106 0 39 4 106 0 40 4 106 0 41 4 106 0 42 2 173 0 43 4 106 0 44 4 106 0 45 4 106 0 46 4 106 0 48 4 106 0 49 2 177 0 55 2 181 0 56 2 185 0 57 2 189 0 60 2 193 0 61 4 106 0 67 4 106 0 88 4 106 0 90 4 106 0 95 4 106 0 96 4 106 0 101 4 106 0 102 4 106 0 103 4 106 1 56]
#[1 4 126 0 4 4 126 0 11 4 126 0 15 4 126 0 22 4 126 0 29 4 126 0 32 4 126 0 33 4 126 0 34 4 126 0 35 4 126 0 36 4 126 0 37 4 126 0 38 4 126 0 39 4 126 0 40 4 126 0 41 4 126 0 42 4 126 0 43 4 126 0 44 4 126 0 45 4 126 0 46 4 126 0 48 4 126 0 49 2 197 0 52 4 126 0 55 4 126 0 56 4 126 0 57 4 126 0 60 4 126 0 61 4 126 0 67 4 126 0 88 4 126 0 90 4 126 0 95 4 126 0 96 4 126 0 101 4 126 0 102 4 126 0 103 4 126 1 56]
#[1 4 154 0 4 4 154 0 11 4 154 0 15 4 154 0 22 4 154 0 29 4 154 0 32 4 154 0 33 4 154 0 34 4 154 0 35 4 154 0 36 4 154 0 37 4 154 0 38 4 154 0 39 4 154 0 40 4 154 0 41 4 154 0 42 4 154 0 43 4 154 0 44 4 154 0 45 4 154 0 46 2 201 0 47 4 154 0 48 4 154 0 49 4 154 0 52 4 154 0 55 4 154 0 56 4 154 0 57 4 154 0 60 4 154 0 61 4 154 0 67 2 205 0 75 4 154 0 88 4 154 0 90 4 154 0 95 4 154 0 96 4 154 0 101 4 154 0 102 4 154 0 103 2 209 0 108 2 213 0 113 2 217 0 202 2 221 1 43 2 225 1 47 2 229 1 52 4 154 1 56]
#[0 4 162 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 4 166 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 4 174 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 4 190 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 4 194 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 1 218 0 1 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 0 62 0 2 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 51 0 53 0 58 0 70 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 84 0 90 0 92 0 93 0 96 0 97 0 98 0 100 0 104 0 105 0 106 0 107 0 110 0 111 0 112 0 114 0 115 0 116 0 118 0 123 0 125 0 126 0 127 0 128 0 129 0 130 0 220 1 56]
#[1 0 69 0 53 2 233 0 132 0 77 0 154 0 46 1 56]
#[0 0 54 0 2 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 51 0 53 0 58 0 70 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 84 0 90 0 92 0 93 0 96 0 97 0 98 0 100 0 104 0 105 0 106 0 107 0 110 0 111 0 112 0 114 0 115 0 116 0 118 0 123 0 125 0 126 0 127 0 128 0 129 0 130 0 220 1 56]
#[1 1 5 0 130 2 237 0 147]
#[1 0 130 0 1 0 130 0 3 0 130 0 4 0 130 0 10 0 130 0 11 0 130 0 15 0 130 0 40 2 241 0 47 0 130 0 49 0 130 0 119 0 130 0 120 0 130 0 121]
#[0 0 138 0 49]
#[1 1 209 0 49 2 245 0 151]
#[0 5 86 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[0 5 90 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[0 5 94 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[0 5 98 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[0 5 102 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[0 5 106 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[0 0 246 0 2 0 5 0 12 0 14 0 51 0 84 0 100 0 116 1 56]
#[1 2 249 0 6 1 5 0 130 1 89 0 144 1 93 0 147 2 253 0 149 3 1 0 166 1 85 0 220]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 3 5 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 3 126 0 49 0 101 0 108]
#[1 3 9 0 101 3 13 0 108]
#[0 3 118 0 40]
#[0 3 17 0 40]
#[0 2 126 0 49 0 119 0 120 0 121]
#[1 2 142 0 49 3 21 0 119 3 25 0 120 3 29 0 121 3 33 0 229 3 37 0 230 3 41 0 240 3 45 0 241]
#[0 1 78 0 4 0 10]
#[1 1 86 0 4 3 49 0 10 3 53 0 176 3 57 0 177]
#[0 1 102 0 10 0 49]
#[1 3 49 0 10 1 86 0 49 3 53 0 176 3 61 0 177]
#[0 1 54 0 3]
#[0 3 65 0 3]
#[0 2 34 0 16 0 17 0 18 0 19 0 25 0 28 0 31 0 49 0 93 0 96 0 98 0 106 0 107 0 115 0 123 0 130]
#[1 1 209 0 49 3 69 0 151]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 3 73 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 1 5 0 130 3 77 0 147 3 81 0 206]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 3 85 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 58 0 2 0 58 0 5 0 58 0 6 0 58 0 7 0 58 0 8 0 58 0 9 0 58 0 10 0 58 0 12 0 58 0 14 0 58 0 16 0 58 0 17 0 58 0 18 0 58 0 19 0 58 0 20 0 58 0 21 0 58 0 23 0 58 0 24 0 58 0 25 0 58 0 26 0 58 0 27 0 58 0 28 0 58 0 30 0 58 0 31 0 58 0 34 0 58 0 38 0 58 0 47 0 58 0 49 0 58 0 50 0 58 0 51 0 58 0 53 0 58 0 58 0 58 0 70 0 58 0 71 0 58 0 75 0 58 0 77 0 58 0 78 0 58 0 79 0 58 0 81 0 58 0 82 0 58 0 83 0 58 0 84 0 58 0 90 0 58 0 92 0 58 0 93 0 58 0 96 0 58 0 97 0 58 0 98 0 58 0 100 0 58 0 104 0 58 0 105 0 58 0 106 0 58 0 107 0 58 0 110 0 58 0 111 0 58 0 112 0 58 0 114 0 58 0 115 0 58 0 116 0 58 0 118 0 58 0 123 0 58 0 125 0 58 0 126 0 58 0 127 0 58 0 128 0 58 0 129 0 58 0 130 3 89 0 145 0 58 0 220 0 58 1 56]
#[1 3 93 0 57 2 78 0 94 2 78 0 99 3 97 0 221]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 3 101 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 1 209 0 49 3 105 0 151]
#[1 3 109 0 10 1 209 0 49 3 113 0 151]
#[1 2 62 0 49 2 62 0 102 2 62 0 103 1 5 0 130 3 117 0 147 3 121 0 215 3 125 0 218]
#[0 1 190 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 210 0 8 0 16 0 17 0 18 0 19 0 20 0 24 0 25 0 26 0 28 0 31 0 49 0 58 0 71 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 130 1 56]
#[0 0 146 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 150 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 154 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 158 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 162 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 166 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 170 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 174 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 178 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 182 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 186 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 190 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 194 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 198 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 0 202 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[1 1 202 0 1 1 202 0 49 2 205 0 75 2 209 0 108 2 213 0 113 3 129 0 202 2 229 1 52]
#[0 3 133 0 1]
#[1 1 198 0 1 1 209 0 49 1 198 0 75 1 198 0 108 1 198 0 113 3 137 0 151]
#[0 1 182 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[1 0 206 0 16 0 206 0 17 0 206 0 18 0 206 0 19 0 206 0 25 0 206 0 28 0 206 0 31 0 206 0 49 0 206 0 93 0 206 0 96 0 206 0 98 0 206 0 106 0 206 0 107 0 206 0 115 0 206 0 123 0 206 0 130 3 141 0 153]
#[0 3 145 0 11]
#[1 4 214 0 4 4 214 0 11 4 214 0 15 4 214 0 22 4 214 0 29 4 214 0 32 4 214 0 33 4 214 0 34 4 214 0 35 4 214 0 36 4 214 0 37 4 214 0 38 4 214 0 39 4 214 0 40 4 214 0 41 4 214 0 42 4 214 0 43 4 214 0 44 4 214 0 45 4 214 0 46 2 201 0 47 4 214 0 48 4 214 0 49 4 214 0 52 4 214 0 55 4 214 0 56 4 214 0 57 4 214 0 60 4 214 0 61 4 214 0 67 2 205 0 75 4 214 0 88 4 214 0 90 4 214 0 95 4 214 0 96 4 214 0 101 4 214 0 102 4 214 0 103 2 209 0 108 2 213 0 113 2 217 0 202 2 221 1 43 2 225 1 47 2 229 1 52 4 214 1 56]
#[1 4 210 0 4 4 210 0 11 4 210 0 15 4 210 0 22 4 210 0 29 4 210 0 32 4 210 0 33 4 210 0 34 4 210 0 35 4 210 0 36 4 210 0 37 4 210 0 38 4 210 0 39 4 210 0 40 4 210 0 41 4 210 0 42 4 210 0 43 4 210 0 44 4 210 0 45 4 210 0 46 2 201 0 47 4 210 0 48 4 210 0 49 4 210 0 52 4 210 0 55 4 210 0 56 4 210 0 57 4 210 0 60 4 210 0 61 4 210 0 67 2 205 0 75 4 210 0 88 4 210 0 90 4 210 0 95 4 210 0 96 4 210 0 101 4 210 0 102 4 210 0 103 2 209 0 108 2 213 0 113 2 217 0 202 2 221 1 43 2 225 1 47 2 229 1 52 4 210 1 56]
#[1 2 125 0 34 3 149 0 35 2 133 0 36 3 153 0 37 2 141 0 38 2 145 0 39 3 157 1 49]
#[1 4 198 0 4 4 198 0 11 4 198 0 15 4 198 0 22 4 198 0 29 4 198 0 32 4 198 0 33 4 198 0 34 4 198 0 35 4 198 0 36 4 198 0 37 4 198 0 38 4 198 0 39 4 198 0 40 4 198 0 41 4 198 0 42 4 198 0 43 4 198 0 44 4 198 0 45 4 198 0 46 2 201 0 47 4 198 0 48 4 198 0 49 4 198 0 52 4 198 0 55 4 198 0 56 4 198 0 57 4 198 0 60 4 198 0 61 4 198 0 67 2 205 0 75 4 198 0 88 4 198 0 90 4 198 0 95 4 198 0 96 4 198 0 101 4 198 0 102 4 198 0 103 2 209 0 108 2 213 0 113 2 217 0 202 2 221 1 43 2 225 1 47 2 229 1 52 4 198 1 56]
#[0 4 222 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[1 3 161 0 4 5 66 0 15 5 66 0 67]
#[1 3 165 0 15 3 169 0 67]
#[0 5 58 0 15 0 67]
#[1 1 5 0 130 3 173 0 147 3 177 1 48]
#[0 3 181 0 90]
#[1 0 177 0 10 5 46 0 11 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 3 185 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 189 0 207 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50 3 193 1 51]
#[0 1 250 0 4 0 8 0 10 0 11 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 52 0 55 0 56 0 57 0 58 0 60 0 61 0 67 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 88 0 90 0 93 0 95 0 96 0 98 0 101 0 102 0 103 0 105 0 106 0 107 0 108 0 113 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 197 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 201 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 205 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 209 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 213 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 217 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 221 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 225 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 229 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 233 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 237 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 241 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 245 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 249 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 3 253 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 4 1 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 4 5 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 4 9 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 4 13 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 4 17 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 4 21 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 4 25 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 4 29 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 1 5 0 130 4 33 0 147]
#[1 1 5 0 130 4 37 0 147]
#[0 4 226 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[1 4 170 0 4 4 170 0 11 4 170 0 15 4 170 0 22 4 170 0 29 4 170 0 32 4 170 0 33 4 170 0 34 4 170 0 35 4 170 0 36 4 170 0 37 4 170 0 38 4 170 0 39 4 170 0 40 4 170 0 41 4 170 0 42 4 170 0 43 4 170 0 44 4 170 0 45 4 170 0 46 4 170 0 47 4 170 0 48 4 170 0 49 4 170 0 52 4 170 0 55 4 170 0 56 4 170 0 57 4 170 0 60 4 170 0 61 4 170 0 67 2 205 0 75 4 170 0 88 4 170 0 90 4 170 0 95 4 170 0 96 4 170 0 101 4 170 0 102 4 170 0 103 2 209 0 108 2 213 0 113 4 41 0 202 2 229 1 52 4 170 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 4 45 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 1 226 0 1 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 0 70 0 53 1 56]
#[1 0 122 0 1 0 122 0 3 0 122 0 4 0 122 0 10 0 122 0 11 0 122 0 15 0 122 0 40 4 49 0 47 0 122 0 49 0 122 0 119 0 122 0 120 0 122 0 121]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 4 53 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 230 0 2 0 230 0 5 0 230 0 9 0 230 0 12 0 230 0 14 0 230 0 23 0 230 0 27 0 230 0 51 0 230 0 84 0 230 0 100 0 230 0 116 4 57 0 157]
#[1 1 209 0 49 4 61 0 151]
#[0 4 65 0 4]
#[0 1 42 0 6 0 130 0 220]
#[1 1 209 0 49 4 69 0 151]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 4 73 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 1 5 0 130 4 77 0 147]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 1 85 0 220 4 145 1 7 4 149 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[0 4 201 0 29]
#[1 4 205 0 29 4 209 0 244]
#[0 4 213 0 120]
#[0 2 146 0 49]
#[1 1 209 0 49 4 217 0 151]
#[1 2 130 0 49 3 21 0 119 4 221 0 241]
#[0 2 134 0 49]
#[1 4 225 0 111 2 118 0 130 4 229 0 224 4 233 0 225 4 237 0 226]
#[0 1 90 0 4 0 49]
#[0 4 241 0 4]
#[1 1 209 0 49 4 245 0 151]
#[0 4 249 0 10]
#[0 1 142 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 4 253 0 22]
#[0 5 1 0 3]
#[1 1 209 0 49 5 5 0 151]
#[0 5 9 0 29]
#[1 0 142 0 2 0 142 0 5 0 142 0 6 0 142 0 7 0 142 0 8 0 142 0 9 0 142 0 10 0 142 0 12 0 142 0 14 0 142 0 16 0 142 0 17 0 142 0 18 0 142 0 19 0 142 0 20 0 142 0 21 0 142 0 23 0 142 0 24 0 142 0 25 0 142 0 26 0 142 0 27 0 142 0 28 0 142 0 30 0 142 0 31 0 142 0 34 0 142 0 38 0 142 0 47 0 142 0 49 0 142 0 50 0 142 0 51 0 142 0 53 0 142 0 58 0 142 0 70 0 142 0 71 0 142 0 75 0 142 0 77 0 142 0 78 0 142 0 79 0 142 0 81 0 142 0 82 0 142 0 83 0 142 0 84 0 142 0 90 0 142 0 92 0 142 0 93 0 142 0 96 0 142 0 97 0 142 0 98 0 142 0 100 0 142 0 104 0 142 0 105 0 142 0 106 0 142 0 107 0 142 0 110 0 142 0 111 0 142 0 112 0 142 0 114 0 142 0 115 0 142 0 116 0 142 0 118 0 142 0 123 0 142 0 125 0 142 0 126 0 142 0 127 0 142 0 128 0 142 0 129 0 142 0 130 1 77 0 144 1 85 0 220 0 142 1 56]
#[0 2 82 0 94 0 99]
#[1 5 13 0 94 5 17 0 99]
#[0 5 21 0 96]
#[0 1 166 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 5 25 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 1 158 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 5 29 0 1]
#[0 2 66 0 49 0 102 0 103]
#[1 2 70 0 49 5 33 0 102 2 70 0 103 5 37 0 216 5 41 0 219]
#[0 1 194 0 1 0 49 0 75 0 108 0 113]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 5 45 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 1 186 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[1 1 189 0 16 1 193 0 17 1 197 0 18 5 49 0 19 1 201 0 25 1 205 0 28 0 181 0 31 1 209 0 49 1 213 0 93 1 217 0 96 1 221 0 98 1 225 0 106 1 229 0 107 0 233 0 115 0 237 0 123 1 5 0 130 1 13 0 147 1 233 0 151 1 237 0 152 1 241 0 184 1 245 0 185 1 249 0 186 1 253 0 187 2 1 0 188 2 5 0 189 2 9 0 190 2 13 0 191 2 17 0 192 2 21 0 193 2 25 0 194 2 29 0 195 2 33 0 196 2 37 0 197 2 41 0 198 2 45 0 199 2 49 0 200 2 53 0 201 2 57 0 203 1 33 0 205 2 61 0 212 1 73 1 50]
#[0 4 182 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 5 34 0 10 0 31 0 34 0 38 0 47 0 50 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130]
#[0 5 38 0 10 0 31 0 34 0 38 0 47 0 50 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 5 53 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 5 57 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 2 89 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50 5 61 1 54]
#[0 4 218 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 5 30 0 80]
#[0 5 65 0 80]
#[0 4 186 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 2 2 0 4 0 11 0 15]
#[1 5 50 0 11 5 69 0 15]
#[0 5 73 0 11]
#[1 0 118 0 4 0 118 0 11 0 118 0 15 0 118 0 22 0 118 0 29 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 0 118 0 48 0 118 0 49 0 118 0 67 0 118 0 88 0 118 0 90 0 118 0 95 0 118 0 96 0 118 0 101 0 118 0 102 0 118 0 103 0 118 1 56]
#[1 0 102 0 4 0 102 0 11 0 102 0 15 0 102 0 22 0 102 0 29 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 0 102 0 48 0 102 0 49 0 102 0 67 0 102 0 88 0 102 0 90 0 102 0 95 0 102 0 96 0 102 0 101 0 102 0 102 0 102 0 103 0 102 1 56]
#[0 4 122 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 49 0 67 0 88 0 90 0 95 0 96 0 101 0 102 0 103 1 56]
#[1 0 82 0 4 0 82 0 11 0 82 0 15 0 82 0 22 0 82 0 29 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 0 82 0 48 0 82 0 49 0 82 0 67 0 82 0 88 0 82 0 90 0 82 0 95 0 82 0 96 0 82 0 101 0 82 0 102 0 82 0 103 0 82 1 56]
#[0 4 110 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 49 0 67 0 88 0 90 0 95 0 96 0 101 0 102 0 103 1 56]
#[1 0 94 0 4 0 94 0 11 0 94 0 15 0 94 0 22 0 94 0 29 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 0 94 0 48 0 94 0 49 0 94 0 67 0 94 0 88 0 94 0 90 0 94 0 95 0 94 0 96 0 94 0 101 0 94 0 102 0 94 0 103 0 94 1 56]
#[0 4 118 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 49 0 67 0 88 0 90 0 95 0 96 0 101 0 102 0 103 1 56]
#[0 4 114 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 49 0 67 0 88 0 90 0 95 0 96 0 101 0 102 0 103 1 56]
#[1 0 90 0 4 0 90 0 11 0 90 0 15 0 90 0 22 0 90 0 29 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 0 90 0 48 0 90 0 49 0 90 0 67 0 90 0 88 0 90 0 90 0 90 0 95 0 90 0 96 0 90 0 101 0 90 0 102 0 90 0 103 0 90 1 56]
#[1 0 98 0 4 0 98 0 11 0 98 0 15 0 98 0 22 0 98 0 29 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 0 98 0 48 0 98 0 49 0 98 0 67 0 98 0 88 0 98 0 90 0 98 0 95 0 98 0 96 0 98 0 101 0 98 0 102 0 98 0 103 0 98 1 56]
#[1 0 86 0 4 0 86 0 11 0 86 0 15 0 86 0 22 0 86 0 29 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 0 86 0 48 0 86 0 49 0 86 0 67 0 86 0 88 0 86 0 90 0 86 0 95 0 86 0 96 0 86 0 101 0 86 0 102 0 86 0 103 0 86 1 56]
#[1 0 106 0 4 0 106 0 11 0 106 0 15 0 106 0 22 0 106 0 29 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 0 106 0 48 0 106 0 49 0 106 0 67 0 106 0 88 0 106 0 90 0 106 0 95 0 106 0 96 0 106 0 101 0 106 0 102 0 106 0 103 0 106 1 56]
#[1 0 110 0 4 0 110 0 11 0 110 0 15 0 110 0 22 0 110 0 29 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 0 110 0 48 0 110 0 49 0 110 0 67 0 110 0 88 0 110 0 90 0 110 0 95 0 110 0 96 0 110 0 101 0 110 0 102 0 110 0 103 0 110 1 56]
#[1 0 114 0 4 0 114 0 11 0 114 0 15 0 114 0 22 0 114 0 29 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 0 114 0 48 0 114 0 49 0 114 0 67 0 114 0 88 0 114 0 90 0 114 0 95 0 114 0 96 0 114 0 101 0 114 0 102 0 114 0 103 0 114 1 56]
#[0 4 138 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 55 0 56 0 57 0 60 0 61 0 67 0 88 0 90 0 95 0 96 0 101 0 102 0 103 1 56]
#[0 4 134 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 55 0 56 0 57 0 60 0 61 0 67 0 88 0 90 0 95 0 96 0 101 0 102 0 103 1 56]
#[0 4 142 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 55 0 56 0 57 0 60 0 61 0 67 0 88 0 90 0 95 0 96 0 101 0 102 0 103 1 56]
#[0 4 146 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 55 0 56 0 57 0 60 0 61 0 67 0 88 0 90 0 95 0 96 0 101 0 102 0 103 1 56]
#[0 4 150 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 55 0 56 0 57 0 60 0 61 0 67 0 88 0 90 0 95 0 96 0 101 0 102 0 103 1 56]
#[0 4 130 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 55 0 56 0 57 0 60 0 61 0 67 0 88 0 90 0 95 0 96 0 101 0 102 0 103 1 56]
#[1 4 158 0 4 4 158 0 11 4 158 0 15 4 158 0 22 4 158 0 29 4 158 0 32 4 158 0 33 4 158 0 34 4 158 0 35 4 158 0 36 4 158 0 37 4 158 0 38 4 158 0 39 4 158 0 40 4 158 0 41 4 158 0 42 4 158 0 43 4 158 0 44 4 158 0 45 4 158 0 46 4 158 0 48 4 158 0 49 2 197 0 52 4 158 0 55 4 158 0 56 4 158 0 57 4 158 0 60 4 158 0 61 4 158 0 67 4 158 0 88 4 158 0 90 4 158 0 95 4 158 0 96 4 158 0 101 4 158 0 102 4 158 0 103 4 158 1 56]
#[0 5 77 0 4]
#[1 5 81 0 4 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 5 85 0 67]
#[0 1 222 0 1 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 5 54 0 1 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 4 230 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[1 4 202 0 4 4 202 0 11 4 202 0 15 4 202 0 22 4 202 0 29 4 202 0 32 4 202 0 33 4 202 0 34 4 202 0 35 4 202 0 36 4 202 0 37 4 202 0 38 4 202 0 39 4 202 0 40 4 202 0 41 4 202 0 42 4 202 0 43 4 202 0 44 4 202 0 45 4 202 0 46 2 201 0 47 4 202 0 48 4 202 0 49 4 202 0 52 4 202 0 55 4 202 0 56 4 202 0 57 4 202 0 60 4 202 0 61 4 202 0 67 2 205 0 75 4 202 0 88 4 202 0 90 4 202 0 95 4 202 0 96 4 202 0 101 4 202 0 102 4 202 0 103 2 209 0 108 2 213 0 113 2 217 0 202 2 221 1 43 2 225 1 47 2 229 1 52 4 202 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 5 89 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 5 93 0 48]
#[1 0 242 0 2 0 242 0 5 5 97 0 9 0 242 0 12 0 242 0 14 5 101 0 23 5 105 0 27 0 242 0 51 0 242 0 84 0 242 0 100 0 242 0 116 5 109 0 155 5 113 0 156 0 89 0 159 5 117 0 160]
#[0 1 30 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 5 121 0 168 1 85 0 220 5 125 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[1 3 138 0 70 5 129 0 71 3 138 0 130 5 133 0 173 5 137 1 10]
#[1 1 209 0 49 5 141 0 151]
#[0 3 130 0 49 0 101 0 108]
#[1 4 50 0 29 5 145 0 75 5 149 1 28 5 153 1 29]
#[1 4 50 0 29 5 145 0 75 5 149 1 28 5 157 1 29]
#[1 4 50 0 29 5 145 0 75 5 149 1 28 5 161 1 29]
#[1 4 50 0 29 5 145 0 75 5 149 1 28 5 165 1 29]
#[1 4 78 0 1 4 78 0 3 5 169 0 10 4 78 0 11 4 78 0 49 5 173 1 32 5 177 1 33 5 181 1 34]
#[1 5 185 0 4 5 189 0 29]
#[1 4 78 0 1 4 78 0 3 5 169 0 10 4 78 0 11 4 78 0 49 5 173 1 32 5 193 1 33 5 181 1 34]
#[0 5 197 0 29]
#[0 3 230 0 1 0 3 0 11 0 49]
#[1 3 254 0 1 3 254 0 3 5 201 0 4 3 254 0 11 3 254 0 49]
#[0 5 205 0 10]
#[1 4 90 0 1 4 90 0 3 5 169 0 10 4 90 0 11 4 90 0 49 5 209 1 34 5 213 1 35]
#[1 4 90 0 1 4 90 0 3 5 169 0 10 4 90 0 11 4 90 0 49 5 209 1 34 5 217 1 35]
#[0 3 242 0 1 0 3 0 11 0 49]
#[0 3 246 0 1 0 3 0 11 0 49]
#[0 3 250 0 1 0 3 0 11 0 49]
#[1 1 209 0 49 5 221 0 151]
#[0 3 122 0 49]
#[0 3 194 0 1 0 3 0 11 0 49]
#[0 3 198 0 1 0 3 0 11 0 49]
#[0 3 170 0 1 0 3 0 11 0 49]
#[0 3 166 0 1 0 3 0 11 0 49]
#[0 3 174 0 1 0 3 0 11 0 49]
#[0 3 178 0 1 0 3 0 11 0 49]
#[0 3 182 0 1 0 3 0 11 0 49]
#[0 3 202 0 1 0 3 0 11 0 49]
#[0 3 206 0 1 0 3 0 11 0 49]
#[0 3 210 0 1 0 3 0 11 0 49]
#[0 3 214 0 1 0 3 0 11 0 49]
#[0 3 218 0 1 0 3 0 11 0 49]
#[0 5 225 0 10]
#[0 5 229 0 10]
#[0 2 210 0 49 0 119]
#[1 4 205 0 29 2 234 0 49 2 234 0 119 5 233 0 244 5 237 0 245]
#[1 2 154 0 71 2 154 0 110 2 154 0 112 2 154 0 114 2 154 0 115 2 154 0 118 2 154 0 130 2 154 0 220 5 241 0 232]
#[0 2 138 0 49]
#[0 2 114 0 130]
#[1 5 245 0 11 1 209 0 49 5 249 0 151]
#[0 2 102 0 11 0 49]
#[1 1 5 0 130 5 253 0 147 6 1 0 171]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 6 5 0 178 1 85 0 220 6 9 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[1 1 114 0 2 1 114 0 5 1 114 0 12 1 114 0 14 1 114 0 16 1 114 0 17 1 114 0 18 1 114 0 24 1 114 0 25 1 114 0 28 1 114 0 31 1 114 0 49 1 114 0 84 1 114 0 93 1 114 0 96 1 114 0 97 1 114 0 98 1 114 0 100 1 114 0 106 1 114 0 107 1 114 0 115 1 114 0 116 1 114 0 123 1 114 0 130 6 13 0 172 6 17 0 182]
#[1 1 5 0 130 5 253 0 147 6 21 0 171]
#[1 0 206 0 16 0 206 0 17 0 206 0 18 0 206 0 20 0 206 0 25 0 206 0 28 0 206 0 31 0 206 0 49 0 206 0 58 0 206 0 93 0 206 0 96 0 206 0 98 0 206 0 106 0 206 0 107 0 206 0 115 0 206 0 123 0 206 0 130 6 25 0 153]
#[1 0 181 0 31 0 233 0 115 1 5 0 130 1 13 0 147 2 45 0 199 6 29 0 200 6 33 0 201 1 73 1 50]
#[1 0 206 0 16 0 206 0 17 0 206 0 18 0 206 0 25 0 206 0 26 0 206 0 28 0 206 0 31 0 206 0 49 0 206 0 93 0 206 0 96 0 206 0 98 0 206 0 106 0 206 0 107 0 206 0 115 0 206 0 123 0 206 0 130 6 37 0 153]
#[1 2 18 0 10 2 18 0 21 2 18 0 30 2 18 0 31 2 18 0 34 2 18 0 38 2 18 0 47 2 18 0 50 2 18 0 75 2 18 0 77 2 18 0 78 2 18 0 79 2 18 0 81 2 18 0 82 2 18 0 83 2 18 0 90 2 18 0 115 2 18 0 123 2 18 0 125 2 18 0 126 2 18 0 127 2 18 0 128 2 18 0 129 2 18 0 130 6 41 0 210]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 6 45 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 6 49 0 95]
#[1 1 209 0 49 6 53 0 151]
#[0 6 57 0 11]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 6 61 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 6 65 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 2 74 0 49 0 103]
#[1 5 78 0 49 6 69 0 103 6 73 0 217 6 77 1 59]
#[1 1 209 0 49 6 81 0 151]
#[1 1 209 0 49 6 85 0 151]
#[1 2 125 0 34 3 149 0 35 2 133 0 36 3 153 0 37 2 141 0 38 2 145 0 39 6 89 1 49]
#[0 5 70 0 15 0 67]
#[0 5 62 0 15 0 67]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 6 93 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 6 97 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 5 42 0 1 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 6 101 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 6 105 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 1 230 0 1 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 6 109 0 48]
#[0 0 134 0 1 0 3 0 4 0 10 0 11 0 15 0 40 0 49 0 119 0 120 0 121]
#[0 0 254 0 54]
#[0 6 113 0 54]
#[0 0 250 0 54]
#[0 6 117 0 51]
#[0 0 234 0 2 0 5 0 9 0 12 0 14 0 23 0 27 0 51 0 84 0 100 0 116]
#[0 6 121 0 54]
#[0 6 125 0 1]
#[0 1 46 0 1 0 3 0 11 0 49]
#[1 0 58 0 10 0 58 0 31 0 58 0 34 0 58 0 38 0 58 0 47 0 58 0 50 0 58 0 75 0 58 0 77 0 58 0 78 0 58 0 79 0 58 0 81 0 58 0 82 0 58 0 83 0 58 0 90 0 58 0 115 0 58 0 123 0 58 0 125 0 58 0 126 0 58 0 127 0 58 0 128 0 58 0 129 0 58 0 130 6 129 0 145 0 58 0 220]
#[0 6 133 0 70]
#[1 6 137 0 70 1 5 0 130 1 141 0 147 6 141 1 8 6 145 1 9]
#[0 6 149 0 70]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 6 153 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 4 54 0 29]
#[0 6 157 0 29]
#[0 6 161 0 29]
#[0 6 165 0 29]
#[0 6 169 0 29]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 6 173 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 4 82 0 1 0 3 0 11 0 49]
#[0 3 222 0 1 0 3 0 11 0 49]
#[1 4 102 0 1 4 102 0 3 4 102 0 11 4 102 0 49 6 177 0 89 6 181 1 36]
#[1 1 5 0 130 6 185 0 147]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 6 189 0 178 1 85 0 220 6 9 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[0 3 226 0 1 0 3 0 11 0 49]
#[0 6 193 0 10]
#[1 1 5 0 130 6 197 0 147]
#[1 1 5 0 130 5 253 0 147 6 201 0 171]
#[0 4 94 0 1 0 3 0 11 0 49]
#[0 3 234 0 1 0 3 0 11 0 49]
#[0 3 238 0 1 0 3 0 11 0 49]
#[1 5 129 0 71 2 198 0 92 6 205 0 173 6 209 0 239]
#[1 1 5 0 130 6 213 0 147 6 217 0 242 6 221 0 243]
#[1 6 225 0 10 6 229 0 117 1 5 0 130 6 233 0 147 6 237 0 246]
#[0 2 238 0 49 0 119]
#[0 2 206 0 49 0 119]
#[1 2 166 0 71 6 241 0 110 2 166 0 112 2 166 0 114 6 245 0 115 2 166 0 118 1 5 0 130 1 89 0 144 1 93 0 147 6 249 0 149 1 85 0 220 6 253 0 231 7 1 0 233 7 5 0 234 7 9 0 248 7 13 0 250]
#[0 1 82 0 4 0 49]
#[1 4 225 0 111 2 118 0 130 7 17 0 225 4 237 0 226]
#[1 0 58 0 4 0 58 0 11 0 58 0 15 7 21 0 145 0 58 0 220]
#[1 7 25 0 4 7 29 0 15 7 33 1 55]
#[1 1 209 0 49 7 37 0 151]
#[0 1 94 0 1 0 3 0 11 0 49]
#[0 7 41 0 24]
#[1 0 157 0 2 0 133 0 5 0 206 0 8 0 145 0 12 0 93 0 14 0 206 0 16 0 206 0 17 0 206 0 18 0 206 0 24 0 206 0 25 0 206 0 28 0 206 0 31 0 206 0 49 0 206 0 71 0 105 0 84 0 206 0 93 0 206 0 96 7 45 0 97 0 206 0 98 0 109 0 100 0 206 0 106 0 206 0 107 0 206 0 115 0 121 0 116 0 206 0 123 0 206 0 130 1 105 0 134 1 109 0 135 1 113 0 136 1 117 0 137 1 121 0 138 1 125 0 139 7 49 0 153 0 101 0 165 0 165 0 169 0 141 0 174 0 153 0 179 7 53 0 181 7 57 0 183 0 129 0 227 0 117 1 5 7 61 1 60]
#[1 7 65 0 11 7 29 0 15 7 33 1 55]
#[1 1 189 0 16 1 193 0 17 1 197 0 18 7 69 0 20 1 201 0 25 1 205 0 28 0 181 0 31 1 209 0 49 7 73 0 58 1 213 0 93 1 217 0 96 1 221 0 98 1 225 0 106 1 229 0 107 0 233 0 115 0 237 0 123 1 5 0 130 1 13 0 147 1 233 0 151 1 237 0 152 1 241 0 184 1 245 0 185 1 249 0 186 1 253 0 187 2 1 0 188 2 5 0 189 2 9 0 190 2 13 0 191 2 17 0 192 2 21 0 193 2 25 0 194 2 29 0 195 2 33 0 196 2 37 0 197 2 41 0 198 2 45 0 199 2 49 0 200 2 53 0 201 2 57 0 203 1 33 0 205 2 61 0 212 1 73 1 50]
#[0 1 254 0 49]
#[0 1 198 0 49 0 75 0 108 0 113]
#[1 1 189 0 16 1 193 0 17 1 197 0 18 1 201 0 25 7 77 0 26 1 205 0 28 0 181 0 31 1 209 0 49 1 213 0 93 1 217 0 96 1 221 0 98 1 225 0 106 1 229 0 107 0 233 0 115 0 237 0 123 1 5 0 130 1 13 0 147 1 233 0 151 1 237 0 152 1 241 0 184 1 245 0 185 1 249 0 186 1 253 0 187 2 1 0 188 2 5 0 189 2 9 0 190 2 13 0 191 2 17 0 192 2 21 0 193 2 25 0 194 2 29 0 195 2 33 0 196 2 37 0 197 2 41 0 198 2 45 0 199 2 49 0 200 2 53 0 201 2 57 0 203 1 33 0 205 2 61 0 212 1 73 1 50]
#[1 0 177 0 10 2 26 0 21 7 81 0 30 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 3 185 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 7 85 0 207 7 89 0 208 7 93 0 209 7 97 0 211 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 7 101 0 95]
#[0 1 178 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 1 170 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[1 1 209 0 49 7 105 0 151]
#[0 7 109 0 101]
#[0 2 54 0 49 0 103]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 7 113 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 5 82 0 49]
#[1 1 209 0 49 7 117 0 151]
#[0 1 130 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 1 138 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 7 121 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 7 125 0 96]
#[0 2 6 0 4 0 11 0 15]
#[0 7 129 0 48]
#[1 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 7 133 0 67]
#[0 0 126 0 1 0 3 0 4 0 10 0 11 0 15 0 40 0 49 0 119 0 120 0 121]
#[1 1 5 0 130 7 137 0 147]
#[1 1 209 0 49 7 141 0 151]
#[1 1 5 0 130 7 145 0 147]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 7 149 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 77 0 144 7 153 0 147 7 157 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 85 0 220 7 161 1 11 7 165 1 12 7 169 1 13 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 1 209 0 49 7 173 0 151]
#[1 1 209 0 49 7 177 0 151]
#[1 1 209 0 49 3 13 0 108 7 181 0 151]
#[0 3 142 0 70 0 130]
#[1 1 209 0 49 7 185 0 151]
#[0 7 189 0 4]
#[1 4 66 0 62 4 66 0 63 4 66 0 64 4 66 0 65 4 66 0 66 4 66 0 68 4 66 0 69 4 66 0 72 4 66 0 73 4 66 0 74 4 66 0 76 4 66 0 85 4 66 0 86 4 66 0 87 4 66 0 91 7 193 0 109 7 197 0 112 4 66 0 130 4 66 0 220 7 201 1 27 7 205 1 31]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 7 209 0 168 1 85 0 220 5 125 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 7 213 0 168 1 85 0 220 5 125 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[1 4 58 0 62 4 58 0 63 4 58 0 64 4 58 0 65 4 58 0 66 4 58 0 68 4 58 0 69 4 58 0 72 4 58 0 73 4 58 0 74 4 58 0 76 4 58 0 85 4 58 0 86 4 58 0 87 4 58 0 91 7 217 0 112 4 58 0 130 4 58 0 220 7 221 1 30]
#[0 7 225 0 11]
#[0 4 98 0 1 0 3 0 11 0 49]
#[0 4 74 0 1 0 3 0 11 0 49]
#[0 7 229 0 29]
#[0 4 22 0 1 0 3 0 11 0 49]
#[1 1 5 0 130 5 253 0 147 7 233 0 171]
#[0 4 2 0 1 0 3 0 11 0 49]
#[1 7 237 0 11 7 29 0 15 7 33 1 55]
#[0 2 202 0 92 0 118]
#[0 7 241 0 92]
#[0 2 226 0 11 0 15]
#[1 7 245 0 11 7 249 0 15]
#[0 2 218 0 11 0 15]
#[1 6 225 0 10 6 229 0 117 1 5 0 130 6 233 0 147 7 253 0 246]
#[0 8 1 0 10]
#[0 2 242 0 11 0 15 0 59 0 61]
#[1 8 5 0 11 8 9 0 59 8 13 0 61]
#[1 0 58 0 115 0 58 0 130 8 17 0 145 0 58 0 220]
#[0 8 21 0 113]
#[0 3 14 0 4 0 15]
#[0 2 158 0 71 0 110 0 112 0 114 0 115 0 118 0 130 0 220]
#[0 2 170 0 71 0 112 0 114 0 118]
#[1 2 178 0 71 2 178 0 112 8 25 0 114 2 178 0 118 8 29 0 235 8 33 0 236]
#[0 3 30 0 4 0 15]
#[1 8 37 0 4 8 41 0 15]
#[0 2 106 0 11 0 49]
#[1 1 58 0 4 1 58 0 11 1 58 0 15 1 77 0 144 1 85 0 220]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 8 45 0 178 1 85 0 220 6 9 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[1 0 58 0 130 8 49 0 145 0 58 0 220]
#[1 1 5 0 130 8 53 0 147]
#[1 1 114 0 2 1 114 0 5 1 114 0 8 1 114 0 12 1 114 0 14 1 114 0 16 1 114 0 17 1 114 0 18 1 114 0 25 1 114 0 28 1 114 0 31 1 114 0 49 1 114 0 84 1 114 0 93 1 114 0 96 1 114 0 97 1 114 0 98 1 114 0 100 1 114 0 106 1 114 0 107 1 114 0 115 1 114 0 116 1 114 0 123 1 114 0 130 8 57 0 172 6 17 0 182]
#[1 1 209 0 49 8 61 0 151]
#[1 2 94 0 104 2 94 0 130 8 65 0 223]
#[1 1 66 0 8 1 189 0 16 1 193 0 17 1 197 0 18 1 66 0 24 1 201 0 25 1 205 0 28 0 181 0 31 1 209 0 49 1 66 0 71 1 213 0 93 1 217 0 96 1 221 0 98 1 225 0 106 1 229 0 107 0 233 0 115 0 237 0 123 1 5 0 130 1 13 0 147 1 233 0 151 1 237 0 152 1 241 0 184 1 245 0 185 1 249 0 186 1 253 0 187 2 1 0 188 2 5 0 189 2 9 0 190 2 13 0 191 2 17 0 192 2 21 0 193 2 25 0 194 2 29 0 195 2 33 0 196 2 37 0 197 2 41 0 198 2 45 0 199 2 49 0 200 2 53 0 201 2 57 0 203 1 33 0 205 2 61 0 212 1 73 1 50]
#[0 1 118 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130]
#[0 1 110 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130]
#[0 1 106 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130]
#[1 1 209 0 49 8 69 0 151]
#[1 1 209 0 49 8 73 0 151]
#[1 0 206 0 16 0 206 0 17 0 206 0 18 0 206 0 20 0 206 0 25 0 206 0 28 0 206 0 31 0 206 0 49 0 206 0 93 0 206 0 96 0 206 0 98 0 206 0 106 0 206 0 107 0 206 0 115 0 206 0 123 0 206 0 130 8 77 0 153]
#[1 1 209 0 49 8 81 0 151]
#[0 8 85 0 4]
#[1 8 89 0 4 5 69 0 15]
#[0 2 22 0 10 0 21 0 30 0 31 0 34 0 38 0 47 0 50 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130]
#[0 2 30 0 21]
#[0 8 93 0 21]
#[0 1 174 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 1 162 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 8 97 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 2 58 0 49]
#[1 0 206 0 16 0 206 0 17 0 206 0 18 0 206 0 25 0 206 0 28 0 206 0 31 0 206 0 49 0 206 0 93 0 206 0 96 0 206 0 98 0 206 0 105 0 206 0 106 0 206 0 107 0 206 0 115 0 206 0 123 0 206 0 130 8 101 0 153]
#[1 2 125 0 34 2 133 0 36 2 141 0 38 2 145 0 39 8 105 0 48]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 8 109 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 5 26 0 10 0 31 0 34 0 38 0 47 0 50 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130]
#[0 1 234 0 1 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[1 1 209 0 49 8 113 0 151]
#[0 0 214 0 53 1 56]
#[1 8 117 0 10 1 6 0 49 8 121 0 161 8 125 0 162]
#[1 1 209 0 49 8 129 0 151]
#[1 8 133 0 4 2 109 0 10 1 214 0 32 1 214 0 33 1 214 0 34 1 214 0 35 1 214 0 36 1 214 0 37 1 214 0 38 1 214 0 39 1 214 0 40 1 214 0 41 1 214 0 42 1 214 0 43 1 214 0 44 1 214 0 45 1 214 0 46 1 214 0 47 1 214 0 49 1 214 0 52 1 214 0 55 1 214 0 56 1 214 0 57 1 214 0 60 1 214 0 61 1 214 0 75 1 214 0 108 1 214 0 113]
#[1 1 209 0 49 8 137 0 151]
#[0 3 154 0 7 0 10 0 31 0 34 0 38 0 47 0 50 0 70 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 92 0 115 0 118 0 123 0 125 0 126 0 127 0 128 0 129 0 130]
#[1 1 70 0 7 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 1 70 0 70 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 1 70 0 92 0 233 0 115 1 70 0 118 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 7 153 0 147 7 157 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 8 141 1 11 7 169 1 13 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 8 145 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 3 114 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[0 3 110 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[0 3 134 0 70 0 130]
#[0 3 106 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 8 149 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[1 4 38 0 62 4 38 0 63 4 38 0 64 4 38 0 65 4 38 0 66 4 38 0 68 4 38 0 69 4 38 0 72 4 38 0 73 4 38 0 74 4 38 0 76 4 38 0 85 4 38 0 86 4 38 0 87 4 38 0 91 8 153 0 112 4 38 0 130 4 38 0 220]
#[1 4 42 0 62 4 42 0 63 4 42 0 64 4 42 0 65 4 42 0 66 4 42 0 68 4 42 0 69 4 42 0 72 4 42 0 73 4 42 0 74 4 42 0 76 4 42 0 85 4 42 0 86 4 42 0 87 4 42 0 91 8 157 0 109 4 42 0 130 4 42 0 220]
#[0 4 70 0 62 0 63 0 64 0 65 0 66 0 68 0 69 0 72 0 73 0 74 0 76 0 85 0 86 0 87 0 91 0 130 0 220]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 8 161 0 168 1 85 0 220 5 125 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[0 4 14 0 1 0 3 0 11 0 49]
#[0 4 18 0 1 0 3 0 11 0 49]
#[0 4 62 0 62 0 63 0 64 0 65 0 66 0 68 0 69 0 72 0 73 0 74 0 76 0 85 0 86 0 87 0 91 0 130 0 220]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 8 165 0 168 1 85 0 220 5 125 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[0 4 86 0 1 0 3 0 11 0 49 0 89]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 8 169 0 178 1 85 0 220 6 9 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[1 8 173 0 11 7 29 0 15 7 33 1 55]
#[0 3 186 0 1 0 3 0 11 0 49]
#[1 1 209 0 49 8 177 0 151]
#[0 2 214 0 49]
#[1 1 5 0 130 6 213 0 147 8 181 0 243]
#[1 8 185 0 11 8 9 0 59 8 13 0 61]
#[1 6 225 0 10 6 229 0 117 1 5 0 130 6 233 0 147 8 189 0 246 8 193 0 247]
#[0 2 230 0 49 0 119]
#[1 6 225 0 10 6 229 0 117 1 5 0 130 6 233 0 147 8 197 0 246]
#[1 6 225 0 10 6 229 0 117 1 5 0 130 6 233 0 147 8 201 0 246]
#[1 6 245 0 115 1 5 0 130 8 205 0 144 1 93 0 147 6 249 0 149 1 85 0 220 8 209 0 248 8 213 0 252 8 217 0 253]
#[1 1 5 0 130 8 221 0 147]
#[1 0 58 0 115 0 58 0 130 8 225 0 145 0 58 0 220]
#[0 2 182 0 71 0 112 0 118]
#[1 2 190 0 71 8 229 0 112 2 190 0 118 8 233 0 237 8 237 0 238]
#[1 3 42 0 62 3 42 0 63 3 42 0 64 3 42 0 65 3 42 0 66 3 42 0 68 3 42 0 69 3 42 0 72 3 42 0 73 3 42 0 74 3 42 0 76 3 42 0 85 3 42 0 86 3 42 0 87 3 42 0 91 8 241 0 109 3 42 0 130 3 42 0 220 8 245 0 251]
#[1 6 245 0 115 1 5 0 130 1 89 0 144 1 93 0 147 6 249 0 149 1 85 0 220 8 249 0 248]
#[0 2 110 0 11 0 49]
#[1 5 74 0 130 1 77 0 144 1 85 0 220]
#[1 0 58 0 4 0 58 0 11 0 58 0 15 8 253 0 145 0 58 0 220]
#[0 9 1 0 8]
#[0 1 98 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[1 9 5 0 104 1 5 0 130 5 253 0 147 9 9 0 171 9 13 0 222]
#[1 1 114 0 2 1 114 0 5 1 114 0 12 1 114 0 14 1 114 0 16 1 114 0 17 1 114 0 18 1 114 0 25 1 114 0 28 1 114 0 31 1 114 0 49 1 114 0 71 1 114 0 84 1 114 0 93 1 114 0 96 1 114 0 97 1 114 0 98 1 114 0 100 1 114 0 106 1 114 0 107 1 114 0 115 1 114 0 116 1 114 0 123 1 114 0 130 9 17 0 172 6 17 0 182]
#[0 1 146 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[1 1 189 0 16 1 193 0 17 1 197 0 18 9 21 0 20 1 201 0 25 1 205 0 28 0 181 0 31 1 209 0 49 1 213 0 93 1 217 0 96 1 221 0 98 1 225 0 106 1 229 0 107 0 233 0 115 0 237 0 123 1 5 0 130 1 13 0 147 1 233 0 151 1 237 0 152 1 241 0 184 1 245 0 185 1 249 0 186 1 253 0 187 2 1 0 188 2 5 0 189 2 9 0 190 2 13 0 191 2 17 0 192 2 21 0 193 2 25 0 194 2 29 0 195 2 33 0 196 2 37 0 197 2 41 0 198 2 45 0 199 2 49 0 200 2 53 0 201 2 57 0 203 1 33 0 205 2 61 0 212 1 73 1 50]
#[0 1 126 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[1 1 189 0 16 1 193 0 17 1 197 0 18 1 201 0 25 1 205 0 28 0 181 0 31 1 209 0 49 1 213 0 93 1 217 0 96 1 221 0 98 1 225 0 106 1 229 0 107 0 233 0 115 0 237 0 123 1 5 0 130 1 13 0 147 1 233 0 151 9 25 0 152 1 241 0 184 1 245 0 185 1 249 0 186 1 253 0 187 2 1 0 188 2 5 0 189 2 9 0 190 2 13 0 191 2 17 0 192 2 21 0 193 2 25 0 194 2 29 0 195 2 33 0 196 2 37 0 197 2 41 0 198 2 45 0 199 2 49 0 200 2 53 0 201 2 57 0 203 1 33 0 205 2 61 0 212 1 73 1 50]
#[1 1 189 0 16 1 193 0 17 1 197 0 18 1 201 0 25 1 205 0 28 0 181 0 31 1 209 0 49 1 213 0 93 1 217 0 96 1 221 0 98 1 225 0 106 1 229 0 107 0 233 0 115 0 237 0 123 1 5 0 130 1 13 0 147 1 233 0 151 9 29 0 152 1 241 0 184 1 245 0 185 1 249 0 186 1 253 0 187 2 1 0 188 2 5 0 189 2 9 0 190 2 13 0 191 2 17 0 192 2 21 0 193 2 25 0 194 2 29 0 195 2 33 0 196 2 37 0 197 2 41 0 198 2 45 0 199 2 49 0 200 2 53 0 201 2 57 0 203 1 33 0 205 2 61 0 212 1 73 1 50]
#[1 1 209 0 49 9 33 0 151]
#[1 2 42 0 49 9 37 0 88 2 42 0 102 2 42 0 103 9 41 0 213 9 45 0 214]
#[1 1 189 0 16 1 193 0 17 1 197 0 18 1 201 0 25 1 205 0 28 0 181 0 31 1 209 0 49 1 213 0 93 1 217 0 96 1 221 0 98 9 49 0 105 1 225 0 106 1 229 0 107 0 233 0 115 0 237 0 123 1 5 0 130 1 13 0 147 1 233 0 151 1 237 0 152 1 241 0 184 1 245 0 185 1 249 0 186 1 253 0 187 2 1 0 188 2 5 0 189 2 9 0 190 2 13 0 191 2 17 0 192 2 21 0 193 2 25 0 194 2 29 0 195 2 33 0 196 2 37 0 197 2 41 0 198 2 45 0 199 2 49 0 200 2 53 0 201 2 57 0 203 1 33 0 205 2 61 0 212 1 73 1 50]
#[0 5 18 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[0 9 53 0 11]
#[0 0 226 0 2 0 5 0 9 0 12 0 14 0 23 0 27 0 51 0 84 0 100 0 116]
#[1 1 5 0 130 9 57 0 147 9 61 0 163 9 65 0 164]
#[0 1 10 0 49]
#[1 1 209 0 49 9 69 0 151]
#[0 1 34 0 6 0 130 0 220]
#[0 3 162 0 10 0 31 0 34 0 38 0 47 0 50 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130]
#[0 3 150 0 7 0 10 0 31 0 34 0 38 0 47 0 50 0 70 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 92 0 115 0 118 0 123 0 125 0 126 0 127 0 128 0 129 0 130]
#[0 3 158 0 7 0 10 0 31 0 34 0 38 0 47 0 50 0 70 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 92 0 115 0 118 0 123 0 125 0 126 0 127 0 128 0 129 0 130]
#[1 1 209 0 49 9 73 0 151]
#[0 9 77 0 67]
#[0 4 30 0 62 0 63 0 64 0 65 0 66 0 68 0 69 0 72 0 73 0 74 0 76 0 85 0 86 0 87 0 91 0 130 0 220]
#[0 4 34 0 62 0 63 0 64 0 65 0 66 0 68 0 69 0 72 0 73 0 74 0 76 0 85 0 86 0 87 0 91 0 130 0 220]
#[0 4 6 0 1 0 3 0 11 0 49]
#[0 4 10 0 1 0 3 0 11 0 49]
#[0 4 26 0 1 0 3 0 11 0 49]
#[0 3 190 0 1 0 3 0 11 0 49]
#[0 3 102 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[0 2 222 0 11 0 15]
#[0 3 2 0 11 0 15 0 59 0 61]
#[1 3 6 0 11 3 6 0 15 8 9 0 59 8 13 0 61]
#[1 9 81 0 11 9 85 0 15]
#[0 2 246 0 11 0 15 0 59 0 61]
#[0 2 250 0 11 0 15 0 59 0 61]
#[1 0 62 0 115 1 5 0 130 2 237 0 147 0 62 0 220]
#[0 9 89 0 4]
#[0 3 50 0 71 0 112 0 114 0 115 0 118 0 130 0 220]
#[1 2 162 0 71 2 162 0 112 2 162 0 114 6 245 0 115 2 162 0 118 1 5 0 130 1 89 0 144 1 93 0 147 6 249 0 149 1 85 0 220 8 209 0 248 9 93 0 252]
#[0 9 97 0 108]
#[1 6 245 0 115 1 5 0 130 8 205 0 144 1 93 0 147 6 249 0 149 1 85 0 220 9 101 0 248 9 105 0 254 9 109 0 255]
#[1 0 58 0 115 0 58 0 130 9 113 0 145 0 58 0 220]
#[0 2 194 0 71 0 118]
#[1 5 129 0 71 2 198 0 118 6 205 0 173 9 117 0 239]
#[0 3 38 0 62 0 63 0 64 0 65 0 66 0 68 0 69 0 72 0 73 0 74 0 76 0 85 0 86 0 87 0 91 0 130 0 220]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 9 121 0 168 1 85 0 220 5 125 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[0 3 34 0 4 0 15]
#[1 1 62 0 4 1 62 0 11 1 62 0 15 1 77 0 144 1 85 0 220]
#[1 1 209 0 49 9 125 0 151]
#[1 1 209 0 49 9 129 0 151]
#[1 9 133 0 4 7 29 0 15 7 33 1 55]
#[0 2 98 0 104 0 130]
#[1 5 129 0 71 9 137 0 173]
#[1 1 209 0 49 9 141 0 151]
#[0 2 14 0 21]
#[0 2 10 0 10 0 21 0 30 0 31 0 34 0 38 0 47 0 50 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130]
#[0 1 134 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 9 145 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 2 46 0 49 0 102 0 103]
#[0 2 50 0 49 0 102 0 103]
#[1 1 209 0 49 9 149 0 151]
#[0 5 22 0 4 0 11 0 15 0 22 0 29 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 52 0 55 0 56 0 57 0 60 0 61 0 67 0 75 0 88 0 90 0 95 0 96 0 101 0 102 0 103 0 108 0 113 1 56]
#[1 1 22 0 11 9 153 0 13 1 22 0 15]
#[1 9 157 0 11 9 161 0 15]
#[0 1 14 0 11 0 15]
#[0 0 222 0 2 0 5 0 9 0 12 0 14 0 23 0 27 0 51 0 84 0 100 0 116]
#[0 3 146 0 7 0 10 0 31 0 34 0 38 0 47 0 50 0 70 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 92 0 115 0 118 0 123 0 125 0 126 0 127 0 128 0 129 0 130]
#[0 4 46 0 29]
#[0 2 254 0 11 0 15 0 59 0 61]
#[1 6 225 0 10 6 229 0 117 1 5 0 130 6 233 0 147 9 165 0 246]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 9 169 0 168 1 85 0 220 5 125 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[0 3 54 0 71 0 112 0 114 0 115 0 118 0 130 0 220]
#[1 1 5 0 130 1 89 0 144 1 93 0 147 9 173 0 149 1 85 0 220]
#[0 9 177 0 4]
#[0 3 62 0 71 0 112 0 115 0 118 0 130 0 220]
#[1 2 174 0 71 2 174 0 112 6 245 0 115 2 174 0 118 1 5 0 130 1 89 0 144 1 93 0 147 6 249 0 149 1 85 0 220 9 101 0 248 9 181 0 254]
#[1 9 185 0 115 1 5 0 130 1 77 0 144 9 189 0 147 1 85 0 220 9 193 0 249 9 197 1 1 9 201 1 2 9 205 1 3 9 209 1 4]
#[0 9 213 0 118]
#[1 1 209 0 49 9 217 0 151]
#[0 1 74 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[0 1 122 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 9 221 0 168 1 85 0 220 5 125 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[0 9 225 0 7]
#[0 1 150 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[0 2 38 0 49 0 102 0 103]
#[0 1 154 0 8 0 10 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 26 0 28 0 30 0 31 0 34 0 38 0 47 0 49 0 50 0 58 0 71 0 75 0 77 0 78 0 79 0 81 0 82 0 83 0 90 0 93 0 96 0 98 0 105 0 106 0 107 0 115 0 123 0 125 0 126 0 127 0 128 0 129 0 130 1 56]
#[1 1 5 0 130 9 229 0 147]
#[0 1 2 0 49]
#[1 1 5 0 130 9 57 0 147 9 233 0 164]
#[1 3 10 0 11 3 10 0 15 8 9 0 59 8 13 0 61]
#[0 9 237 0 1]
#[0 3 18 0 4 0 15]
#[1 4 81 0 62 4 85 0 63 4 89 0 64 4 93 0 65 4 97 0 66 4 101 0 68 4 105 0 69 4 109 0 72 4 113 0 73 4 117 0 74 4 121 0 76 4 125 0 85 4 129 0 86 4 133 0 87 4 137 0 91 1 5 0 130 1 89 0 144 1 93 0 147 4 141 0 149 9 241 0 168 1 85 0 220 9 245 1 0 5 125 1 14 4 153 1 15 4 157 1 16 4 161 1 17 4 165 1 18 4 169 1 19 4 173 1 20 4 177 1 21 4 181 1 22 4 185 1 23 4 189 1 24 4 193 1 25 4 197 1 26]
#[0 3 66 0 71 0 112 0 115 0 118 0 130 0 220]
#[0 9 249 0 113]
#[1 9 253 0 4 3 22 0 15 3 22 0 49]
#[0 3 94 0 15 0 49]
#[0 3 82 0 71 0 115 0 118 0 130]
#[1 2 186 0 71 9 185 0 115 2 186 0 118 1 5 0 130 9 189 0 147 9 193 0 249 10 1 1 1 9 205 1 3 9 209 1 4]
#[1 9 185 0 115 1 5 0 130 10 5 0 147 9 193 0 249 10 9 1 4]
#[1 10 13 0 15 1 209 0 49 10 17 0 151]
#[1 1 209 0 49 10 21 0 151]
#[0 2 150 0 71 0 110 0 112 0 114 0 115 0 118 0 130 0 220]
#[1 10 25 0 1 1 209 0 49 10 29 0 151]
#[1 1 209 0 49 10 33 0 151]
#[0 1 26 0 11 0 15]
#[0 1 18 0 11 0 15]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 10 37 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 3 70 0 3]
#[0 10 41 0 3]
#[1 1 5 0 130 10 45 0 147]
#[0 3 90 0 115 0 130]
#[0 3 86 0 71 0 115 0 118 0 130]
#[0 3 22 0 15 0 49]
#[1 10 13 0 15 1 209 0 49 10 49 0 151]
#[1 9 185 0 115 1 5 0 130 10 5 0 147 10 53 0 249]
#[0 3 78 0 71 0 115 0 118 0 130]
#[0 2 122 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[1 0 177 0 10 0 181 0 31 0 185 0 34 0 189 0 38 0 193 0 47 0 197 0 50 0 201 0 75 0 205 0 77 0 209 0 78 0 213 0 79 0 217 0 81 0 221 0 82 0 225 0 83 0 229 0 90 0 233 0 115 0 237 0 123 0 241 0 125 0 245 0 126 0 249 0 127 0 253 0 128 1 1 0 129 1 5 0 130 1 13 0 147 10 57 0 148 1 21 0 201 1 25 0 203 1 29 0 204 1 33 0 205 1 37 1 37 1 41 1 38 1 45 1 39 1 49 1 40 1 53 1 41 1 57 1 42 1 61 1 44 1 65 1 45 1 69 1 46 1 73 1 50]
#[0 2 86 0 104 0 130]
#[0 1 50 0 2 0 5 0 8 0 12 0 14 0 16 0 17 0 18 0 24 0 25 0 28 0 31 0 49 0 51 0 71 0 84 0 93 0 96 0 97 0 98 0 100 0 106 0 107 0 115 0 116 0 123 0 130 1 56]
#[1 1 209 0 49 10 61 0 151]
#[1 1 5 0 130 10 65 0 147]
#[0 10 69 0 108]
#[0 3 74 0 71 0 115 0 118 0 130]
#[0 3 98 0 15 0 49]
#[1 1 209 0 49 10 73 0 151]
#[0 3 46 0 71 0 112 0 114 0 115 0 118 0 130 0 220]
#[1 1 209 0 49 10 77 0 151]
#[1 1 5 0 130 10 81 0 147]
#[0 2 90 0 104 0 130]
#[0 3 58 0 71 0 112 0 115 0 118 0 130 0 220]
#[0 3 26 0 15 0 49]
)
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> type: ident underlyingType: underlyingType whereClause: whereClauseOrNil [ 
	| r | r := OrderedCollection new. r add: #type; add: ident; add: underlyingType; add: whereClauseOrNil. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> typeEntry: aType [
	^self buildParserResultWith: aType
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> typeIdentifier: anIdentifier [
	^ anIdentifier
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> typeMapFrom: aListOfIdent to: anExpression [ 
	^ self
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> typeMapTo: anExpression from: aListOfListOfIdent [ 
	aListOfListOfIdent do: [:i | self typeMapFrom: i to: anExpression]

]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> typeMapWhereClause: whereRuleList to: anExpression [
	whereRuleList do: [:i | self typeMapWhere: i to: anExpression]
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> uniqueAttributesList: anIdentifiersCollection head: anIdentOrNil [
	| r | r := OrderedCollection new. r add: #uniqueAttributesList; add: anIdentOrNil; add: anIdentifiersCollection . ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> uniqueClause: aUniqueClause [ 
	| r | r := OrderedCollection new. r add: #uniqueClause; add: aUniqueClause. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> whereClause: aWhereClause [ 
	| r | r := OrderedCollection new. r add: #whereClause; add: aWhereClause. ^ r
]

{ #category : #'express semantic actions' }
PlatypusExpressAbstractParser >> whereRule: anExpression head: anIdentOrNil [
	| r | r := OrderedCollection new. r add: #whereRule; add: anIdentOrNil; add: anExpression. ^ r
]
