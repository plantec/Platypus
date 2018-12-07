Class {
	#name : #PlatypusCoreRunningContext,
	#superclass : #Object,
	#instVars : [
		'folder'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #'instance creation' }
PlatypusCoreRunningContext class >> folder: aFolder [ 
	^ self new folder: aFolder
]

{ #category : #'folder interface' }
PlatypusCoreRunningContext >> allApplicationInstances [
	^ self folder allApplicationInstances
]

{ #category : #'folder interface' }
PlatypusCoreRunningContext >> allInstancesOf: aClass [ 
	^ self folder allInstancesOf: aClass 
]

{ #category : #'folder interface' }
PlatypusCoreRunningContext >> allInstancesOf: aClass do: aBlock [ 
	^ self folder allInstancesOf: aClass do: aBlock 
]

{ #category : #accessing }
PlatypusCoreRunningContext >> folder [
	^folder
]

{ #category : #accessing }
PlatypusCoreRunningContext >> folder: aPlatypusCoreRepository [ 
	folder := aPlatypusCoreRepository
]

{ #category : #'folder interface' }
PlatypusCoreRunningContext >> instanceAt: id [ 
	^ folder instanceAt: id 
]

{ #category : #'folder interface' }
PlatypusCoreRunningContext >> oidExists: id [ 
	^ self folder oidExists: id
]

{ #category : #'folder interface' }
PlatypusCoreRunningContext >> oidOf: anInstance [ 
	^self folder oidOf: anInstance 
]

{ #category : #'folder interface' }
PlatypusCoreRunningContext >> parseStream: in [ 
	^ self folder parseStream: in
]

{ #category : #'folder interface' }
PlatypusCoreRunningContext >> registerInstance: appInst [ 
	^ self folder registerInstance: appInst 
]

{ #category : #'folder interface' }
PlatypusCoreRunningContext >> registerInstance: appInst withId: id [ 
	^ self folder registerInstance: appInst withId: id
]

{ #category : #'folder interface' }
PlatypusCoreRunningContext >> stepFileIn: aFilename [ 
	^self folder stepFileIn: aFilename
]

{ #category : #'folder interface' }
PlatypusCoreRunningContext >> unregisterInstance: inst [ 
	^ self folder unregisterInstance: inst
]
