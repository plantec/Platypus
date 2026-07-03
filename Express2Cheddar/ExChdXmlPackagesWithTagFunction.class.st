"
<ISO10303-11-EXPRESS>
FUNCTION xml_packages_with_tag ( tag : STRING ) : LIST OF ada_package;
	RETURN ( QUERY ( p <* xml_packages ( ) | tag IN p.xml_root_tags ) );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdXmlPackagesWithTagFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'tag'
	],
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdXmlPackagesWithTagFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdXmlPackagesWithTagFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdXmlPackagesWithTagFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdXmlPackagesWithTagFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlPackagesWithTagFunction >> fromValues: values [
	self tag: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdXmlPackagesWithTagFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	^ self
		return:
			(ExChdXmlPackagesFunction invoke
				select: [ :p136 | (p136 xmlRootTagsUsingContext: self class context) includes: self tag ])


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlPackagesWithTagFunction >> tag [
	^ tag


]

{ #category : 'platypus-generated-accessing' }
ExChdXmlPackagesWithTagFunction >> tag: aString [
	tag := aString


]
