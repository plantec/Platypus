Class {
	#name : #PlatypusSchemaLinkReference,
	#superclass : #PlatypusExpressLinkReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #testing }
PlatypusSchemaLinkReference >> canBeMovedDown [ "true if self can be moved up (in my owner children
	collection) "^ self isMoveable and: [ self owner subReferences size > 1 and: [ ( self owner subReferences indexOf: self ) < self owner subReferences size ] ] 
]

{ #category : #testing }
PlatypusSchemaLinkReference >> canBeMovedUp [ "true if self can be moved up (in my owner children
	collection)"^ self isMoveable and: [ owner subReferences size > 1 and: [ ( self owner subReferences indexOf: self ) > 1 ] ] 
]

{ #category : #accessing }
PlatypusSchemaLinkReference >> contents [ 
	^ self linked contents 
]

{ #category : #accessing }
PlatypusSchemaLinkReference >> emphasisModel [ 
	^ self linked emphasisModel 
]

{ #category : #testing }
PlatypusSchemaLinkReference >> isLinkTo: anItem [ 
	^ self linked linked = anItem linked 
]

{ #category : #testing }
PlatypusSchemaLinkReference >> isMoveable [ 
	^ true 
]

{ #category : #testing }
PlatypusSchemaLinkReference >> isPlatypusPrimitiveSchema [ 
	^ self linked notNil and: [ self linked isPlatypusPrimitiveSchema ] 
]

{ #category : #updating }
PlatypusSchemaLinkReference >> moveDown [ 
	^ self owner moveDownSchemaReference: self 
]

{ #category : #updating }
PlatypusSchemaLinkReference >> moveUp [ 
	^ self owner moveUpSchemaReference: self 
]
