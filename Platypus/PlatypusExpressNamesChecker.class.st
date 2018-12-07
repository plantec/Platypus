Class {
	#name : #PlatypusExpressNamesChecker,
	#superclass : #PlatypusExpressChecker,
	#category : #'Platypus-HW-visitors'
}

{ #category : #'visit dictionary schema' }
PlatypusExpressNamesChecker >> acceptContextDefinition: e [ 
	super acceptContextDefinition: e.
	e namedTypesCache
		keysAndValuesDo: [:k :l | l size > 1
				ifTrue: [l
						do: [:m | self
								registerError: (PlatypusExpressNamesCheckerError metaData: m message: ' multiply defined ')]]].
	e identifiersCache
		keysAndValuesDo: [:k :l | l size > 1
				ifTrue: [(l
							allSatisfy: [:el | el isPltEnumerationValue])
						ifFalse: [l
								do: [:m | self
										registerError: (PlatypusExpressNamesCheckerError metaData: m  message: ' multiply defined ')]]]]
]

{ #category : #'visit dictionary schema' }
PlatypusExpressNamesChecker >> acceptSchemaDefinition: e [ 
		self logInfo: 'schema ' , e name.
		super acceptSchemaDefinition: e
]

{ #category : #'visit environment schema' }
PlatypusExpressNamesChecker >> acceptSchemaInstance: e [ 
	| index m |
	index := Dictionary new.
	e schemata
		do: [:sch | 
			m := sch linkedMetaData.
			m isNil ifFalse: [
				index at: m  ifAbsentPut: OrderedCollection new.
				(index at: m ) add: m]].
	index keysAndValuesDo: [:k :l | 
		l size > 1
			ifTrue: [
				self 
					registerError: (PlatypusExpressNamesCheckerError metaData: k message: 'several schemata with the same name ''' , l first key , '''')]].
	e internalSchemata acceptTry: self
]

{ #category : #'visit generic' }
PlatypusExpressNamesChecker >> checks: aMetaData [ 
	self logInfo: 'NAMES CHECKING'.
	aMetaData acceptTry: self.
	self logInfo: 'NAMES CHECKING DONE'
]
