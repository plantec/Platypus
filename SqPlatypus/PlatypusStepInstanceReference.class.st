Class {
	#name : #PlatypusStepInstanceReference,
	#superclass : #PlatypusStepReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #accessing }
PlatypusStepInstanceReference >> elementTag [
	^ #dataEntity
]

{ #category : #testing }
PlatypusStepInstanceReference >> hasContents [
	self value ifNil: [^ false].
	self value persistentLabel 
		ifNotEmpty: [(self modelContents includesInstance: self value)
			ifFalse: [^false ]].
	^ super hasContents
]

{ #category : #accessing }
PlatypusStepInstanceReference >> icon [	
	self value persistentLabel 
		ifNotEmpty: [
			(self modelContents includesInstance: self value)
				ifFalse: [ ^ TamIcons mimeIcon: '10x10/mimetypes/red_question']].
	^ self value isComputed 
		ifTrue: [TamIcons mimeIcon: '10x10/mimetypes/gray_sphere']
		ifFalse: [TamIcons mimeIcon: '10x10/mimetypes/green_sphere']
]

{ #category : #testing }
PlatypusStepInstanceReference >> isChangeable [ 
	^ self modelContents notNil and: [self modelContents includesInstance: self value]
]

{ #category : #accessing }
PlatypusStepInstanceReference >> modelContents [
	(self owner isKindOf: [PlatypusStepReference])
		ifFalse: [^ self value ifNotNil: [:v | v owningModel ] ].
	^ super modelContents
]

{ #category : #accessing }
PlatypusStepInstanceReference >> parserStartingState [
	^ StepParser startingStateForDataEntity
]

{ #category : #accessing }
PlatypusStepInstanceReference >> schemaInstance [
	^ self value schemaInstance
]

{ #category : #accessing }
PlatypusStepInstanceReference >> shortName [
	^ String streamContents: [:strm | | lab |
		[lab := self value persistentLabel] on: Error do: [].
		lab ifNotNil: [
			lab ifNotEmpty: [
				(self modelContents includesInstance: self value)
					ifFalse: [strm nextPutAll: '** Changed or removed** ']]].
		strm nextPutAll: (self codeText asString contractTo: 100)]
]

{ #category : #accessing }
PlatypusStepInstanceReference >> subReferences [
	self value persistentLabel 
		ifNotEmpty: [
			(self modelContents includesInstance: self value)
				ifFalse: [ self removeSubReferencesSilently]].
	^ super  subReferences
]
