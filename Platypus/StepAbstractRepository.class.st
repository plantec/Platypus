Class {
	#name : #StepAbstractRepository,
	#superclass : #StepCoreObject,
	#instVars : [
		'instanceByOidIndex',
		'oidByInstanceIndex'
	],
	#category : #'Platypus-STEP-core'
}

{ #category : #'instances accessing' }
StepAbstractRepository >> allInstancesOf: aClass [ 
	| instances |
	instances := OrderedCollection new.
	self allInstancesOf: aClass do: [:folder :inst| instances add: inst].
	^ instances

]

{ #category : #'instances accessing' }
StepAbstractRepository >> allInstancesOf: aClass do: aBlock [ 
	^ self instancesDo:
		[:inst | (inst isKindOf: aClass)
				ifTrue: [aBlock value: self value: inst]]
]

{ #category : #checking }
StepAbstractRepository >> checksExternalInstance: instance [ 
	"no checking by default, subclasses could do it"
	^ #()
]

{ #category : #checking }
StepAbstractRepository >> checksInstances [
	| errors |
	errors := OrderedCollection new.
	self instancesDo:
		[:inst | errors
				addAll: (self checksInstance: inst)].
	^ errors
]

{ #category : #checking }
StepAbstractRepository >> checksInternalInstance: instance [ 
	"no checking by default, subclasses could do it"
	^ #()
]

{ #category : #copying }
StepAbstractRepository >> copy [
	^ self error: 'A repository can''t be copied'
]

{ #category : #accessing }
StepAbstractRepository >> dataParserClass [
	^ self subclassResponsibility 
]

{ #category : #copying }
StepAbstractRepository >> deepCopy [
	^ self copy
]

{ #category : #'initialize/release' }
StepAbstractRepository >> destroy [
	instanceByOidIndex := nil.
	oidByInstanceIndex := nil.
	super destroy
]

{ #category : #'initialize/release' }
StepAbstractRepository >> finalize [
	Transcript show: 'a ' , self class name , ' is finalized' , String cr.
	self destroy
]

{ #category : #'initialize/release' }
StepAbstractRepository >> initialize [
	super initialize.
	instanceByOidIndex := Dictionary new.
	oidByInstanceIndex := IdentityDictionary new.

]

{ #category : #'instances accessing' }
StepAbstractRepository >> instanceAt: id [ 
	^ instanceByOidIndex
		at: id 
		ifAbsent: []
]

{ #category : #'instances accessing' }
StepAbstractRepository >> instanceLabelled: id [ 
	^ instanceByOidIndex
		at: id 
		ifAbsent: []
]

{ #category : #accessing }
StepAbstractRepository >> instances [
	^ oidByInstanceIndex keys
]

{ #category : #accessing }
StepAbstractRepository >> instancesDo: aBlock [ 
	instanceByOidIndex
		do: [ :v | aBlock value: v]
]

{ #category : #testing }
StepAbstractRepository >> oidExists: id [ 
	^ (self instanceAt: id) notNil
]

{ #category : #'instances accessing' }
StepAbstractRepository >> oidOf: anInstance [ 
	^oidByInstanceIndex at: anInstance
		ifAbsent: [self oidOf: (self registerInstance: anInstance)]
]

{ #category : #'file in/out' }
StepAbstractRepository >> parseStream: in [ 
	^ self subclassResponsibility
]

{ #category : #'instance registering' }
StepAbstractRepository >> registerHeaderInstance: headerInst [ 
	
]

{ #category : #'instance registering' }
StepAbstractRepository >> registerInstance: appInst [  	
	^self registerInstance: appInst withId: oidByInstanceIndex size + 1
]

{ #category : #'instance registering' }
StepAbstractRepository >> registerInstance: appInst withId: id [ 
	oidByInstanceIndex at: appInst
		ifAbsent: 
			[instanceByOidIndex at: id put: appInst.
			oidByInstanceIndex at: appInst put: id].
	^appInst
]

{ #category : #'instance registering' }
StepAbstractRepository >> replace: oldInst with: newInst [
	| oldOid |
	oldOid := oidByInstanceIndex at: oldInst.
	self unregisterInstance: oldInst.
	newInst id: oldOid.
	self registerInstance: newInst.

]

{ #category : #checking }
StepAbstractRepository >> resolvesInstanceReferences [
	self instancesDo: [:inst | self resolvesInstanceReferencesOf: inst]
]

{ #category : #checking }
StepAbstractRepository >> resolvesInstanceReferencesOf: instance [ 

]

{ #category : #'file in/out' }
StepAbstractRepository >> stepFileIn: aFilename [ 
	| stream |
	(stream := (Filename named: aFilename) readStream)
		ifNotNil: [[self parseStream: stream]
				ensure: [stream close]]
]

{ #category : #'instance registering' }
StepAbstractRepository >> unregisterInstance: inst [ 
	oidByInstanceIndex at: inst
		ifPresent: 
			[:oid | 
			instanceByOidIndex removeKey: oid.
			oidByInstanceIndex removeKey: inst.
			^inst].
	^nil
]

{ #category : #copying }
StepAbstractRepository >> veryDeepCopy [
	^ self deepCopy
]
