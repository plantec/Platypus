Extension { #name : #PltSplitmarkStatement }

{ #category : #'*xtra-platypus-accessing' }
PltSplitmarkStatement >> append [
	^ append
]

{ #category : #'*xtra-platypus-accessing' }
PltSplitmarkStatement >> append: aBoolean [
	^ append  := aBoolean
]

{ #category : #'*xtra-platypus-initializing' }
PltSplitmarkStatement >> initialize [
	super initialize.
	append := false
]
