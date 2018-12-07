Class {
	#name : #PlatypusGenerateAdaCommandLineHandler,
	#superclass : #PlatypusSubCommandLineHandler,
	#category : #'SqPlatypus-HW-CommandLine'
}

{ #category : #accessing }
PlatypusGenerateAdaCommandLineHandler class >> commandName [
	^ 'generate'
]

{ #category : #activation }
PlatypusGenerateAdaCommandLineHandler >> activate [
	super activate.
	self optionAt: 'to' ifAbsent: [ self exitFailure: 'Platypus: error: to option absent. Target no specified' ].
	self
		optionAt: 'to'
		ifPresent: [ :subconf | 
			subconf = 'cheddar'
				ifTrue: [ self generateToCheddar ].
			self exitFailure: 'Platypus: error: to option: unknown target ''' , subconf , '''' ]
]

{ #category : #activation }
PlatypusGenerateAdaCommandLineHandler >> generateToCheddar [
	| targetDirectory |
	targetDirectory := self baseDirectory / 'generated-code'.
	targetDirectory := targetDirectory asFileReference.
	targetDirectory exists
		ifFalse: [ self exitFailure: 'Platypus: error: target directory "' , targetDirectory pathString , '" does not exist' ].
	self stdout << 'Platypus: generating into ''' << targetDirectory pathString << '''' << String cr.
	CheddarGenerator generateInto: targetDirectory pathString.
	self exitSuccess
]
