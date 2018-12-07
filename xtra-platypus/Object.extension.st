Extension { #name : #Object }

{ #category : #'*xtra-platypus-visiting' }
Object >> acceptTry: aVisitor [
	^ aVisitor acceptTry: self
]

{ #category : #'*xtra-platypus-express-compat' }
Object >> asPlatypusComplexInstance [
	| cplxInst |
	cplxInst := PlatypusComplexInstance new.
	cplxInst add: self.
	^ cplxInst
]

{ #category : #'*xtra-platypus-interpreter-compat' }
Object >> ifMissing: missingBlock ifNotMissing: notMissingBlock [ 
	^ notMissingBlock value
]

{ #category : #'*xtra-platypus-interpreter-compat' }
Object >> isPltArray [
	^ false
]

{ #category : #'*xtra-platypus-interpreter-compat' }
Object >> isPltGenericInstance [
	^false
]

{ #category : #'*xtra-platypus-express-compat' }
Object >> pltAddIntoComplexeInstance: aComplexInstance [
	aComplexInstance privateAddRecord: self.
	
]

{ #category : #'*xtra-platypus-express-compat' }
Object >> pltAsObject [
	
]

{ #category : #'*xtra-platypus-express-compat' }
Object >> pltCopyFrom: start to: stop [
	^ self copyFrom: start to: stop
]

{ #category : #'*xtra-platypus-express-compat' }
Object >> pltCopyGroup: aClass to: anObject [ 

]

{ #category : #'*xtra-platypus-express-compat' }
Object >> pltCopyTo: another [ 
	^ self
]

{ #category : #'*xtra-platypus-express-compat' }
Object >> pltLocalCopyTo: another [ 
	^ self
]

{ #category : #'*xtra-platypus-interpreter-compat' }
Object >> pltNativeValue [
	^ self
]

{ #category : #'*xtra-platypus-express-compat' }
Object >> pltPlus: aCollectionOrNumber [
	| result |
	aCollectionOrNumber isNumber
		ifTrue: [^ self + aCollectionOrNumber ]
		ifFalse: [result := aCollectionOrNumber copyEmpty.
			result add: self.
			^ result].

]

{ #category : #'*xtra-platypus-interpreter-compat' }
Object >> printableCode [
	^ self printString
]

{ #category : #'*xtra-platypus-initializing' }
Object >> stepInitialize [
	^ self
]
