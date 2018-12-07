Class {
	#name : #PlatypusComplexInstance,
	#superclass : #Object,
	#instVars : [
		'records'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #'instance creation' }
PlatypusComplexInstance class >> fromRecords: aListOfRecords [
	^ self new addAllRecords: aListOfRecords
]

{ #category : #operator }
PlatypusComplexInstance >> \ aClassSymbol [ 
	| classif groupClass res resRecords curr selector o |
	groupClass := PlatypusPharoSmalltalk at: aClassSymbol.
	(classif := records
				detect: [:rec | rec isKindOf: groupClass]
				ifNone: [])
		ifNil: [self error: 'invalid group: ' , aClassSymbol].
	res := self class new.
	resRecords := OrderedCollection new.
	curr := classif class.
	[curr == Object
		or: [curr name == aClassSymbol]]
		whileFalse: [curr := curr superclass].
	[curr class includesSelector: #schemaDefinition]
		whileTrue: [selector := PlatypusNamesBuilder new localCopyMethodNameFromEntity: curr platypusMetaData.
			o := curr new.
			classif perform: selector asSymbol with: o.
			resRecords add: o.
			curr := curr superclass].
	res records: resRecords.
	^ res
]

{ #category : #'private adding' }
PlatypusComplexInstance >> add: anObject [
	self records add: anObject
]

{ #category : #adding }
PlatypusComplexInstance >> addAllRecords: aListOfRecords [
	aListOfRecords do: [ :rec | self addRecord: rec] 

]

{ #category : #adding }
PlatypusComplexInstance >> addRecord: aRecord [ 
	aRecord pltAddIntoComplexeInstance: self.
]

{ #category : #converting }
PlatypusComplexInstance >> asPlatypusComplexInstance [
	^ self
]

{ #category : #'message handling' }
PlatypusComplexInstance >> doesNotUnderstand: aMessage [ 
	| found args newMessage wrappedSelector |
	(found := self records reversed detect: [:rec | rec respondsTo: aMessage selector]
				ifNone: [^ super doesNotUnderstand: aMessage]) ifNotNil: 
				[wrappedSelector := (aMessage selector , 'receiver:') asSymbol.
				(found respondsTo: wrappedSelector) 
					ifTrue: 
						[args := Array new: aMessage arguments size + 1.
						1 to: aMessage arguments size
							do: [:pos | args at: pos put: (aMessage arguments at: pos)].
						args at: aMessage arguments size + 1 put: self.
						newMessage := Message selector: wrappedSelector asSymbol arguments: args.
						^ newMessage sendTo: found]
					ifFalse: 
						[aMessage arguments ifEmpty: 
								[args := Array with: nil.
								wrappedSelector := (aMessage selector , 'UsingContext:') asSymbol.
								newMessage := Message selector: wrappedSelector asSymbol arguments: args.
								^ newMessage sendTo: self].
						^ aMessage sendTo: found]]
]

{ #category : #'initialize-release' }
PlatypusComplexInstance >> initialize [
	super initialize.
	records := OrderedCollection new.
]

{ #category : #'class membership' }
PlatypusComplexInstance >> isKindOf:  aClass [ 
	(super isKindOf:  aClass ) ifTrue: [^true].
	self records do: [:rec | (rec isKindOf: aClass) ifTrue: [^true]].
	^ false
]

{ #category : #'message handling' }
PlatypusComplexInstance >> name [
	^ self doesNotUnderstand: (Message selector: #name)
]

{ #category : #adding }
PlatypusComplexInstance >> pltAddIntoComplexeInstance: aComplexInstance [ 
	aComplexInstance addAllRecords: records.
]

{ #category : #converting }
PlatypusComplexInstance >> pltAsObject [
	records size = 1
		ifTrue: [^ records first].
	^ self
]

{ #category : #'private adding' }
PlatypusComplexInstance >> privateAddRecord: aRecord [ 
	| classif |
	(classif := self records detect: [:r | r isKindOf: aRecord class]
				ifNone: []) ifNil: 
				[(classif := self records detect: [:r | aRecord isKindOf: r class]
							ifNone: []) ifNotNil: 
							[self remove: classif.
							classif pltLocalCopyTo: aRecord].
				self add: aRecord]
			ifNotNil: [aRecord pltLocalCopyTo: classif]
]

{ #category : #'private accessing' }
PlatypusComplexInstance >> records [
	^records
]

{ #category : #'private accessing' }
PlatypusComplexInstance >> records: anObject [
	records := anObject
]

{ #category : #'private accessing' }
PlatypusComplexInstance >> remove: anObject [ 
	self records remove: anObject
]
