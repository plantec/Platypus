Class {
	#name : #TamListItemReferenceUtil,
	#superclass : #Object,
	#category : #'Tamaris-Taxonomies'
}

{ #category : #subwindow }
TamListItemReferenceUtil class >> subFrameBorderDelta [
	^ 4
]

{ #category : #subwindow }
TamListItemReferenceUtil class >> subWindowClass [
	^ TamPaneMorph
]

{ #category : #subwindow }
TamListItemReferenceUtil class >> windowWrapperClass [
	^ TamPaneMorphWrapper
]
