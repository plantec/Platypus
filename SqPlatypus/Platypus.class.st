Class {
	#name : #Platypus,
	#superclass : #Tamaris,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #'as yet unclassified' }
Platypus class >> menuCommandOn: aBuilder [ 
	<worldMenu>  
	(aBuilder item: #'Platypus')
		parent: #Tools;
		action: [self open];  
		icon: self taskbarIcon.  
]
