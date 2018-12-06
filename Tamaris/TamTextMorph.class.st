Class {
	#name : #TamTextMorph,
	#superclass : #PluggableTextMorph,
	#category : #'Tamaris-Tools'
}

{ #category : #'model access' }
TamTextMorph >> getText [
	"Retrieve the current model text"
	model ifNotNil: [^ super getText].
	^ '' asText
]

{ #category : #updating }
TamTextMorph >> hasUnacceptedEdits: aBoolean [ 
	| oldHasUnacceptedEdits |
	oldHasUnacceptedEdits := hasUnacceptedEdits.
	super hasUnacceptedEdits: aBoolean.
	aBoolean == oldHasUnacceptedEdits
		ifFalse: [self changed: #hasUnacceptedEdits:]
]

{ #category : #initialization }
TamTextMorph >> initialize [
	super initialize.
	self color: Color white
]

{ #category : #'error handling' }
TamTextMorph >> notify: errorMessage at: location [ 
	| repl |
	self selectFrom: location to: location - 1.
	self scrollSelectionIntoView.
	repl := Text string: errorMessage , '->' attribute: TextEmphasis bold.
	self replaceSelectionWith: repl.
	self 
		setSelection: (location to: location + errorMessage size + 1).

]
