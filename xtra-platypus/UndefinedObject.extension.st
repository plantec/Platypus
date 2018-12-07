Extension { #name : #UndefinedObject }

{ #category : #'*xtra-platypus-visiting' }
UndefinedObject >> acceptTry: aVisitor [ 
	
]

{ #category : #'*xtra-platypus-visiting' }
UndefinedObject >> acceptTry: aVisitor separatedBy: aBlock [ 

]

{ #category : #'*xtra-platypus-interpreter-compat' }
UndefinedObject >> ifMissing: missingBlock ifNotMissing: notMissingBlock [ 
	^ missingBlock value
]
