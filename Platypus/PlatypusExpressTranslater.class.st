Class {
	#name : #PlatypusExpressTranslater,
	#superclass : #PlatypusStepAbstractVisitor,
	#instVars : [
		'resultStream',
		'requestor'
	],
	#category : #'Platypus-HW-translater-private'
}

{ #category : #'instance creation' }
PlatypusExpressTranslater class >> accept: aMetaData fromTranslater: aTranslater [ 
	(self new fromTranslater: aTranslater) acceptTry: aMetaData
	
]

{ #category : #'instance creation' }
PlatypusExpressTranslater class >> accept: aMetaData fromTranslater: aTranslater resultStream: aStream [ 
	| translater |
	(translater := self new fromTranslater: aTranslater resultStream: aStream ) acceptTry: aMetaData.
	^ translater
]

{ #category : #accessing }
PlatypusExpressTranslater class >> expressionTranslaterClass [
^ PlatypusPharoSmalltalk at: self expressionTranslaterClassName

]

{ #category : #accessing }
PlatypusExpressTranslater class >> expressionTranslaterClassName [
	^ self subclassResponsibility 
]

{ #category : #utilities }
PlatypusExpressTranslater class >> fileIn: code [ 
	| reader chunk st |
	reader := ReadStream on: code.
	[reader atEnd]
		whileFalse: [reader skipSeparators.
			[(reader peekFor: $!)
				ifTrue: [(st := Compiler evaluate: reader nextChunk logged: false)
						ifNotNil: [st scanFrom: reader]]
				ifFalse: [chunk := reader nextChunk.
					reader checkForPreamble: chunk.
					Compiler evaluate: chunk logged: true]]
				on: InMidstOfFileinNotification
				do: [:ex | ex resume: true].
			reader skipStyleChunk].
	reader close
]

{ #category : #utilities }
PlatypusExpressTranslater class >> fileIn: code message: aMessage [ 
	self fileIn: code.
	"Note: The main purpose of this banner is to flush the changes file."
	ChangesLog default logChange: '----End Platypus of ' , aMessage , '----'
]

{ #category : #'instance creation' }
PlatypusExpressTranslater class >> fromTranslater: aTranslater [ 
	^ self new fromTranslater: aTranslater
]

{ #category : #'instance creation' }
PlatypusExpressTranslater class >> fromTranslater: aTranslater resultStream: aStream [ 
	^ self new fromTranslater: aTranslater resultStream: aStream
]

{ #category : #'instance creation' }
PlatypusExpressTranslater class >> resultStream: anObject [ 
	^ self new resultStream: anObject 
]

{ #category : #accessing }
PlatypusExpressTranslater class >> statementTranslaterClass [
	^ PlatypusPharoSmalltalk at: self statementTranslaterClassName
]

{ #category : #accessing }
PlatypusExpressTranslater class >> statementTranslaterClassName [
	^ self subclassResponsibility
]

{ #category : #utilities }
PlatypusExpressTranslater class >> translate: aMetaData fromTranslater: aTranslater [ 
	^(self new fromTranslater: aTranslater
		resultStream: (WriteStream on: String new)) translate: aMetaData
]

{ #category : #'stream utilities' }
PlatypusExpressTranslater >> cr [
	self resultStream cr
]

{ #category : #accessing }
PlatypusExpressTranslater >> expressionTranslaterClass [
	^ self class expressionTranslaterClass
]

{ #category : #'public accessing' }
PlatypusExpressTranslater >> finalResult [
	^ self finalResultFrom: self result
]

{ #category : #'public accessing' }
PlatypusExpressTranslater >> finalResultFrom: aString [ 
	^ aString
]

{ #category : #accessing }
PlatypusExpressTranslater >> fromTranslater: aTranslater [ 
	self
		fromTranslater: aTranslater
		resultStream: aTranslater resultStream
]

{ #category : #accessing }
PlatypusExpressTranslater >> fromTranslater: aTranslater resultStream: aStream [ 
	self requestor: aTranslater.
	self resultStream: aStream
]

{ #category : #'stream utilities' }
PlatypusExpressTranslater >> nextPutAll: aString [ 
	self resultStream nextPutAll: aString
]

{ #category : #'stream utilities' }
PlatypusExpressTranslater >> nextPutAllCr: aString [ 
	self nextPutAll: aString , String cr
]

{ #category : #'stream utilities' }
PlatypusExpressTranslater >> nextPutAllCrCr: aString [ 
	self nextPutAllCr: aString , String cr
]

{ #category : #accessing }
PlatypusExpressTranslater >> requestor [
	^ requestor
]

{ #category : #accessing }
PlatypusExpressTranslater >> requestor: anObject [ 
	requestor := anObject
]

{ #category : #accessing }
PlatypusExpressTranslater >> result [
	^ self resultStream contents
]

{ #category : #accessing }
PlatypusExpressTranslater >> resultStream [
	^ resultStream ifNil: [resultStream := WriteStream on: String new]
]

{ #category : #accessing }
PlatypusExpressTranslater >> resultStream: anObject [
	resultStream := anObject
]

{ #category : #accessing }
PlatypusExpressTranslater >> schemaInstance [
	^ self requestor
		ifNil: [visitPath first schemaInstance]
		ifNotNil: [self requestor schemaInstance]
]

{ #category : #accessing }
PlatypusExpressTranslater >> statementTranslaterClass [
^ self class statementTranslaterClass

]

{ #category : #'public accessing' }
PlatypusExpressTranslater >> translate: aMetaData [ 
	self acceptTry: aMetaData.
			^ self result
]

{ #category : #'stream utilities' }
PlatypusExpressTranslater >> unshunkedString: aString [
	| terminator code |
	terminator := $!.
	code := WriteStream on: String new.
	aString
		do: [:c | c = terminator
				ifTrue: [code nextPut: terminator.
					code nextPut: terminator]
				ifFalse: [code nextPut: c]].
	^ code contents
]
