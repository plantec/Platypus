Class {
	#name : #PlatypusTextMorphForEditView,
	#superclass : #TextMorphForEditView,
	#category : #'SqPlatypus-HW-System-Text'
}

{ #category : #private }
PlatypusTextMorphForEditView >> editorClass [
	"Answer the class used to create the receiver's editor"
	
	^PlatypusStepEditor
]

{ #category : #private }
PlatypusTextMorphForEditView >> replacementFor: aString [
	^ self editView replacementFor: aString
]
