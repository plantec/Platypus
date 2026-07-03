"
<ISO10303-11-EXPRESS>
FUNCTION do_comments_with ( src : STRING ) : STRING;
	(*#  "" comments "" 
		| r s |
		r := ''.
		s :=  self src val.
		s linesDo: [:l | r := r , '--', l, String cr]. 
		self return: (PltStringLiteral val: r)
     		 #*) (*# <pharo> "" comments "" 
		| r s |
		r := ''.
		s :=  self src.
		s linesDo: [:l | r := r , '--', l, String cr]. 
		^ self return: r  #*) END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDoCommentsWithFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'src'
	],
	#category : 'Express2Cheddar-CheddarConstantsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarConstantsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDoCommentsWithFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDoCommentsWithFunction class >> schemaDefinition [

	^ ExChdCheddarConstantsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDoCommentsWithFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDoCommentsWithFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDoCommentsWithFunction >> fromValues: values [

	self src: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdDoCommentsWithFunction >> invoke [
	" ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "

	" comments "

	| r s |
	r := ''.
	s := self src.
	s linesDo: [ :l | r := r , '--' , l , String cr ].
	^ self return: r


]

{ #category : 'platypus-generated-accessing' }
ExChdDoCommentsWithFunction >> src [

	^ src


]

{ #category : 'platypus-generated-accessing' }
ExChdDoCommentsWithFunction >> src: aString [

	src := aString


]
