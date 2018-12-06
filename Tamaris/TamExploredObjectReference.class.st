Class {
	#name : #TamExploredObjectReference,
	#superclass : #TamObjectReference,
	#category : #'Tamaris-Taxonomies'
}

{ #category : #menus }
TamExploredObjectReference class >> canBeCreatedInteractively [
	^ true
]

{ #category : #accessing }
TamExploredObjectReference class >> externalLabel [
	^ 'an explored object'
]

{ #category : #'as yet unclassified' }
TamExploredObjectReference class >> subMenuLabel [
	^ 'an object'
]

{ #category : #'morphic wrapper' }
TamExploredObjectReference >> newEditor [
	^ ObjectExplorer new explorerFor: self itemObject withoutListWrapper
]
