Class {
	#name : #TamHierarchicalList,
	#superclass : #Model,
	#instVars : [
		'currentSelection'
	],
	#category : #'Tamaris-UI'
}

{ #category : #'as yet unclassified' }
TamHierarchicalList >> genericMenu: aMenu [

	aMenu add: 'no menu yet' target: self selector: #yourself.
	^aMenu
]

{ #category : #'as yet unclassified' }
TamHierarchicalList >> getCurrentSelection [

	^currentSelection
]

{ #category : #'as yet unclassified' }
TamHierarchicalList >> noteNewSelection: x [

	currentSelection := x.
	self changed: #getCurrentSelection.
	currentSelection ifNil: [^self].
	(currentSelection respondsTo: #sendSettingMessageTo:)
		ifTrue: [currentSelection sendSettingMessageTo: self].

]

{ #category : #'as yet unclassified' }
TamHierarchicalList >> perform: selector orSendTo: otherTarget [
	"Selector was just chosen from a menu by a user.  If can respond, then
perform it on myself. If not, send it to otherTarget, presumably the
editPane from which the menu was invoked."

	(self respondsTo: selector)
		ifTrue: [^ self perform: selector]
		ifFalse: [^ otherTarget perform: selector]
]

{ #category : #'as yet unclassified' }
TamHierarchicalList >> update: aSymbol [

	aSymbol == #hierarchicalList ifTrue: [
		^self changed: #getList
	].
	super update: aSymbol
]
