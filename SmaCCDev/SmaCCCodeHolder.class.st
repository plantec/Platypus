Class {
	#name : #SmaCCCodeHolder,
	#superclass : #StringHolder,
	#instVars : [
		'contentsMorph',
		'owner',
		'ownerAcceptSelector'
	],
	#category : #'SmaCCDev-UI'
}

{ #category : #'instance creation' }
SmaCCCodeHolder class >> owner: aSmaCCParserGenerator [ 
	^ self owner: aSmaCCParserGenerator ownerAcceptSelector: nil
]

{ #category : #'instance creation' }
SmaCCCodeHolder class >> owner: aSmaCCParserGenerator ownerAcceptSelector: aSymbol [ 
	^ self new owner: aSmaCCParserGenerator ownerAcceptSelector: aSymbol 
]

{ #category : #menus }
SmaCCCodeHolder >> contents: aStringOrText notifying: aRequestor [ 
	| result |
	self ownerAcceptSelector notNil ifTrue: [result := (self owner
			perform: self ownerAcceptSelector
			with: aStringOrText
			with: aRequestor)] ifFalse: [result := true].
		result ifTrue: [self acceptContents: aStringOrText.
			^ true].
	^ false
]

{ #category : #menus }
SmaCCCodeHolder >> contentsMenu: aMenu shifted: shifted [ 
	"Note that unless we override perform:orSendTo:,  
	PluggableTextController will respond to all menu items in a text pane"
	| selections labelsString linesArray |
	selections := #(#menuFind #findAgain #setSearchString #again #undo #copySelection #cut #paste #pasteRecent #accept #cancel #saveContentsInFile #sendContentsToPrinter #printerSetup #readContentsFromFile ).
	labelsString := 'find...(f)\find again (g)\set search string (h)\do again (j)\undo (z)\copy (c)\cut (x)\paste (v)\paste...\accept (s)\cancel (l)\save contents to file...\send contents to printer\printer setup\read contents from file...' withCRs.
	linesArray := #(3 5 9 11 14).
	^ aMenu
		labels: labelsString
		lines: linesArray
		selections: selections
]

{ #category : #accessing }
SmaCCCodeHolder >> contentsMorph [
   contentsMorph isNil
       ifTrue: [
           contentsMorph := RubPluggableTextMorph
                       on: self
                       text: #contents
                       accept: #contents:notifying:
                       readSelection: nil
                       menu: #contentsMenu:shifted:].
   ^ contentsMorph

]

{ #category : #'edit flag' }
SmaCCCodeHolder >> hasUnacceptedEdits [
	^ self contentsMorph hasUnacceptedEdits
]

{ #category : #'edit flag' }
SmaCCCodeHolder >> hasUnacceptedEdits: aBoolean [ 
	^ self contentsMorph hasUnacceptedEdits: aBoolean
]

{ #category : #'edit flag' }
SmaCCCodeHolder >> okToChange [
	^ super okToChange
]

{ #category : #accessing }
SmaCCCodeHolder >> owner [
	^owner
]

{ #category : #accessing }
SmaCCCodeHolder >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
SmaCCCodeHolder >> owner: aSmaCCParserGenerator ownerAcceptSelector: aSymbol [ 
	self owner: aSmaCCParserGenerator.
	self ownerAcceptSelector: aSymbol.

]

{ #category : #accessing }
SmaCCCodeHolder >> ownerAcceptSelector [
	^ownerAcceptSelector
]

{ #category : #accessing }
SmaCCCodeHolder >> ownerAcceptSelector: anObject [
	ownerAcceptSelector := anObject
]

{ #category : #menus }
SmaCCCodeHolder >> perform: selector orSendTo: otherTarget [ 
	"Selector was just chosen from a menu by a user. If can respond, 
	then perform it on myself. If not, send it to otherTarget,  
	presumably the editPane from which the menu was invoked."
	(self respondsTo: selector)
		ifTrue: [^ self perform: selector]
		ifFalse: [^ otherTarget perform: selector]
]

{ #category : #menus }
SmaCCCodeHolder >> readContentsFromFile [
	| result  |
	(result := UIManager default
			chooseFileMatching: nil 
			label: 'Choose file to open' translated)
		ifNotNil: [
			(FileDirectory default fileExists: result)
				ifFalse: [^ UIManager default inform: ' ' , result , ' doesn''t exists '].
			self acceptContents: (FileStream fileNamed: result) contents. self changed: #contents]
]
