Class {
	#name : #StepParser,
	#superclass : #SmaCCParser,
	#category : #'Platypus-STEP-core'
}

{ #category : #'generated-comments' }
StepParser class >> parserDefinitionComment [

	"%start ExchangeFile DataEntities DataEntity SimpleRecordEntry Parameter	;

ExchangeFile	
	: ""ISO-10303-21"" "";"" HeaderSection  'HS' DataSection 'DS' ""END-ISO-10303-21"" "";""  { Array with: HS with: DS.};
HeaderSection	
	: <identifier> "";"" HeaderEntity* 'entities'  <identifier> "";""  {entities};

EntityName
	: <identifier> { '1' value asUppercase };

HeaderEntity
	: EntityName ""("" Parameters "")"" "";"" { self headerDataNamed: '1' record: '3' }
	| EntityName ""(""  "")"" "";""  {self headerDataNamed: '1' value record: OrderedCollection new };

DataSection	
	: <identifier> "";"" DataEntities 'entities' <identifier> "";"" {entities.};

DataEntities
	: DataEntity* ;

DataEntity	
	: InstLabel  ""="" ""SCOPE"" DataEntity* ""END_SCOPE"" EntityExport EntityInstanceRHS "";"" 
 		{ self data: '1' record: '7'}
	| InstLabel  ""="" EntityInstanceRHS "";"" { self data: '1' record: '3'};

InstLabel
	: ""#"" <integer> 'id' { id value } 
	| ""#"" <identifier> 'id' { id value };
	
EntityInstanceRHS	
	: SimpleRecord {self simpleInstanceKey -> '1'}
	| SubsuperRecord { self complexInstanceKey -> '1'};
	
SubsuperRecord
	: ""("" SubsuperRecordList "")"" {'2'};
	
SubsuperRecordList
	: SubsuperRecordListElement* {'1'};

SubsuperRecordListElement
	: <identifier> 'entity' ""("" Parameters 'attributes' "")"" { Association key: entity value value: attributes }
	| <identifier> 'entity' ""(""  "")"" { Association key: entity value value: OrderedCollection new };

SimpleRecordEntry
	: SimpleRecord { StepSimpleRecord entityName: '1' first values: '1' second } ;

SimpleRecord
	: EntityName 'entity' ""("" Parameters? 'attributes' "")"" 
	{ self simpleRecord: entity attributes: (attributes ifNil: [OrderedCollection new]) };

TypedValue
	:  EntityName ""("" Parameter "")"" { '3' };

Parameters	
: Parameter { OrderedCollection with: '1' }
| Parameters "",""? Parameter { '1' add: '3'. '1' }
;

Parameter
: ParameterValue { '1'  }
| <identifier> "":"" ParameterValue { '3' value }
;

ParameterValue
	: ""$"" { $$ }
	| ""*"" { StepRedefinedValue new }
	| PlusOrMinus? <integer> { | v | v := '2' value asNumber . '1' value = $- ifTrue: [ v := v negated]. v}
	| PlusOrMinus? <real> { | v | v := '2' value asNumber . '1' value = $- ifTrue: [ v := v negated]. v asFloat}
	| <enum>  {('1' value copyFrom:2 to: ('1' value size -1)) asSymbol}
	| <string> { | v | v := '1' value copyFrom:2 to: ('1' value size -1). v copyReplaceAll: '''''' with: '''' }
	| <binary> {'1' value copyFrom:2 to: ('1' value size -1)}
	| Logical {'1' }
	| TypedValue {'1'  }
	| InstanceReference {'1'}
	| EmbeddedList { '1' };
	
Logical
	: "".T."" {true}
	| "".F."" {false}
	| "".U."" {#UNKNOWN};

PlusOrMinus
	: ""+"" { $+ }
	| ""-"" { $- };
	
InstanceReference
	: InstLabel { StepInstanceReference id: '1'};

ScopeInstanceReference
	: InstanceReference;

EntityExport
	:""/""  ScopeInstRefs ""/""
	|;

ScopeInstRefs
	: ScopeInstanceReference
	| ScopeInstRefs "","" ScopeInstanceReference;

EmbeddedList
	: ""("" Parameters "")"" {'2'}
	| ""("" "")"" { OrderedCollection new };

"
]

{ #category : #'generated-accessing' }
StepParser class >> scannerClass [
	^StepScanner
]

{ #category : #'generated-starting states' }
StepParser class >> startingStateForDataEntities [
	^3
]

{ #category : #'generated-starting states' }
StepParser class >> startingStateForDataEntity [
	^4
]

{ #category : #'generated-starting states' }
StepParser class >> startingStateForExchangeFile [
	^1
]

{ #category : #'generated-starting states' }
StepParser class >> startingStateForParameter [
	^6
]

{ #category : #'generated-starting states' }
StepParser class >> startingStateForSimpleRecordEntry [
	^5
]

{ #category : #'semantic actions' }
StepParser >> complexInstanceKey [
	^ #complexInstance
]

{ #category : #'semantic actions' }
StepParser >> data: instLabel record: record [ 
	| records |
	^ record key = self simpleInstanceKey
		ifTrue: [StepInternalRepresentation
				label: instLabel
				entityName: record value first
				values: record value second]
		ifFalse: [records := record value
						collect: [:v | StepSimpleRecord entityName: v key values: v value].
			StepExternalRepresentation label: instLabel records: records]
]

{ #category : #'semantic actions' }
StepParser >> headerDataNamed: name record: record [ 
	^ StepSimpleRecord		
				entityName: name
				values: record
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForDataEntity1: nodes [
	^ self data: (nodes at: 1) record: (nodes at: 7)
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForDataEntity2: nodes [
	^ self data: (nodes at: 1) record: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForDataSection1: nodes [
	^ nodes at: 3
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForEmbeddedList1: nodes [
	^ nodes at: 2
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForEmbeddedList2: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForEntityInstanceRHS1: nodes [
	^ self simpleInstanceKey -> (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForEntityInstanceRHS2: nodes [
	^ self complexInstanceKey -> (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForEntityName1: nodes [
	^ (nodes at: 1) value asUppercase
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForExchangeFile1: nodes [
	^ Array with: (nodes at: 3) with: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForHeaderEntity1: nodes [
	^ self headerDataNamed: (nodes at: 1) record: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForHeaderEntity2: nodes [
	^ self headerDataNamed: (nodes at: 1) value record: OrderedCollection new
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForHeaderSection1: nodes [
	^ nodes at: 3
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForInstLabel1: nodes [
	^ (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForInstLabel2: nodes [
	^ (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForInstanceReference1: nodes [
	^ StepInstanceReference id: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForLogical1: nodes [
	^ true
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForLogical2: nodes [
	^ false
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForLogical3: nodes [
	^ #UNKNOWN
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForOptionalXXParameters1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForOptionalXXParameters2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForOptionalXXPlusOrMinus1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForOptionalXXPlusOrMinus2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForOptionalXXXXX1: nodes [
	^ nil
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForOptionalXXXXX2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameter1: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameter2: nodes [
	^ (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameterValue10: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameterValue11: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameterValue1: nodes [
	^ $$
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameterValue2: nodes [
	^ StepRedefinedValue new
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameterValue3: nodes [
	| v |
	v := (nodes at: 2) value asNumber.
	(nodes at: 1) value = $-
		ifTrue: [ v := v negated ].
	^ v
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameterValue4: nodes [
	| v |
	v := (nodes at: 2) value asNumber.
	(nodes at: 1) value = $-
		ifTrue: [ v := v negated ].
	^ v asFloat
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameterValue5: nodes [
	^ ((nodes at: 1) value copyFrom: 2 to: (nodes at: 1) value size - 1) asSymbol
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameterValue6: nodes [
	| v |
	v := (nodes at: 1) value copyFrom: 2 to: (nodes at: 1) value size - 1.
	^ v copyReplaceAll: '''''' with: ''''
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameterValue7: nodes [
	^ (nodes at: 1) value copyFrom: 2 to: (nodes at: 1) value size - 1
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameterValue8: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameterValue9: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameters1: nodes [
	^ OrderedCollection with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForParameters2: nodes [
	(nodes at: 1) add: (nodes at: 3).
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForPlusOrMinus1: nodes [
	^ $+
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForPlusOrMinus2: nodes [
	^ $-
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForRepeatXXDataEntity1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForRepeatXXDataEntity2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForRepeatXXHeaderEntity1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForRepeatXXHeaderEntity2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForRepeatXXSubsuperRecordListElement1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForRepeatXXSubsuperRecordListElement2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForSimpleRecord1: nodes [
	^ self simpleRecord: (nodes at: 1) attributes: ((nodes at: 3) ifNil: [ OrderedCollection new ])
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForSimpleRecordEntry1: nodes [
	^ StepSimpleRecord entityName: (nodes at: 1) first values: (nodes at: 1) second
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForSubsuperRecord1: nodes [
	^ nodes at: 2
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForSubsuperRecordList1: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForSubsuperRecordListElement1: nodes [
	^ Association key: (nodes at: 1) value value: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForSubsuperRecordListElement2: nodes [
	^ Association key: (nodes at: 1) value value: OrderedCollection new
]

{ #category : #'generated-reduction actions' }
StepParser >> reduceActionForTypedValue1: nodes [
	^ nodes at: 3
]

{ #category : #'generated-tables' }
StepParser >> reduceTable [
	^#(
#(30 0 #reduceActionForRepeatXXHeaderEntity1:)
#(30 2 #reduceActionForRepeatXXHeaderEntity2:)
#(31 1 #reduceActionForEntityName1:)
#(32 5 #reduceActionForDataSection1:)
#(33 0 #reduceActionForRepeatXXDataEntity1:)
#(33 2 #reduceActionForRepeatXXDataEntity2:)
#(34 2 #reduceActionForInstLabel1:)
#(34 2 #reduceActionForInstLabel2:)
#(35 3 #reduceFor:)
#(35 0 #reduceFor:)
#(36 1 #reduceActionForEntityInstanceRHS1:)
#(36 1 #reduceActionForEntityInstanceRHS2:)
#(37 5 #reduceActionForHeaderSection1:)
#(38 4 #reduceActionForSimpleRecord1:)
#(39 3 #reduceActionForSubsuperRecord1:)
#(40 1 #reduceActionForSubsuperRecordList1:)
#(41 4 #reduceActionForSubsuperRecordListElement1:)
#(41 3 #reduceActionForSubsuperRecordListElement2:)
#(42 0 #reduceActionForRepeatXXSubsuperRecordListElement1:)
#(42 2 #reduceActionForRepeatXXSubsuperRecordListElement2:)
#(43 0 #reduceActionForOptionalXXParameters1:)
#(43 1 #reduceActionForOptionalXXParameters2:)
#(44 5 #reduceActionForHeaderEntity1:)
#(44 4 #reduceActionForHeaderEntity2:)
#(45 0 #reduceActionForOptionalXXXXX1:)
#(45 1 #reduceActionForOptionalXXXXX2:)
#(46 1 #reduceActionForParameterValue1:)
#(46 1 #reduceActionForParameterValue2:)
#(46 2 #reduceActionForParameterValue3:)
#(46 2 #reduceActionForParameterValue4:)
#(46 1 #reduceActionForParameterValue5:)
#(46 1 #reduceActionForParameterValue6:)
#(46 1 #reduceActionForParameterValue7:)
#(46 1 #reduceActionForParameterValue8:)
#(46 1 #reduceActionForParameterValue9:)
#(46 1 #reduceActionForParameterValue10:)
#(46 1 #reduceActionForParameterValue11:)
#(47 1 #reduceActionForPlusOrMinus1:)
#(47 1 #reduceActionForPlusOrMinus2:)
#(48 0 #reduceActionForOptionalXXPlusOrMinus1:)
#(48 1 #reduceActionForOptionalXXPlusOrMinus2:)
#(49 1 #reduceActionForParameter1:)
#(49 3 #reduceActionForParameter2:)
#(50 1 #reduceActionForSimpleRecordEntry1:)
#(51 8 #reduceActionForDataEntity1:)
#(51 4 #reduceActionForDataEntity2:)
#(52 1 #reduceFor:)
#(53 1 #reduceActionForLogical1:)
#(53 1 #reduceActionForLogical2:)
#(53 1 #reduceActionForLogical3:)
#(54 1 #reduceActionForInstanceReference1:)
#(55 3 #reduceActionForEmbeddedList1:)
#(55 2 #reduceActionForEmbeddedList2:)
#(56 1 #reduceFor:)
#(57 1 #reduceFor:)
#(57 3 #reduceFor:)
#(60 6 #reduceActionForExchangeFile1:)
#(61 4 #reduceActionForTypedValue1:)
#(62 1 #reduceFor:)
#(63 1 #reduceActionForParameters1:)
#(63 3 #reduceActionForParameters2:)
)
]

{ #category : #'semantic actions' }
StepParser >> simpleInstanceKey [
	^ #simpleInstance
]

{ #category : #'semantic actions' }
StepParser >> simpleRecord: entity attributes: attributes [ 
	^ Array with: entity with: attributes
]

{ #category : #'generated-tables' }
StepParser >> transitionTable [
	^#(
#[1 0 29 0 6 0 33 0 60]
#[1 0 29 0 6 0 37 0 60]
#[1 0 22 0 9 0 41 0 33 0 45 0 52 0 22 0 58]
#[1 0 49 0 9 0 53 0 34 0 57 0 51]
#[1 0 61 0 25 0 65 0 31 0 69 0 38 0 73 0 50]
#[1 0 77 0 4 0 49 0 9 0 81 0 11 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 16 0 101 0 18 0 105 0 19 0 162 0 21 0 162 0 22 0 109 0 23 0 113 0 24 0 117 0 25 0 121 0 26 0 125 0 31 0 129 0 34 0 133 0 46 0 137 0 47 0 141 0 48 0 145 0 49 0 149 0 53 0 153 0 54 0 157 0 55 0 161 0 61]
#[0 0 165 0 7]
#[0 0 0 0 58]
#[0 0 0 0 58]
#[1 0 49 0 9 0 190 0 25 0 53 0 34 0 169 0 51 0 190 0 58]
#[0 0 0 0 58]
#[1 0 173 0 21 0 177 0 25]
#[0 0 181 0 8]
#[0 0 0 0 58]
#[0 0 14 0 4]
#[0 0 185 0 4]
#[0 0 178 0 58]
#[0 0 0 0 58]
#[1 0 189 0 3 0 77 0 4 0 49 0 9 0 81 0 11 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 16 0 101 0 18 0 105 0 19 0 162 0 21 0 162 0 22 0 109 0 23 0 113 0 24 0 117 0 25 0 121 0 26 0 125 0 31 0 129 0 34 0 133 0 46 0 137 0 47 0 141 0 48 0 193 0 49 0 149 0 53 0 153 0 54 0 157 0 55 0 161 0 61 0 197 0 63]
#[0 0 202 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 154 0 21 0 22]
#[0 0 198 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 158 0 21 0 22]
#[0 0 194 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 110 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 114 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 134 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 130 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[1 0 14 0 4 0 201 0 17]
#[0 0 126 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 205 0 4]
#[0 0 206 0 1 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 170 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 166 0 21 0 22]
#[1 0 209 0 21 0 213 0 22]
#[0 0 0 0 58]
#[0 0 138 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 146 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 150 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 142 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[1 0 217 0 25 0 221 0 37]
#[0 0 26 0 5 0 9 0 25 0 58]
#[0 0 30 0 1 0 3 0 4 0 8 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 34 0 1 0 3 0 4 0 8 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[1 0 225 0 2 0 229 0 4 0 61 0 25 0 65 0 31 0 233 0 36 0 237 0 38 0 241 0 39]
#[1 0 86 0 3 0 77 0 4 0 49 0 9 0 81 0 11 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 16 0 101 0 18 0 105 0 19 0 162 0 21 0 162 0 22 0 109 0 23 0 113 0 24 0 117 0 25 0 121 0 26 0 125 0 31 0 129 0 34 0 245 0 43 0 133 0 46 0 137 0 47 0 141 0 48 0 193 0 49 0 149 0 53 0 153 0 54 0 157 0 55 0 161 0 61 0 249 0 63]
#[0 0 214 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 242 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26]
#[1 0 253 0 3 0 102 0 4 0 102 0 9 0 102 0 11 0 102 0 12 0 102 0 13 0 102 0 14 1 1 0 15 0 102 0 16 0 102 0 18 0 102 0 19 0 102 0 21 0 102 0 22 0 102 0 23 0 102 0 24 0 102 0 25 0 102 0 26 1 5 0 45]
#[1 0 77 0 4 0 49 0 9 0 81 0 11 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 16 0 101 0 18 0 105 0 19 0 162 0 21 0 162 0 22 0 109 0 23 0 113 0 24 0 61 0 25 0 121 0 26 0 125 0 31 0 129 0 34 1 9 0 46 0 137 0 47 0 141 0 48 0 149 0 53 0 153 0 54 0 157 0 55 0 161 0 61]
#[1 0 77 0 4 0 49 0 9 0 81 0 11 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 16 0 101 0 18 0 105 0 19 0 162 0 21 0 162 0 22 0 109 0 23 0 113 0 24 0 117 0 25 0 121 0 26 0 125 0 31 0 129 0 34 0 133 0 46 0 137 0 47 0 141 0 48 1 13 0 49 0 149 0 53 0 153 0 54 0 157 0 55 0 161 0 61]
#[0 0 118 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 122 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 1 17 0 7]
#[1 1 21 0 25 1 25 0 32]
#[1 0 22 0 5 0 22 0 9 1 29 0 33]
#[1 0 78 0 3 0 78 0 25 1 33 0 40 1 37 0 42]
#[0 1 41 0 7]
#[0 0 46 0 7]
#[0 0 50 0 7]
#[0 1 45 0 3]
#[1 0 90 0 3 0 102 0 4 0 102 0 9 0 102 0 11 0 102 0 12 0 102 0 13 0 102 0 14 1 1 0 15 0 102 0 16 0 102 0 18 0 102 0 19 0 102 0 21 0 102 0 22 0 102 0 23 0 102 0 24 0 102 0 25 0 102 0 26 1 5 0 45]
#[0 0 210 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 0 106 0 4 0 9 0 11 0 12 0 13 0 14 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26]
#[1 0 77 0 4 0 49 0 9 0 81 0 11 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 16 0 101 0 18 0 105 0 19 0 162 0 21 0 162 0 22 0 109 0 23 0 113 0 24 0 117 0 25 0 121 0 26 0 125 0 31 0 129 0 34 0 133 0 46 0 137 0 47 0 141 0 48 1 49 0 49 0 149 0 53 0 153 0 54 0 157 0 55 0 161 0 61]
#[0 0 174 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[0 1 53 0 3]
#[1 0 6 0 25 1 57 0 30]
#[0 1 61 0 7]
#[0 1 65 0 10]
#[1 1 69 0 5 0 49 0 9 0 53 0 34 0 169 0 51]
#[0 1 73 0 3]
#[1 0 66 0 3 1 77 0 25 1 81 0 41]
#[0 0 186 0 5 0 9 0 25 0 58]
#[0 0 58 0 7 0 58]
#[0 0 246 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26]
#[0 0 234 0 3 0 4 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 21 0 22 0 23 0 24 0 25 0 26 0 58]
#[1 1 85 0 25 1 89 0 31 1 93 0 44]
#[1 0 22 0 9 0 22 0 25 0 41 0 33 1 97 0 52]
#[0 1 101 0 7]
#[1 1 105 0 1 0 42 0 4 0 42 0 25 1 109 0 35]
#[0 0 62 0 7]
#[0 1 113 0 4]
#[0 0 82 0 3 0 25]
#[1 0 14 0 4 1 117 0 7]
#[0 1 121 0 4]
#[0 0 10 0 25]
#[0 1 125 0 25]
#[0 0 230 0 58]
#[1 0 49 0 9 0 129 0 34 1 129 0 54 1 133 0 56 1 137 0 57]
#[1 0 229 0 4 0 61 0 25 0 65 0 31 1 141 0 36 0 237 0 38 0 241 0 39]
#[1 1 145 0 3 0 77 0 4 0 49 0 9 0 81 0 11 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 16 0 101 0 18 0 105 0 19 0 162 0 21 0 162 0 22 0 109 0 23 0 113 0 24 0 117 0 25 0 121 0 26 0 125 0 31 0 129 0 34 0 133 0 46 0 137 0 47 0 141 0 48 0 193 0 49 0 149 0 53 0 153 0 54 0 157 0 55 0 161 0 61 1 149 0 63]
#[0 0 54 0 25]
#[1 1 153 0 3 0 77 0 4 0 49 0 9 0 81 0 11 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 16 0 101 0 18 0 105 0 19 0 162 0 21 0 162 0 22 0 109 0 23 0 113 0 24 0 117 0 25 0 121 0 26 0 125 0 31 0 129 0 34 0 133 0 46 0 137 0 47 0 141 0 48 0 193 0 49 0 149 0 53 0 153 0 54 0 157 0 55 0 161 0 61 1 157 0 63]
#[0 1 161 0 7]
#[0 0 218 0 1 0 15]
#[0 0 222 0 1 0 15]
#[1 1 165 0 1 1 169 0 15]
#[0 1 173 0 7]
#[0 0 74 0 3 0 25]
#[1 1 177 0 3 0 102 0 4 0 102 0 9 0 102 0 11 0 102 0 12 0 102 0 13 0 102 0 14 1 1 0 15 0 102 0 16 0 102 0 18 0 102 0 19 0 102 0 21 0 102 0 22 0 102 0 23 0 102 0 24 0 102 0 25 0 102 0 26 1 5 0 45]
#[0 1 181 0 7]
#[1 1 185 0 3 0 102 0 4 0 102 0 9 0 102 0 11 0 102 0 12 0 102 0 13 0 102 0 14 1 1 0 15 0 102 0 16 0 102 0 18 0 102 0 19 0 102 0 21 0 102 0 22 0 102 0 23 0 102 0 24 0 102 0 25 0 102 0 26 1 5 0 45]
#[0 0 18 0 10]
#[0 0 38 0 4 0 25]
#[1 0 49 0 9 0 129 0 34 1 129 0 54 1 189 0 56]
#[0 0 182 0 5 0 9 0 25 0 58]
#[0 0 70 0 3 0 25]
#[0 0 98 0 25]
#[0 1 193 0 7]
#[0 0 226 0 1 0 15]
#[0 0 94 0 25]
)
]
