Class {
	#name : 'PlatypusSemicolonToken',
	#superclass : 'PlatypusDelimToken',
	#category : 'Platypus-HW-CodeTokens',
	#package : 'Platypus',
	#tag : 'HW-CodeTokens'
}

{ #category : 'instance creation' }
PlatypusSemicolonToken class >> new [
	^ super new lexicalElement: ';' asSymbol
]

{ #category : 'visiting' }
PlatypusSemicolonToken >> accept: aVisitor [ 
	^ aVisitor acceptSemicolon: self
]

{ #category : 'testing' }
PlatypusSemicolonToken >> isSemicolon [
	^true
]
