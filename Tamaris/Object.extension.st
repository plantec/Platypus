Extension { #name : 'Object' }

{ #category : '*tamaris-object-freeing' }
Object >> destroy [

]

{ #category : '*tamaris-classification' }
Object >> isTamListItemReference [
	^ false
]

{ #category : '*Tamaris' }
Object >> modelWakeUp [
	"A window with me as model is being entered or expanded.  Default response is no-op"  
]

{ #category : '*Tamaris' }
Object >> modelWakeUpIn: aWindow [
	"A window with me as model is being entered or expanded.  Default response is no-op" 
	self modelWakeUp
]

{ #category : '*tamaris-stepping' }
Object >> step [
]
