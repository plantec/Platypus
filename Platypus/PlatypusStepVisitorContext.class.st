Class {
	#name : #PlatypusStepVisitorContext,
	#superclass : #Object,
	#instVars : [
		'contextInstance'
	],
	#category : #'Platypus-HW-visitors'
}

{ #category : #'instance creation' }
PlatypusStepVisitorContext class >> contextInstance: anPltDictionaryInstance [ 
	^ self new contextInstance: anPltDictionaryInstance

]

{ #category : #accessing }
PlatypusStepVisitorContext >> asString [
	^ contextInstance asString
]

{ #category : #accessing }
PlatypusStepVisitorContext >> contextInstance [
	^ contextInstance
]

{ #category : #accessing }
PlatypusStepVisitorContext >> contextInstance: anObject [ 
	contextInstance := anObject
]

{ #category : #'initialize/release' }
PlatypusStepVisitorContext >> destroy [
	contextInstance := nil.
	super destroy
]

{ #category : #searching }
PlatypusStepVisitorContext >> lookUpIdentifierBN: anIdent [ 
	^ self contextInstance lookUpIdentifierBN: anIdent
]

{ #category : #searching }
PlatypusStepVisitorContext >> lookUpNamedTypeBN: anIdent [ 
	^ self contextInstance lookUpNamedTypeBN: anIdent
]

{ #category : #accessing }
PlatypusStepVisitorContext >> printString [
	| res |
	res := WriteStream on: (String new: 40).
	contextInstance inclusiveOwnerPath do: [:own | res nextPutAll: own name] separatedBy: [res nextPut:$.].
	^ res contents
]
