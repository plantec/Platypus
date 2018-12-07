Extension { #name : #SequenceableCollection }

{ #category : #'*xtra-platypus-enumerating' }
SequenceableCollection >> doWithIndex: elementBlock separatedBy: separatorBlock [
	"Evaluate the elementBlock for all elements in the receiver,
	and evaluate the separatorBlock between."

	1 to: self size do:
		[:index |
		index = 1 ifFalse: [separatorBlock value].
		elementBlock value: (self at: index) value: index]
]

{ #category : #'*xtra-platypus-enumerating' }
SequenceableCollection >> with: otherCollection do: twoArgBlock separatedBy: separatorBlock [
	"Evaluate twoArgBlock with corresponding elements from this collection and otherCollection."
	otherCollection size = self size ifFalse: [self error: 'otherCollection must be the same size'].
	1 to: self size do:
		[:index |
		index = 1 ifFalse: [separatorBlock value].
		twoArgBlock value: (self at: index)
				value: (otherCollection at: index)]
]
