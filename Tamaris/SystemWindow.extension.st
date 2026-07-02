Extension { #name : #SystemWindow }

{ #category : #'*tamaris' }
SystemWindow >> emptyLabelArea [
	labelArea
		ifNotNil: [labelArea delete. labelArea := nil]
]
