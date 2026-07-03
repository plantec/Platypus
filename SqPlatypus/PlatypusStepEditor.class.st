Class {
	#name : #PlatypusStepEditor,
	#superclass : #RubTextEditor,
	#category : #'SqPlatypus-HW-System-Text'
}

{ #category : #accessing }
PlatypusStepEditor >> editingStateClass [
	^ PlatypusEditingState
]

{ #category : #accessing }
PlatypusStepEditor >> schemaInstance [
	^ self model schemaInstance
]

{ #category : #'new selection' }
PlatypusStepEditor >> selectPrecedingIdentifier [
	"Invisibly select the identifier that ends at the end of the selection, if any."

	| string sep stop tok |
	tok := false.
	string := self string.
	stop := self stopIndex - 1.
	[stop > 0 and: [(string at: stop) isSeparator]] whileTrue: [stop := stop - 1].
	sep := stop.
	[sep > 0 and: [(string at: sep) tokenish]] whileTrue: [tok := true. sep := sep - 1].
	tok ifTrue: [self selectInvisiblyFrom: sep + 1 to: stop]
]
