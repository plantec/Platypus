Extension { #name : #PltMetaConceptDefinition }

{ #category : #'*xtra-platypus-accessing' }
PltMetaConceptDefinition >> errorQualifier [
	^ super errorQualifier , ' ''' , self expression , ''''
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaConceptDefinition >> haveError [
	^ haveError
		ifNil: [haveError := true]
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaConceptDefinition >> haveError: aBoolean [
	haveError:= aBoolean

]

{ #category : #'*xtra-platypus-accessing' }
PltMetaConceptDefinition >> metaExpression [
	^ metaExpression
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaConceptDefinition >> metaExpression: anExpression [ 
	metaExpression := anExpression.
	expression := metaExpression ifNotNil: [metaExpression expressCode]
]

{ #category : #'*xtra-platypus-accessing' }
PltMetaConceptDefinition >> updateExpression [
	expression := metaExpression prettyPrintedExpressCode.

]
