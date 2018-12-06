Class {
	#name : #TamHierarchicalListTransformMorph,
	#superclass : #TransformMorph,
	#category : #'Tamaris-UI'
}

{ #category : #drawing }
TamHierarchicalListTransformMorph >> bottomVisibleRowForCanvas: aCanvas [
     "return the bottom visible row in aCanvas's clip rectangle"
	
	^ self rowAtLocation: (aCanvas clipRect  bottomRight).

]

{ #category : #drawing }
TamHierarchicalListTransformMorph >> bottomVisibleRowForCanvas: aCanvas startingAt: aPos [
     "return the bottom visible row in aCanvas's clip rectangle"
	
	^ self rowAtLocation: (aCanvas clipRect  bottomRight)  startingAt: aPos

]

{ #category : #drawing }
TamHierarchicalListTransformMorph >> drawRawColorOn: aCanvas forSubmorph: aSubMorph [
	| c frame emph emphasis |

	frame :=  (aSubMorph fullBounds withRight: owner right + owner scroller offset x ).
	emph := owner emphasisOf: aSubMorph withoutListWrapper.
	emphasis := emph emphasis.
	c := emph backgroundColor.
	(c ifNil: [c := aSubMorph color]) notNil
		ifTrue: [
			c isColor
				ifTrue: [
					aCanvas 
						frameAndFillRectangle: frame
						fillColor: c
						borderWidth: 0 
						borderColor: Color transparent]
				ifFalse: [
						c origin: aSubMorph bounds topLeft.
						c direction: aSubMorph bounds width@0.
						aCanvas fillRectangle: frame basicFillStyle: c]]
]

{ #category : #drawing }
TamHierarchicalListTransformMorph >> drawSubmorphsOn: aCanvas [
	submorphs ifEmpty: [^ self].
	aCanvas transformBy: transform
		clippingTo: (aCanvas clipRect intersect: (owner clippingBounds))
		during: [:myCanvas |  | top bottom |
			top := self topVisibleRowForCanvas: myCanvas.
			bottom := self bottomVisibleRowForCanvas: myCanvas startingAt: top.
			bottom 
				to: top
				by: -1			
				do: [:row | | m |
					m := submorphs basicAt: row.
					self drawRawColorOn: myCanvas forSubmorph: m.
					myCanvas fullDrawMorph: m] ]
		smoothing: smoothing.
]

{ #category : #geometry }
TamHierarchicalListTransformMorph >> fullBounds [
	"Overridden to clip submorph hit detection to my bounds."
	"It might be better to override doLayoutIn:, and remove this method"

	fullBounds ifNotNil:[^ fullBounds].
	fullBounds := bounds.
	^ fullBounds
]

{ #category : #initialization }
TamHierarchicalListTransformMorph >> initialize [
	super initialize.
	self smoothingOn
]

{ #category : #layout }
TamHierarchicalListTransformMorph >> localSubmorphBounds [
	"Answer, in my coordinate system, the bounds of all my visible submorphs (or nil if no visible submorphs)"
	localBounds ifNil: [ 
		self hasSubmorphs ifFalse: [^ nil].
		localBounds :=  self firstSubmorph fullBounds topLeft corner: owner maxNodeWidth @ (self lastSubmorph fullBounds bottom + owner extraScrollRange)].
	^ localBounds 

]

{ #category : #drawing }
TamHierarchicalListTransformMorph >> rowAtLocation: aPoint [
	"return the number of the row at aPoint"
	| y |
	y := aPoint y.
	submorphs ifEmpty: [^ nil].
	submorphs doWithIndex:  [:m :idx | m topLeft y >= y ifTrue: [^ (idx - 1) max: 1]].
	^ submorphs size
]

{ #category : #drawing }
TamHierarchicalListTransformMorph >> rowAtLocation: aPoint startingAt: aPosition [
	"return the number of the row at aPoint"
	| y |
	y := aPoint y.
	submorphs ifEmpty: [^ nil].
	aPosition to: submorphs size do: [ :idx | | m |
		m := submorphs basicAt: idx.
		m topLeft y >= y ifTrue: [^ (idx - 1) max: 1]].
	^ submorphs size
]

{ #category : #layout }
TamHierarchicalListTransformMorph >> submorphBounds [
	"Private. Compute the actual full bounds of the receiver, optimized for speed"
	self hasSubmorphs ifFalse: [^ nil].
	^ self firstSubmorph topLeft corner: owner scroller bounds bottomLeft + (0@ owner extraScrollRange)

]

{ #category : #drawing }
TamHierarchicalListTransformMorph >> topVisibleRowForCanvas: aCanvas [
     "return the top visible row in aCanvas's clip rectangle"

        ^ self rowAtLocation: (aCanvas clipRect topLeft).

]

{ #category : #drawing }
TamHierarchicalListTransformMorph >> topVisibleRowForCanvas: aCanvas startingAt: aPos [
     "return the top visible row in aCanvas's clip rectangle"

        ^ self rowAtLocation: (aCanvas clipRect topLeft) startingAt: aPos.

]

{ #category : #testing }
TamHierarchicalListTransformMorph >> wantsSteps [
	^ false
]
