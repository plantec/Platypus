Class {
	#name : #PlatypusCoreRepositoryStepFileWriter,
	#superclass : #PlatypusCoreRepositoryAbstractVisitor,
	#instVars : [
		'stream'
	],
	#category : #'Platypus-HW-core'
}

{ #category : #'instance creation' }
PlatypusCoreRepositoryStepFileWriter class >> folder: aRepository [ 
	^ self new folder: aRepository
		
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> doAggregation: a [  
	stream nextPut: $(.
	a
		do: [:e | self doToken: e]
		separatedBy: [stream nextPut: $,].
	stream nextPut: $)
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> doBoolean: b [ 
	self doLogical: b
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> doEnumeration: e [ 
	e isNil
		ifTrue: [stream nextPut: $$]
		ifFalse: [stream nextPut: $..
			stream nextPutAll: e.
			stream nextPut: $.]
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> doExternalRepresentation: inst [ 
self error: 'not implemented'
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> doFolder [
	| dateTime instances |
	dateTime := DateAndTime now.
	stream nextPutAll: 'ISO-10303-21;'. 
	stream nextPut: Character cr.
	stream nextPutAll: 'HEADER;'.
	stream nextPut: Character cr.
	stream nextPutAll: 'FILE_NAME(''<name>'', ''' , dateTime  printString , ''', (''<author>''), (''<organisation>''), ''<preprocessor version>'', ''<originating system>'', ''<authorization>'');\' withCRs.
	stream nextPutAll: 'FILE_DESCRIPTION((''<description1>'',''<description 2>''),''<implementation level>'');\' withCRs.
	stream nextPutAll: 'FILE_SCHEMA(());\' withCRs.
	stream nextPutAll: 'ENDSEC;'.
	stream nextPut: Character cr.
	stream nextPutAll: 'DATA;'.
	stream nextPut: Character cr.
	instances := folder instances.
	'Populating...'
		displayProgressFrom: 1
		to: instances size
		during: [:bar | 1
				to: instances size
				do: [:p | 
					bar value: p.
					(instances at: p) 
						ifNotNil: [:i | 
							self doInstance: i.
							stream nextPut: Character cr]]].
	stream nextPutAll: 'ENDSEC;'.
	stream nextPut: Character cr.
	stream nextPutAll: 'END-ISO-10303-21;'.
	stream nextPut: Character cr
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> doInstanceRef: i [
	stream nextPut: $#.
	folder
		ifNotNil: [stream nextPutAll: (folder oidOf: i) printString]
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> doInternalRepresentation: inst [ 
	| currToken entityDef getterSymbol |
	stream nextPut: $#.
	stream nextPutAll: (self oidOf: inst) printString.
	stream nextPut: $=.
	entityDef := self metaDataSchemaInstance metaDataForClass: inst class.
	stream nextPutAll: entityDef name asUppercase.
	stream nextPut: $(.
	entityDef
		inheritedExplicitAttributesDo: [:attr | (entityDef isAttributeRedeclared: attr)
				ifTrue: [stream nextPut: $*]
				ifFalse: [getterSymbol := attr getSelectorFromNamesBuilder: self namesBuilder.
					currToken := inst perform: getterSymbol asSymbol.
					self doToken: currToken]]
		separatedBy: [stream nextPut: $,].
	stream nextPutAll: ');'
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> doLogical: l [ 
	stream nextPut: $..
	l = #unknow
		ifTrue: [stream nextPut: $U]
		ifFalse: [l
				ifTrue: [stream nextPut: $T]
				ifFalse: [stream nextPut: $F]].
	stream nextPut: $.
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> doNullValue: e [
	stream nextPut: $$
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> doNumber: n [
	stream nextPutAll: n printString
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> doObject: o [ 
	(o isKindOf: PlatypusSchemaWrapper)
		ifTrue: [self doObject: o linkedMetaData]
		ifFalse: [stream nextPutAll: '#' , (self oidOf: o) asString]
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> doString: s [
	stream nextPut: $'.
	s
		do: [:e | 
			stream nextPut: e.
			e == $'
				ifTrue: [stream nextPut: $']].
	stream nextPut: $'
]

{ #category : #accessing }
PlatypusCoreRepositoryStepFileWriter >> flushedContents [
	| contents |
	contents := stream contents.
	stream reset.
	^ contents
]

{ #category : #'initialize/release' }
PlatypusCoreRepositoryStepFileWriter >> initialize [
	super initialize.
	stream := WriteStream on: String new.
]

{ #category : #accessing }
PlatypusCoreRepositoryStepFileWriter >> metaDataSchemaInstance [
	^ folder  metaDataSchemaInstance
]

{ #category : #accessing }
PlatypusCoreRepositoryStepFileWriter >> namesBuilder [
	^ folder namesBuilder
]

{ #category : #'file in-out' }
PlatypusCoreRepositoryStepFileWriter >> stepFileOut: aFilename [ 
	| out |
	(out :=  (Filename named: aFilename) writeStream)
		ifNotNil: [[out nextPutAll: stream contents]
				ensure: [out close]]
]

{ #category : #accessing }
PlatypusCoreRepositoryStepFileWriter >> stream [
	^ stream
]

{ #category : #accessing }
PlatypusCoreRepositoryStepFileWriter >> stream: aStream [
	 stream := aStream
]

{ #category : #'data encoding' }
PlatypusCoreRepositoryStepFileWriter >> toStream: out [ 
	| |
	stream := out.
	self doFolder.

]
