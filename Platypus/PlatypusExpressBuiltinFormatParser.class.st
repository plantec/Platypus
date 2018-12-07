Class {
	#name : #PlatypusExpressBuiltinFormatParser,
	#superclass : #SmaCCParser,
	#category : #'Platypus-HW-parsers'
}

{ #category : #generated }
PlatypusExpressBuiltinFormatParser class >> definitionComment [
"#Definition extracted from old style definition comments
<integer>			:		\d+	;
<whitespace>		:		\s+ ;


Rep
: SymbolRep { PlatypusExpressBuiltinFormatSymbolicFormatter sourceFormat: '1' }
| GraphRep { PlatypusExpressBuiltinFormatPictureFormatter sourceFormat: '1' }
;

SymbolRep
: Signe Width Decimals Type
;

Signe
: ""+"" { $+ }
| ""-"" { $- }
| { nil }
;

Width
: <integer> { '1' value }
| { nil }
;

Decimals
: ""."" <integer> { '2' value  }
| { nil }
;

Type
: ""I"" { $I }
| ""F"" { $F }
| ""E"" { $E }
;

GraphRep
: Signe GraphRepContents
| OPar GraphRepContents CPar 
;

OPar
: ""("" { $( }
;
CPar
: "")"" { $) }
;

GraphRepContents
: Diezes Sep Diezes Sep Diezes { Array with: '1' with: '2' with: '3' with: '4' with: '5' }
| Diezes Sep Diezes  { Array with: '1' with: '2' with: '3' }
| Diezes { Array with: '1' }
;

Diezes
: ""#""+ { '1' value size }
;

Sep
: ""."" { $. }
| "","" { $, }
;"

]

{ #category : #'generated-accessing' }
PlatypusExpressBuiltinFormatParser class >> scannerClass [
	^PlatypusExpressBuiltinFormatScanner
]

{ #category : #generated }
PlatypusExpressBuiltinFormatParser class >> startingStateForRep [
	^ 1
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForCPar1: nodes [
	^ $)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForDecimals1: nodes [
	^ (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForDiezes1: nodes [
	^ (nodes at: 1) value size
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForGraphRepContents1: nodes [
	^ Array
		with: (nodes at: 1)
		with: (nodes at: 2)
		with: (nodes at: 3)
		with: (nodes at: 4)
		with: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForGraphRepContents2: nodes [
	^ Array with: (nodes at: 1) with: (nodes at: 2) with: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForGraphRepContents3: nodes [
	^ Array with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForOPar1: nodes [
	^ $(
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForRep1: nodes [
	^ PlatypusExpressBuiltinFormatSymbolicFormatter sourceFormat: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForRep2: nodes [
	^ PlatypusExpressBuiltinFormatPictureFormatter sourceFormat: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForSep1: nodes [
	^ $.
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForSep2: nodes [
	^ $,
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForSigne1: nodes [
	^ $+
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForSigne2: nodes [
	^ $-
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForType1: nodes [
	^ $I
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForType2: nodes [
	^ $F
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForType3: nodes [
	^ $E
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionForWidth1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionFor____1: nodes [
	^ OrderedCollection with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
PlatypusExpressBuiltinFormatParser >> reduceActionFor____2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #generated }
PlatypusExpressBuiltinFormatParser >> reduceTable [
^#(
	#(15 0 #nil) 
	#(15 1 #reduceActionForSigne2:) 
	#(15 1 #reduceActionForSigne1:) 
	#(21 1 #reduceActionForOPar1:) 
	#(13 1 #reduceActionForRep2:) 
	#(16 0 #nil) 
	#(13 1 #reduceActionForRep1:) 
	#(25 1 #reduceActionFor____1:) 
	#(16 1 #reduceActionForWidth1:) 
	#(17 0 #nil) 
	#(14 2 #reduceFor:) 
	#(20 1 #reduceActionForGraphRepContents3:) 
	#(23 1 #reduceActionForDiezes1:) 
	#(24 1 #reduceActionForSep1:) 
	#(24 1 #reduceActionForSep2:) 
	#(25 2 #reduceActionFor____2:) 
	#(22 1 #reduceActionForCPar1:) 
	#(14 3 #reduceFor:) 
	#(17 2 #reduceActionForDecimals1:) 
	#(18 1 #reduceActionForType1:) 
	#(18 1 #reduceActionForType2:) 
	#(18 1 #reduceActionForType3:) 
	#(19 4 #reduceFor:) 
	#(20 3 #reduceActionForGraphRepContents2:) 
	#(20 5 #reduceActionForGraphRepContents1:)
	).

]

{ #category : #generated }
PlatypusExpressBuiltinFormatParser >> transitionTable [
^#(
#[1 0 6 0 1 0 9 0 2 0 6 0 3 0 6 0 4 0 13 0 5 0 6 0 7 0 6 0 9 0 17 0 10 0 6 0 11 0 21 0 13 0 25 0 14 0 29 0 15 0 33 0 19 0 37 0 21] 
#[0 0 10 0 1 0 3 0 4 0 7 0 9 0 11] 
#[0 0 14 0 1 0 3 0 4 0 7 0 9 0 11] 
#[0 0 18 0 7] 
#[0 0 0 0 26] 
#[0 0 22 0 26] 
#[1 0 26 0 1 0 26 0 3 0 26 0 4 0 41 0 7 0 26 0 9 0 45 0 11 0 49 0 16 0 53 0 20 0 57 0 23 0 61 0 25] 
#[0 0 30 0 26] 
#[1 0 41 0 7 0 65 0 20 0 57 0 23 0 61 0 25] 
#[0 0 34 0 1 0 6 0 7 0 8 0 26] 
#[0 0 38 0 1 0 3 0 4 0 9] 
#[1 0 69 0 1 0 42 0 3 0 42 0 4 0 42 0 9 0 73 0 17] 
#[0 0 46 0 26] 
#[1 0 77 0 1 0 81 0 6 0 50 0 8 0 85 0 24 0 50 0 26] 
#[1 0 54 0 1 0 54 0 6 0 89 0 7 0 54 0 8 0 54 0 26] 
#[1 0 93 0 8 0 97 0 22] 
#[0 0 101 0 11] 
#[1 0 105 0 3 0 109 0 4 0 113 0 9 0 117 0 18] 
#[0 0 58 0 7] 
#[0 0 62 0 7] 
#[1 0 41 0 7 0 121 0 23 0 61 0 25] 
#[0 0 66 0 1 0 6 0 7 0 8 0 26] 
#[0 0 70 0 26] 
#[0 0 74 0 26] 
#[0 0 78 0 3 0 4 0 9] 
#[0 0 82 0 26] 
#[0 0 86 0 26] 
#[0 0 90 0 26] 
#[0 0 94 0 26] 
#[1 0 77 0 1 0 81 0 6 0 98 0 8 0 125 0 24 0 98 0 26] 
#[1 0 41 0 7 0 129 0 23 0 61 0 25] 
#[0 0 102 0 8 0 26]
	).

]
