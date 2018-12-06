Class {
	#name : #TamPluggableListMorph,
	#superclass : #PluggableListMorph,
	#category : #'Tamaris-UI'
}

{ #category : #updating }
TamPluggableListMorph >> bounds: newBounds [ 
	super bounds: newBounds.
	(model respondsTo: #boundsOf:updatedWith:) 
		ifTrue: [model boundsOf: self updatedWith: newBounds]
]

{ #category : #'Polymorph-Widgets' }
TamPluggableListMorph >> fillStyleToUse [
	^ self enabled
		ifTrue: [(self theme listNormalFillStyleFor: self) darker]
		ifFalse: [self theme listDisabledFillStyleFor: self]
]
