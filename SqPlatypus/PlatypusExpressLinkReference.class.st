Class {
	#name : #PlatypusExpressLinkReference,
	#superclass : #TamListItemHardLinkReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #updating }
PlatypusExpressLinkReference >> cleanAllEvaluations [

]

{ #category : #checking }
PlatypusExpressLinkReference >> doInternalChecking [
	self assert: self metaData notNil.
	self assert: self metaData tamarisItemRef notNil.
	self metaData tamarisItemRef doInternalChecking
]

{ #category : #accessing }
PlatypusExpressLinkReference >> findExpressReferenceDeeplySuchThat: aBlock [ 
	^ self linked findExpressReferenceDeeplySuchThat: aBlock 
]

{ #category : #accessing }
PlatypusExpressLinkReference >> metaData [ ^ self linked metaData 
]

{ #category : #enumerating }
PlatypusExpressLinkReference >> recursivelyDo: aBlock [
	 
]
