Class {
	#name : #PlatypusCompileSchemaCommandLineHandler,
	#superclass : #PlatypusSubCommandLineHandler,
	#category : #'SqPlatypus-HW-CommandLine'
}

{ #category : #accessing }
PlatypusCompileSchemaCommandLineHandler class >> commandName [
	^ 'compile'
]

{ #category : #activation }
PlatypusCompileSchemaCommandLineHandler >> activate [
	super activate.
	self parseInputFiles 
]

{ #category : #activation }
PlatypusCompileSchemaCommandLineHandler >> parseInputFiles [
	| inputFile elemName command |
	super activate.
	inputFile := self baseDirectory resolve: self arguments last.
	inputFile exists
		ifFalse: [ self exitFailure: '"' , inputFile pathString , '" does not exist' ].
	elemName := inputFile basenameWithoutExtension.
	[Platypus itemNamed: elemName] on: Error do: [ self exitFailure: 'schema ''' , elemName , '" does not exist' ]. 
	command := PlatypusCommand new.
	self stdout << 'Platypus: compiling: ' << inputFile pathString << String cr.
	command updateSchemaFrom:  inputFile pathString.
	command haveError ifTrue: [ self exitFailure: 'Error during compilation' ].
	Smalltalk snapshot: true andQuit: false.
	self exitSuccess
]
