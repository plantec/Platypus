"
<ISO10303-11-EXPRESS>
FUNCTION xml_packages : LIST OF ada_package;
	RETURN ( QUERY ( p <* SetToList ( all_ada_packages ( ) ) | SIZEOF ( p.xml_root_tags ) > 0 ) );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdXmlPackagesFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdXmlPackagesFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdXmlPackagesFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdXmlPackagesFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdXmlPackagesFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-invoking' }
ExChdXmlPackagesFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			((PTsSetToListFunction
				invokeFromValues:
					(OrderedCollection new
						add: ExChdAllAdaPackagesFunction invoke;
						yourself))
				select: [ :p2927 | 
					(PltSIZEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: (p2927 xmlRootTagsUsingContext: self class context);
								yourself)) > 0 ])


]
