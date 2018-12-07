Extension { #name : #PltExternalMetaSchema }

{ #category : #'*xtra-platypus-accessing' }
PltExternalMetaSchema >> nativeSchema [
	^ nativeSchema
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalMetaSchema >> nativeSchema: aPltSchemaDefinition [
	nativeSchema := aPltSchemaDefinition
]

{ #category : #'*xtra-platypus-accessing' }
PltExternalMetaSchema >> selectionString [
	^ 'META ' , super selectionString
]
