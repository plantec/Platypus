Class {
	#name : #PlatypusSchemaInterfaceReference,
	#superclass : #PlatypusExpressLinkReference,
	#category : #'SqPlatypus-HW-tamaris'
}

{ #category : #'to be classified' }
PlatypusSchemaInterfaceReference >> asStringOrText [
	^ self linkPrefix , self linked  name
]

{ #category : #'icon accessing' }
PlatypusSchemaInterfaceReference >> children [
	| lnk |
	^ (lnk := self linked)
		ifNil: [#()]
		ifNotNil: [lnk nativeSchema isNil
				ifTrue: [#()]
				ifFalse: [lnk nativeSchema tamarisItemRef isNil ifTrue: [#()] ifFalse: [lnk nativeSchema tamarisItemRef children]]]
]

{ #category : #'icon accessing' }
PlatypusSchemaInterfaceReference >> icon [
	| lnk |
	^ ((lnk := self linked) isNil
			or: [lnk nativeSchema isNil])
		ifTrue: [TamIcons mimeIcon: '10x10/mimetypes/question']
		ifFalse: [lnk nativeSchema tamarisItemRef isNil
				ifTrue: [TamIcons mimeIcon: '10x10/mimetypes/question']
				ifFalse: [lnk nativeSchema tamarisItemRef icon]]
]

{ #category : #'to be classified' }
PlatypusSchemaInterfaceReference >> linkPrefix [
	^ self linked isNil ifTrue: [''] ifFalse: [self linked  isPltUsedSchema ifTrue: ['use from '] ifFalse: [self linked isPltReferencedSchema ifTrue: ['reference from '] ifFalse: ['meta from ']]]
]

{ #category : #'icon accessing' }
PlatypusSchemaInterfaceReference >> selectingFrom: aTaxonomyBrowser [ 
	| lnk |
	((lnk := self linked) isNil
			or: [lnk nativeSchema isNil or: [lnk nativeSchema tamarisItemRef isNil]])
		ifTrue: [^ nil].
	^ lnk nativeSchema tamarisItemRef selectingFrom: aTaxonomyBrowser
]

{ #category : #'to be classified' }
PlatypusSchemaInterfaceReference >> shortName [
	^ self linked name
]

{ #category : #'icon accessing' }
PlatypusSchemaInterfaceReference >> unSelectingFrom: aTaxonomyBrowser [ 
	| lnk |
	((lnk := self linked) isNil
			or: [lnk nativeSchema isNil or: [lnk nativeSchema tamarisItemRef isNil]])
		ifFalse: [lnk nativeSchema tamarisItemRef unSelectingFrom: aTaxonomyBrowser]
]
