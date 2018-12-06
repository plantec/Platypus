"
I am a kind of Model that includes a piece of text.  In some cases, the text can be edited, and in some the text is a method.

Categories 'code pane menu' and 'message list menu' are messages that may be called by my menus when the text is a method, and when some pane is a list of methods.  Other of my subclasses may ignore these two catagories altogether.
"
Class {
	#name : #StringHolderFromPharo4,
	#superclass : #Model,
	#instVars : [
		'contents'
	],
	#category : #'Tamaris-UI'
}

{ #category : #'instance creation' }
StringHolderFromPharo4 class >> open [
	^self new openLabel: 'Edit'
]

{ #category : #'instance creation' }
StringHolderFromPharo4 class >> openLabel: aString [

	^self new openLabel: aString
]

{ #category : #'window color' }
StringHolderFromPharo4 class >> patchworkUIThemeColor [
	"Answer a default color for UI themes that make use of different colors for Browser, MessageList etc..."

	^ Color lightYellow 
]

{ #category : #themes }
StringHolderFromPharo4 class >> theme [
	"Answer the ui theme that provides controls."

	^ Smalltalk ui theme
]

{ #category : #accessing }
StringHolderFromPharo4 >> acceptContents: aString [ 
	"Set aString to be the contents of the receiver.  Return true cuz happy"

	self contents: aString.
	^ true
]

{ #category : #'initialize-release' }
StringHolderFromPharo4 >> buildTextMorph [

	^PluggableTextMorph 
			on: self 
			text: #contents 
			accept: #acceptContents:
			readSelection: nil 
			menu: #codePaneMenu:shifted:
			
]

{ #category : #accessing }
StringHolderFromPharo4 >> classCommentIndicated [
	"Answer true iff we're viewing the class comment."
	^false
]

{ #category : #'user edits' }
StringHolderFromPharo4 >> clearUserEditFlag [
	"Clear the hasUnacceptedEdits flag in all my dependent views."

	self changed: #clearUserEdits
]

{ #category : #'code pane menu' }
StringHolderFromPharo4 >> codePaneMenu: aMenu shifted: shifted [ 
	"Note that unless we override perform:orSendTo:, 
	PluggableTextController will respond to all menu items in a 
	text pane"
	| donorMenu |
	donorMenu := shifted
		ifTrue: [SmalltalkEditor shiftedYellowButtonMenu]
		ifFalse: [SmalltalkEditor yellowButtonMenu].
	^ aMenu addAllFrom: donorMenu
]

{ #category : #accessing }
StringHolderFromPharo4 >> codeTextMorph [
	^ self dependents
		detect: [:dep | (dep isKindOf: PluggableTextMorph)
				and: [dep getTextSelector == #contents]]
		ifNone: []
]

{ #category : #accessing }
StringHolderFromPharo4 >> contents [
	"Answer the contents that the receiver is holding--presumably a string."

	^contents
]

{ #category : #accessing }
StringHolderFromPharo4 >> contents: textOrString [ 
	"Set textOrString to be the contents of the receiver."

	contents := textOrString "asString"
]

{ #category : #accessing }
StringHolderFromPharo4 >> contentsSelection [
	"Return the interval of text in the code pane to select when I set the pane's contents"

	^ 1 to: 0  "null selection"
]

{ #category : #initialization }
StringHolderFromPharo4 >> defaultContents [

	^''
]

{ #category : #evaluation }
StringHolderFromPharo4 >> doItContext [
	"Answer the context in which a text selection can be evaluated."

	^nil
]

{ #category : #evaluation }
StringHolderFromPharo4 >> doItReceiver [
	"Answer the object that should be informed of the result of evaluating a 
	text selection."

	^nil
]

{ #category : #'initialize-release' }
StringHolderFromPharo4 >> embeddedInMorphicWindowLabeled: labelString [

	^self embeddedInMorphicWindowLabeled: labelString wrap: true
]

{ #category : #'initialize-release' }
StringHolderFromPharo4 >> embeddedInMorphicWindowLabeled: labelString wrap: aBoolean [
	| window |
	window :=  (SystemWindow labelled: labelString) model: self.
	window 
		addMorph: (self buildTextMorph wrapFlag: aBoolean)
		frame: (0@0 corner: 1@1).
	^ window
]

{ #category : #initialization }
StringHolderFromPharo4 >> initialize [
	"Initialize the state of the receiver with its default contents."

	super initialize.
	contents := self defaultContents.

]

{ #category : #'user edits' }
StringHolderFromPharo4 >> okToChange [

	self canDiscardEdits ifTrue: [^ true].
	self changed: #wantToChange.  "Solicit cancel from view"
	^ self canDiscardEdits

]

{ #category : #'initialize-release' }
StringHolderFromPharo4 >> openLabel: labelString [ 
	"Create a standard system view of the model, me, a StringHolder and open it.  If in mvc, terminate the active controller so that the new window will immediately be activated."
	^(self embeddedInMorphicWindowLabeled: labelString) openInWorld
]

{ #category : #'initialize-release' }
StringHolderFromPharo4 >> openLabel: aString wrap: aBoolean [

	"Create a standard system view of the model, me, a StringHolder and open it."
	(self embeddedInMorphicWindowLabeled: aString wrap: aBoolean) openInWorld
]

{ #category : #accessing }
StringHolderFromPharo4 >> reformulateList [
	"If the receiver has a way of reformulating its message list, here is a chance for it to do so"
]

{ #category : #accessing }
StringHolderFromPharo4 >> selectedClassName [
	"I may know what class is currently selected"

	self selectedClass ifNotNil: [^ self selectedClass name].
	^ nil
]

{ #category : #accessing }
StringHolderFromPharo4 >> selectedClassOrMetaClass [

	^ self selectedClass	"I don't know any better"
]

{ #category : #accessing }
StringHolderFromPharo4 >> selectedMessageName [

	^ nil
]

{ #category : #accessing }
StringHolderFromPharo4 >> textContents: aStringOrText [ 
	"Set aStringOrText to be the contents of the receiver."

	contents := aStringOrText
]
