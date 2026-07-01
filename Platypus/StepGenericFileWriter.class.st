Class {
	#name : #StepGenericFileWriter,
	#superclass : #StepGenericRepositoryAbstractVisitor,
	#instVars : [
		'stream'
	],
	#category : #'Platypus-STEP-core'
}

{ #category : #'data encoding' }
StepGenericFileWriter >> doAggregation: a [  
	stream nextPut: $(.
	a
		do: [:e | self doToken: e]
		separatedBy: [stream nextPut: $,].
	stream nextPut: $)
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doBoolean: b [ 
	self doLogical: b
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doEnumeration: e [ 
	e isNil
		ifTrue: [stream nextPut: $$]
		ifFalse: [e asUppercase asSymbol = #UNKNOWN
				ifTrue: [stream nextPut: $U]
				ifFalse: [stream nextPut: $..
					stream nextPutAll: e.
					stream nextPut: $.]]
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doExternalRepresentation: inst [ 
	stream nextPut: $#.
	stream nextPutAll: (self oidOf: inst) printString.
	stream nextPut: $=.
	stream nextPut: $(.
		inst records
		do: [:val | self doToken: val]
		separatedBy: [stream nextPut: $ ].
	stream nextPutAll: ');'
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doFolder [
	| dateTime instances |
	dateTime := Time dateAndTimeNow.
	stream nextPutAll: 'ISO-10303-21;'.
	stream nextPut: Character cr.
	stream nextPutAll: 'HEADER;'.
	stream nextPut: Character cr.
	stream nextPutAll: 'FILE_NAME(''<name>'', ''' , dateTime first printString , ' ' , dateTime second printString , ''', (''<author>''), (''<organisation>''), ''<preprocessor version>'', ''<originating system>'', ''<authorization>'');\' withCRs.
	stream nextPutAll: 'FILE_DESCRIPTION((''<description1>'',''<description 2>''),''<implementation level>'');\' withCRs.
	stream nextPutAll: 'FILE_SCHEMA(());\' withCRs.
	stream nextPutAll: 'ENDSEC;'.
	stream nextPut: Character cr.
	stream nextPutAll: 'DATA;'.
	stream nextPut: Character cr.
	instances := folder instances.
	1
		to: instances size
		do: [:p | | i | (i := instances at: p)
				ifNotNil: [self doInstance: i.
					stream nextPut: Character cr]].
	stream nextPutAll: 'ENDSEC;'.
	stream nextPut: Character cr.
	stream nextPutAll: 'END-ISO-10303-21;'.
	stream nextPut: Character cr
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doInstance: inst [ 
	(inst isKindOf: StepExternalRepresentation)
		ifTrue: [self doExternalRepresentation: inst]
		ifFalse: [self doInternalRepresentation: inst]
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doInstanceRef: i [ 
	stream nextPut: $#.
	folder
		ifNotNil: [stream nextPutAll: i id asString]
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doInternalRepresentation: inst [ 
	stream nextPut: $#.
	stream nextPutAll: (self oidOf: inst) printString.
	stream nextPut: $=.
	stream nextPutAll: inst entityName asUppercase.
	stream nextPut: $(.
	inst values
		do: [:val | self doToken: val]
		separatedBy: [stream nextPut: $,].
	stream nextPutAll: ');'
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doLogical: l [ 
	stream nextPut: $..
	l
				ifTrue: [stream nextPut: $T]
				ifFalse: [stream nextPut: $F].
	stream nextPut: $.
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doNullValue: e [
	stream nextPut: $$
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doNumber: n [
	stream nextPutAll: n printString
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doRedefinedValue: aRedefinedValue [ 
	stream nextPut: $*.
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doSimpleRecord: inst [ 
	stream nextPutAll: inst entityName asUppercase.
	stream nextPut: $(.
	inst values
		do: [:val | self doToken: val]
		separatedBy: [stream nextPut: $,].
	stream nextPutAll: ')'
]

{ #category : #'data encoding' }
StepGenericFileWriter >> doString: s [
	stream nextPut: $'.
	s
		do: [:e | 
			stream nextPut: e.
			e == $'
				ifTrue: [stream nextPut: $']].
	stream nextPut: $'
]

{ #category : #'initialize/release' }
StepGenericFileWriter >> initialize [
	super initialize.
	stream := WriteStream on: String new.
]

{ #category : #'file in-out' }
StepGenericFileWriter >> stepFileOut: aFilename [ 
	| out |
	(out := (Filename named: aFilename) writeStream)
		ifNotNil: [[self doFolder.
			out nextPutAll: stream contents]
				ensure: [out close]]
]

{ #category : #accessing }
StepGenericFileWriter >> stream [
	^ stream
]

{ #category : #'data encoding' }
StepGenericFileWriter >> toStream: out [ 
	| |
	stream := out.
	self doFolder.

]
