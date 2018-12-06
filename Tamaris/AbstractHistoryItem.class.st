"
I am abstract item class for AbstractHistoryList.
See BrowserHistoryItem as a good example of concrete item implementation
"
Class {
	#name : #AbstractHistoryItem,
	#superclass : #Object,
	#category : #'Tamaris-Browser-History'
}

{ #category : #testing }
AbstractHistoryItem >> isValidFromModel: aModel [ 
	"only model can say if i'm a valid item"
	^ true
]

{ #category : #'model updating' }
AbstractHistoryItem >> updateModel: aModel [ 
	"model knows what to do with me"
	self subclassResponsibility
]
