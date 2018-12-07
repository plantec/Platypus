"
A PlatypusGenerateAdaCommandLineHandler is xxxxxxxxx.

Instance Variables
	targetDirectory:		<Object>

targetDirectory
	- xxxxx

"
Class {
	#name : #PlatypusHelpCommandLineHandler,
	#superclass : #PlatypusSubCommandLineHandler,
	#category : #'SqPlatypus-HW-CommandLine'
}

{ #category : #accessing }
PlatypusHelpCommandLineHandler class >> commandName [
	^ 'help'
]

{ #category : #activation }
PlatypusHelpCommandLineHandler >> activate [
	super activate.
	self stdout <<  'Platypus/Cheddar script help' << String cr.
	self stdout << '	SHOWING THIS HELP: ./platypus help' << String cr << String cr.
	self stdout << '	COMPILING:' <<  String cr.
	self stdout << '		./platypus compile <path/to/model-name>.exp' << String cr.
	self stdout << '		examples:' << String cr.
	self stdout << '			./platypus compile cheddar_api.exp' << String cr.
	self stdout << '			./platypus compile src/cheddar-dev/cheddar_api.exp' << String cr << String cr.
	self stdout << '	CODE GENERATING' <<  String cr.
	self stdout << '		./platypus generate --to=cheddar' << String cr.
	self exitSuccess
]
