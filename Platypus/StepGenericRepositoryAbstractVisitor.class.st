Class {
	#name : #StepGenericRepositoryAbstractVisitor,
	#superclass : #StepCoreObject,
	#instVars : [
		'folder',
		'actionMethodsIndex'
	],
	#category : #'Platypus-STEP-core'
}

{ #category : #'instance creation' }
StepGenericRepositoryAbstractVisitor class >> folder: aDataFolder [
	^ self new folder:  aDataFolder
]

{ #category : #accessing }
StepGenericRepositoryAbstractVisitor >> actionMethodsIndex [
	^ actionMethodsIndex
]

{ #category : #accessing }
StepGenericRepositoryAbstractVisitor >> actionMethodsIndex: anIndex [ 
	actionMethodsIndex := anIndex
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doAggregation: a [ 
	self subclassResponsibility
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doBoolean: b [
	self subclassResponsibility
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doEnumeration: e [ 
		self subclassResponsibility
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doExternalRepresentation: inst [ 
	self subclassResponsibility
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doFolder [
	self subclassResponsibility 
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doInstance: inst [ 
	self subclassResponsibility 
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doInstanceRef: i [ 
		self subclassResponsibility
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doInternalRepresentation: inst [ 
	self subclassResponsibility
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doLogical: l [ 
		self subclassResponsibility
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doNullValue [
	self subclassResponsibility
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doNumber: n [ 
	self subclassResponsibility
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doObject: b [ 
	self error: 'Unknown data kind'
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doRedefinedValue: e [ 
	self subclassResponsibility
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doSingleToken: t [ 
	self push: OrderedCollection new.
	self doToken: t.
	^ self pop first
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doString: s [ 
		self subclassResponsibility
]

{ #category : #'data encoding' }
StepGenericRepositoryAbstractVisitor >> doToken: t [ 
	(t = $$ or: [t isNil])
		ifTrue: [self doNullValue: nil]
		ifFalse: [self actionMethodsIndex
				do: [:a | (t isKindOf: a key)
						ifTrue: [self perform: a value with: t.
							^ a key]]].
	^ nil
]

{ #category : #accessing }
StepGenericRepositoryAbstractVisitor >> folder: aDataFolder [
	folder := aDataFolder
]

{ #category : #'initialize/release' }
StepGenericRepositoryAbstractVisitor >> initialize [
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
		add: (Association key: StepInternalRepresentation value: #doInternalRepresentation:).
	self actionMethodsIndex
		add: (Association key: StepSimpleRecord value: #doSimpleRecord:).
	self actionMethodsIndex
		add: (Association key: StepExternalRepresentation value: #doExternalRepresentation:).
	self actionMethodsIndex
		add: (Association key: StepInstanceReference value: #doInstanceRef:).
	self actionMethodsIndex
		add: (Association key: StepRedefinedValue value: #doRedefinedValue:).
	self actionMethodsIndex
		add: (Association key: Object value: #doObject:)
]

{ #category : #accessing }
StepGenericRepositoryAbstractVisitor >> oidOf: anInstance [ 
	^folder ifNil: [-1] ifNotNil: [folder oidOf: anInstance]
]
