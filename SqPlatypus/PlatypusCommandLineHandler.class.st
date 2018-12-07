Class {
	#name : #PlatypusCommandLineHandler,
	#superclass : #BasicCommandLineHandler,
	#category : #'SqPlatypus-HW-CommandLine'
}

{ #category : #accessing }
PlatypusCommandLineHandler class >> commandName [
	^ 'platypus'
]

{ #category : #'handler selection' }
PlatypusCommandLineHandler class >> isResponsibleFor: aCommandLineArguments [
	^ aCommandLineArguments includesSubCommand: self commandName
]

{ #category : #accessing }
PlatypusCommandLineHandler >> baseDirectory [

	^ (OSEnvironment default getEnv: 'PWD') asFileReference 
]

{ #category : #private }
PlatypusCommandLineHandler >> subCommandsRoot [
	^ PlatypusSubCommandLineHandler
]
