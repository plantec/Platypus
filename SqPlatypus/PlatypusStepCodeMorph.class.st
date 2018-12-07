Class {
	#name : #PlatypusStepCodeMorph,
	#superclass : #TamTextMorph,
	#category : #'SqPlatypus-HW-System-Text'
}

{ #category : #accessing }
PlatypusStepCodeMorph >> accessibleSchemata [
	^ self sourceHandler accessibleSchemata

]

{ #category : #'as yet unclassified' }
PlatypusStepCodeMorph >> notify: aString [
	Transcript show: aString, String cr
]

{ #category : #private }
PlatypusStepCodeMorph >> querySymbol [
	| ed caret |
	ed := self textMorph editor.
	ed editingState forceReplaceAtEnd.
	ed querySymbol: nil 
]

{ #category : #accessing }
PlatypusStepCodeMorph >> replacementFor: aString [
	^ self model replacementFor: aString
]

{ #category : #accessing }
PlatypusStepCodeMorph >> schemaInstance [
	^ self sourceHandler schemaInstance
]

{ #category : #accessing }
PlatypusStepCodeMorph >> schemata [
	^ self sourceHandler schemata
]

{ #category : #accessing }
PlatypusStepCodeMorph >> sourceHandler [
	^ self model sourceHandler
]

{ #category : #private }
PlatypusStepCodeMorph >> textMorphClass [
	"Answer the class used to create the receiver's textMorph"
	
	^PlatypusTextMorphForEditView 
]
