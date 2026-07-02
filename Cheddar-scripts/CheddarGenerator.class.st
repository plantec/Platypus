Class {
	#name : #CheddarGenerator,
	#superclass : #Object,
	#category : #'Cheddar-scripts'
}

{ #category : #platypus2Cheddar }
CheddarGenerator class >> generate [
	self generateInto: 'generated-code'
]

{ #category : #platypus2Cheddar }
CheddarGenerator class >> generateInto: aPathString [
	Cursor wait
		showWhile: [ 
			| map exp2Chd |
			map := Platypus itemNamed: 'cheddar_mapping'.
			exp2Chd := Platypus itemNamed: 'express2cheddar'.
			exp2Chd removeAllModelContents.
			exp2Chd promote: map.
			Cursor wait
				showWhile: [ 
					ExChdGenerateAllIntoProcedure 
						invokeOnContextStream: exp2Chd masterModelAsStepStream 
						fromValues: {aPathString} ] ]
]
