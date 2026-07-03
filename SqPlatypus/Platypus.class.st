Class {
	#name : #Platypus,
	#superclass : #Tamaris,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #'world menu' }
Platypus class >> menuCommandOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Platypus)
		parent: #Tools;
		action: [ self open ];
		icon: (self iconNamed: self taskbarIconName)
]
