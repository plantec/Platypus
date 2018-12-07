Class {
	#name : #PlatypusExpressSubListReference,
	#superclass : #TamSubListReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #updating }
PlatypusExpressSubListReference >> cleanAllEvaluations [
	self children
		do: [:chl | chl  cleanAllEvaluations].
	self linked ~= self 
		ifTrue: [ self linked cleanAllEvaluations]
]

{ #category : #accessing }
PlatypusExpressSubListReference >> codeHolderClassName [ ^ #PlatypusExpressCodeHolder 
]

{ #category : #testing }
PlatypusExpressSubListReference >> isSchemaReference [
	^ false
]

{ #category : #menus }
PlatypusExpressSubListReference >> keyStroke: aCharacter from: aListMorph [ super keyStroke: aCharacter from: aListMorph . aCharacter = $p ifTrue: [ ^ self menuCodePane ] 
]

{ #category : #accessing }
PlatypusExpressSubListReference >> startLevel [
	^ 1
]

{ #category : #accessing }
PlatypusExpressSubListReference >> tokenList [
	| tl |
	tl := PlatypusTokenList new.
	self children do: 
			[:hlsr | 
			tl addFrom: (hlsr tokenList beginningOfLineFrom: hlsr startNode)
				to: hlsr stopNode.
			tl add: PlatypusEolToken new.
			tl add: PlatypusEolToken new].
	^ tl
]
