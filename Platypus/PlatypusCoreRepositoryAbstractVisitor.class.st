Class {
	#name : #PlatypusCoreRepositoryAbstractVisitor,
	#superclass : #Object,
	#instVars : [
		'folder',
		'actionMethodsIndex'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #'instance creation' }
PlatypusCoreRepositoryAbstractVisitor class >> folder: aDataFolder [
	^ self new folder:  aDataFolder
]

{ #category : #accessing }
PlatypusCoreRepositoryAbstractVisitor >> actionMethodsIndex [
	^ actionMethodsIndex
]

{ #category : #accessing }
PlatypusCoreRepositoryAbstractVisitor >> actionMethodsIndex: anIndex [ 
	actionMethodsIndex := anIndex
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doAggregation: a [ 
	self subclassResponsibility
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doBoolean: b [
	self subclassResponsibility
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doEnumeration: e [ 
		self subclassResponsibility
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doExternalRepresentation: inst [ 
	self subclassResponsibility
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doFolder [
self subclassResponsibility 
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doInstance: inst [ 
	(inst isKindOf: PlatypusComplexInstance)
		ifTrue: [self doExternalRepresentation: inst]
		ifFalse: [self doInternalRepresentation: inst]
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doInstanceRef: i [ 
		self subclassResponsibility
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doInternalRepresentation: inst [ 
	self subclassResponsibility
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doLogical: l [ 
		self subclassResponsibility
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doNullValue [
	self subclassResponsibility
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doNumber: n [ 
	self subclassResponsibility
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doObject: b [ 
	self subclassResponsibility
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doSingleToken: t [ 
	self push: OrderedCollection new.
	self doToken: t.
	^ self pop first
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doString: s [ 
		self subclassResponsibility
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryAbstractVisitor >> doToken: t [ 
	t isNil
		ifTrue: [self doNullValue: nil]
		ifFalse: [self actionMethodsIndex
				do: [:a | (t isKindOf: a key)
						ifTrue: [self perform: a value with: t.
							^ a key]]].
	^ nil
]

{ #category : #accessing }
PlatypusCoreRepositoryAbstractVisitor >> folder: aDataFolder [
	folder := aDataFolder
]

{ #category : #'initialize/release' }
PlatypusCoreRepositoryAbstractVisitor >> initialize [
	super initialize.
	self actionMethodsIndex: OrderedCollection new.
	self actionMethodsIndex
		add: (Association key: Symbol value: #doEnumeration:).
	self actionMethodsIndex
		add: (Association key: String value: #doString:).
	self actionMethodsIndex
		add: (Association key: Boolean value: #doLogical:).
	self actionMethodsIndex
		add: (Association key: Number value: #doNumber:).
	self actionMethodsIndex
		add: (Association key: UndefinedObject value: #doNullValue:).
	self actionMethodsIndex
		add: (Association key: Collection value: #doAggregation:).
	self actionMethodsIndex
		add: (Association key: Object value: #doObject:)
]

{ #category : #accessing }
PlatypusCoreRepositoryAbstractVisitor >> oidOf: anInstance [ 
	^folder ifNil: [-1] ifNotNil: [folder oidOf: anInstance]
]
