Class {
	#name : #TamPaneMorphWrapper,
	#superclass : #TamPaneMorph,
	#instVars : [
		'wrapped'
	],
	#category : #'Tamaris-UI'
}

{ #category : #'error handling' }
TamPaneMorphWrapper >> doesNotUnderstand: aMessage [ 
	^ wrapped  perform: aMessage selector withArguments: aMessage arguments

]

{ #category : #accessing }
TamPaneMorphWrapper >> wrapped [
	^wrapped
]

{ #category : #accessing }
TamPaneMorphWrapper >> wrapped: anObject [ 
	| frameImagedMorph |
	wrapped := anObject.
	wrapped
		allMorphsDo: [:sm | sm unlock].
	frameImagedMorph := wrapped submorphs
				detect: [:sm | sm class name asSymbol = #WindowFrameImagedMorph]
				ifNone: [].
	frameImagedMorph
		ifNotNil: [wrapped removeMorph: frameImagedMorph].
	wrapped clipSubmorphs: true.

]
