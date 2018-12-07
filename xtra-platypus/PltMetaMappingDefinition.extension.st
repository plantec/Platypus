Extension { #name : #PltMetaMappingDefinition }

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingDefinition >> definitionPath [
	^ definitionPath
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingDefinition >> definitionPath: aListOfString [
	definitionPath := aListOfString
]

{ #category : #'*xtra-platypus-instance-creation' }
PltMetaMappingDefinition class >> definitionPath: aListOfString metaExpression: anExpression [
	^ (self new definitionPath: aListOfString) metaExpression: anExpression
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingDefinition >> errorQualifier [
	| s |
	s := ''.
	definitionPath do: [:p | s := s, p] separatedBy: [s := s, '.'].
	^ super errorQualifier , ' ''' , s , ''''
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingDefinition >> haveError [
	^ haveError
		ifNil: [haveError := true]
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingDefinition >> haveError: aBoolean [ 
	haveError := aBoolean
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingDefinition >> metaExpression: anExpression [ 
	metaExpression := anExpression.
	self updateExpression
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaMappingDefinition >> updateExpression [
	metaExpression
				isNil ifFalse: [expression := metaExpression prettyPrintedExpressCode]
				ifTrue: [expression := '']
]
