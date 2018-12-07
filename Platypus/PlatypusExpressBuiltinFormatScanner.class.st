Class {
	#name : #PlatypusExpressBuiltinFormatScanner,
	#superclass : #SmaCCScanner,
	#category : #'Platypus-HW-parsers'
}

{ #category : #generated }
PlatypusExpressBuiltinFormatScanner >> emptySymbolTokenId [
	^ 26
]

{ #category : #generated }
PlatypusExpressBuiltinFormatScanner >> errorTokenId [
	^ 27
]

{ #category : #generated }
PlatypusExpressBuiltinFormatScanner >> scanForToken [
	self step.
	currentCharacter = $#
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter = $-
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter = $.
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter = $E
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter = $F
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter = $I
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(11).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(12).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
PlatypusExpressBuiltinFormatScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil #whitespace)
]
