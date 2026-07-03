Class {
	#name : 'PlatypusRemarkToken',
	#superclass : 'PlatypusGenericToken',
	#category : 'Platypus-HW-CodeTokens',
	#package : 'Platypus',
	#tag : 'HW-CodeTokens'
}

{ #category : 'visiting' }
PlatypusRemarkToken >> accept: aVisitor [ 
	^ aVisitor acceptRemark: self
]

{ #category : 'testing' }
PlatypusRemarkToken >> isRemark [
	^true
]
