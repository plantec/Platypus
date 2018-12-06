"
A TamStringHolder is a StringHolder for Tamaris.

Instance Variables
	doItContext:		<Object>
	doItReceiver:		<Object>
	textMorph:		<Object>

doItContext
	- xxxxx

doItReceiver
	- xxxxx

textMorph
	- xxxxx


"
Class {
	#name : #TamStringHolder,
	#superclass : #StringHolderFromPharo4,
	#instVars : [
		'doItContext',
		'doItReceiver',
		'textMorph'
	],
	#category : #'Tamaris-UI'
}

{ #category : #accessing }
TamStringHolder >> contents: textOrString [ 
	super contents: textOrString .
	self changed: #contents

]

{ #category : #'initialize-release' }
TamStringHolder >> destroy [
	self doItReceiver: nil.
	super destroy
]

{ #category : #evaluation }
TamStringHolder >> doItContext [	"Answer the context in which a text selection can be evaluated."	^ doItContext
]

{ #category : #accessing }
TamStringHolder >> doItContext: anObject [	doItContext := anObject
]

{ #category : #evaluation }
TamStringHolder >> doItReceiver [	"Answer the object that should be informed of the result of  	evaluating a  	text selection."	^ doItReceiver
]

{ #category : #accessing }
TamStringHolder >> doItReceiver: anObject [	doItReceiver := anObject
]

{ #category : #'initialize-release' }
TamStringHolder >> embeddedInMorphicWindowLabeled: labelString [ 
	| window |	
	window  :=  super embeddedInMorphicWindowLabeled: labelString.	
	textMorph := window findA: PluggableTextMorph.	 
	^ window
]

{ #category : #accessing }
TamStringHolder >> textMorph [	
	^ textMorph
]
