Extension { #name : #PltGlobalRule }

{ #category : #'*xtra-platypus-evaluating' }
PltGlobalRule >> evaluate [
	Cursor wait
		showWhile: [^ PlatypusExpressInterpretor new
				compute: (Array with: self )
				in: self owner 
				to: nil
				notifying: nil
				ifFail: []
				logged: false]
]

{ #category : #'*xtra-platypus-evaluating' }
PltGlobalRule >> evaluate: args [
	^ self evaluate
]

{ #category : #'*xtra-platypus-code-generating' }
PltGlobalRule >> generatedClassNameSuffix [
	^ 'GlobalRule'
]

{ #category : #'*xtra-platypus-evaluating' }
PltGlobalRule >> initializeContextInInterpretor: anInterpretor [ 
	self forEntities do: [ :fe | anInterpretor declareEntityInstancesSet: fe].
	super initializeContextInInterpretor: anInterpretor.

]

{ #category : #'*xtra-platypus-accessing' }
PltGlobalRule >> lookUpIdentifierBN: aName [
	| upper |
	upper := aName asUppercase.
	self forEntities ifNil: [^ nil].
	^ self forEntities detect: [ :i | i name asUppercase = upper] ifNone: [super lookUpIdentifierBN: aName]

]

{ #category : #'*xtra-platypus-data-management' }
PltGlobalRule >> moveInto: aContextDefinition [ 
	aContextDefinition globalRules add: self.
	self owner: aContextDefinition
]

{ #category : #'*xtra-platypus-data-management' }
PltGlobalRule >> removeFrom: aContextDefinition [ 
	aContextDefinition globalRules remove: self.

]

{ #category : #'*xtra-platypus-data-management' }
PltGlobalRule >> renameWith: aString [
	self owner renameGlobalRule: self with: aString.

]
