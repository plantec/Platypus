Extension { #name : #PltNativeCode }

{ #category : #'*xtra-platypus' }
PltNativeCode >> cachedMethod [
	^ cachedMethod
]

{ #category : #'*xtra-platypus' }
PltNativeCode >> cachedMethod: aMethod [
	cachedMethod := aMethod
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeCode class >> cppSignature [
	^ 'C++'
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeCode class >> cppStlSignature [
	^ 'C++/STL'
]

{ #category : #'*xtra-platypus' }
PltNativeCode >> isPharoCode [
	^ self languageSignature notNil and: [self languageSignature asUppercase = self class pharoSignature]
]

{ #category : #'*xtra-platypus' }
PltNativeCode >> isPlatypusInterpreterCode [
	^ self languageSignature isNil or: [self languageSignature isEmpty
		or: [self languageSignature asUppercase = self class platypusSignature]]
]

{ #category : #'*xtra-platypus' }
PltNativeCode >> isVisualWorksCode [
	^ self languageSignature notNil
		and: [self languageSignature asUppercase = self class visualWorksSignature]
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeCode class >> pharoSignature [
	^ 'PHARO'
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeCode class >> platypusSignature [
	^ 'PLATYPUS'
]

{ #category : #'*xtra-platypus-accessing' }
PltNativeCode class >> visualWorksSignature [
	^ 'VISUALWORKS'
]
