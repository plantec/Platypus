Class {
	#name : #CheddarUMLGen,
	#superclass : #Object,
	#category : #'Cheddar-scripts'
}

{ #category : #'as yet unclassified' }
CheddarUMLGen class >> all [
	"self all"
	self allFor: ChdModelGenericObject.
	self allFor: ChdLangGenericExpression.
	self allFor: ChdLangGenericStatement.

	
]

{ #category : #'as yet unclassified' }
CheddarUMLGen class >> allFor: rootClass [
	self byPackage: rootClass.
	self simple: rootClass.
	self withInstVars: rootClass
]

{ #category : #'as yet unclassified' }
CheddarUMLGen class >> byPackage [
	| d s f |
	d := Dictionary new.
	Morph
		allSubclassesDo: [:cls |  
			| pkgname |
			pkgname := (PackageOrganizer default mostSpecificPackageOfClass: cls) packageName.
			s := d at: pkgname ifAbsentPut: Set new.
			s add: cls].
	s := String
				streamContents: [:strm | 
					strm nextPutAll: '@startuml'.
					strm cr.
					d
						keysAndValuesDo: [:k :v | 
							strm nextPutAll: 'package "' , k , '"'.
							strm cr.
							v
								do: [:cls | 
									strm nextPutAll: String tab , cls superclass name.
									strm nextPutAll: ' <|-- '.
									strm nextPutAll: cls name.
									strm cr].
							strm nextPutAll: 'end package'.
							strm cr].
					strm nextPutAll: 'hide circle'.
					strm cr.
					strm nextPutAll: 'hide method'.
					strm cr.
					strm nextPutAll: '@enduml'.
					strm cr].
	f := StandardFileStream forceNewFileNamed: 'MorphHierarchyByPackage.txt'.
	f nextPutAll: s.
	f close
]

{ #category : #'as yet unclassified' }
CheddarUMLGen class >> byPackage: rootClass [
	| d s f |
	d := Dictionary new.
	rootClass
		allSubclassesDo: [:cls |  
			| pkgname |
			pkgname := (PackageOrganizer default mostSpecificPackageOfClass: cls) packageName.
			s := d at: pkgname ifAbsentPut: Set new.
			s add: cls].
	s := String
				streamContents: [:strm | 
					strm nextPutAll: '@startuml'.
					strm cr.
					d
						keysAndValuesDo: [:k :v | 
							strm nextPutAll: 'package "' , k , '"'.
							strm cr.
							v
								do: [:cls | 
									strm nextPutAll: String tab , cls superclass name.
									strm nextPutAll: ' <|-- '.
									strm nextPutAll: cls name.
									strm cr].
							strm nextPutAll: 'end package'.
							strm cr].
					strm nextPutAll: 'hide circle'.
					strm cr.
					strm nextPutAll: 'hide method'.
					strm cr.
					strm nextPutAll: '@enduml'.
					strm cr].
	f := StandardFileStream forceNewFileNamed: rootClass name, 'HierarchyByPackage.txt'.
	f nextPutAll: s.
	f close
]

{ #category : #'as yet unclassified' }
CheddarUMLGen class >> simple: rootClass [
	| s f |
	s := String
				streamContents: [:strm |  
					strm nextPutAll: '@startuml'.
					strm cr.
					rootClass
						allSubclassesDo: [:cls | 
							strm nextPutAll: cls superclass name.
							strm nextPutAll: ' <|-- '.
							strm nextPutAll: cls name.
							strm cr].
					strm cr.
					strm nextPutAll: 'hide circle'.
					strm cr.
					strm nextPutAll: 'hide method'.
					strm cr.
					strm nextPutAll: '@enduml'.
					strm cr].
	f := StandardFileStream forceNewFileNamed: rootClass name, 'Hierarchy.txt'.
	f nextPutAll: s.
	f close
]

{ #category : #'as yet unclassified' }
CheddarUMLGen class >> withInstVars: rootClass [
	| s f |
	s := String
				streamContents: [:strm | 
					strm nextPutAll: '@startuml'.
					strm cr. 
					rootClass
						allSubclassesDo: [:cls | 
							strm nextPutAll: cls superclass name.
							strm nextPutAll: ' <|-- '.
							strm nextPutAll: cls name.
							strm cr].
					strm cr.
					rootClass
						allSubclassesDo: [:cls | cls instVarNames notEmpty
								ifTrue: [cls instVarNames
										do: [:n | 
											strm nextPutAll: cls name.
											strm nextPutAll: ' : '.
											strm nextPutAll: n]
										separatedBy: [strm cr].
									strm cr]].
					strm nextPutAll: 'hide circle'.
					strm cr.
					strm nextPutAll: 'hide method'.
					strm cr.
					strm nextPutAll: '@enduml'.
					strm cr].
	f := StandardFileStream forceNewFileNamed: rootClass name, 'HierarchyWithInstVars.txt'.
	f nextPutAll: s.
	f close
]
