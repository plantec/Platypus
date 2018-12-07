Class {
	#name : #PlatypusAbstractTranslaterInterface,
	#superclass : #Object,
	#category : #'Platypus-HW-translater-public'
}

{ #category : #accessing }
PlatypusAbstractTranslaterInterface class >> translaterClass [
	^ PlatypusPharoSmalltalk at: self translaterClassName asSymbol
]

{ #category : #accessing }
PlatypusAbstractTranslaterInterface class >> translaterClassName [
	^ self subclassResponsibility 
]

{ #category : #'public accessing' }
PlatypusAbstractTranslaterInterface >> localTranslate: aMetaData [ 
	| translater |
	translater := self translaterClass namesBuilder: aMetaData namesBuilder.
	translater localTranslationOnly: true.
	^ self translate: aMetaData withStructureTranslater: translater
]

{ #category : #'public accessing' }
PlatypusAbstractTranslaterInterface >> translate: aMetaData [ 
	| translater |
	translater := self translaterClass namesBuilder: aMetaData namesBuilder.
	^ self translate: aMetaData withStructureTranslater: translater
]

{ #category : #'public accessing' }
PlatypusAbstractTranslaterInterface >> translate: aMetaData withStructureTranslater: aTranslater [ 
	^ aTranslater translate: aMetaData
]

{ #category : #accessing }
PlatypusAbstractTranslaterInterface >> translaterClass [
	^ self class translaterClass
	
]
