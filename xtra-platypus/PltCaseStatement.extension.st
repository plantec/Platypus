Extension { #name : #PltCaseStatement }

{ #category : #'*xtra-platypus-testing' }
PltCaseStatement >> alwaysReturn [

  self caseOtherwise ifNil: [^ false].
  self caseActions do: [ :ca | ca alwaysReturn not ifTrue: [^false]].
  ^ self caseOtherwise alwaysReturn
 

]
