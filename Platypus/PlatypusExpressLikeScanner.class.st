Class {
	#name : #PlatypusExpressLikeScanner,
	#superclass : #SmaCCScanner,
	#category : #'Platypus-HW-parsers'
}

{ #category : #'generated-comments' }
PlatypusExpressLikeScanner class >> scannerDefinitionComment [

	"<character> : \s|\S ;
<anti>		: \\. ;"
]

{ #category : #'generated-tokens' }
PlatypusExpressLikeScanner >> emptySymbolTokenId [
	^10
]

{ #category : #'generated-tokens' }
PlatypusExpressLikeScanner >> errorTokenId [
	^11
]

{ #category : #'generated-scanner' }
PlatypusExpressLikeScanner >> scanForToken [
	self step.
	(currentCharacter <= $> or: 
			[(currentCharacter between: $A and: $[) 
				or: [currentCharacter == $] or: [currentCharacter >= $_]]]) 
		ifTrue: [^self recordAndReportMatch: #(4)].
	currentCharacter == $? ifTrue: [^self recordAndReportMatch: #(3 4)].
	currentCharacter == $@ ifTrue: [^self recordAndReportMatch: #(1 4)].
	currentCharacter == $\ 
		ifTrue: 
			[self recordMatch: #(4).
			self step.
			^self recordAndReportMatch: #(5)].
	currentCharacter == $^ ifTrue: [^self recordAndReportMatch: #(2 4)].
	^self reportLastMatch
]
