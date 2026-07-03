"
<ISO10303-11-EXPRESS>
ENTITY ada_entity 
	ABSTRACT SUPERTYPE 
	SUBTYPE OF ( entity_definition );
DERIVE
	refed_by_pointer : BOOLEAN := false;
	ada_ident : STRING := name;
	ada_ref_ident : STRING := SELF.ada_ident;
	ptr_type : STRING := name + '_Ptr';
	explicit_attributes : LIST OF explicit_attribute := QUERY ( a <* attributes | 'PLATYPUS_DICTIONARY_SCHEMA.EXPLICIT_ATTRIBUTE' IN TYPEOF ( a ) );
	derived_attributes : LIST OF explicit_attribute := QUERY ( a <* attributes | 'PLATYPUS_DICTIONARY_SCHEMA.DERIVED_ATTRIBUTE' IN TYPEOF ( a ) );
	put_prefix : STRING := '';
	dependencies : LIST OF dictionary_instance := dependencies_of_ada_entity ( SELF.owner, SELF );
	xml_writer_code : STRING := ?;
	xml_io_record_code : STRING := ?;
	html_tag : STRING := Lowerize ( SELF.name );
END_ENTITY;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaEntity',
	#superclass : 'PltEntityDefinition',
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntity class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaEntity class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaEntity class >> schemaInstance [
	^ ExChdExpress2cheddarSchemaInstance singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntity class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaEntity class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-visiting' }
ExChdAdaEntity >> accept: aVisitor [
	^ aVisitor acceptAdaEntity: self


]

{ #category : 'platypus-generated-copying' }
ExChdAdaEntity >> adaEntityCopyTo: another [
	


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaEntity >> adaEntityFromValues: values [
	| valuesloc |
	valuesloc := values asOrderedCollection.
	^ valuesloc


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaEntity >> adaEntityToValues: values [
	^ values


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> adaIdent [
	^ self adaIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> adaIdentUsingContext: aContext [
	^ self adaIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> adaIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver name


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> adaRefIdent [
	^ self adaRefIdentUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> adaRefIdentUsingContext: aContext [
	^ self adaRefIdentUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> adaRefIdentUsingContext: aContext receiver: aReceiver [
	^ aReceiver adaIdentUsingContext: aContext


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> dependencies [
	^ self dependenciesUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> dependenciesUsingContext: aContext [
	^ self dependenciesUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> dependenciesUsingContext: aContext receiver: aReceiver [
	^ ExChdDependenciesOfAdaEntityFunction
		invokeFromValues:
			(OrderedCollection new
				add: (aReceiver ownerUsingContext: self class context);
				add: aReceiver;
				yourself)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> derivedAttributes [
	^ self derivedAttributesUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> derivedAttributesUsingContext: aContext [
	^ self derivedAttributesUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> derivedAttributesUsingContext: aContext receiver: aReceiver [
	^ aReceiver attributes
		select: [ :a3936 | 
			(PltTYPEOFFunction
				invokeFromValues:
					(OrderedCollection new
						add: a3936;
						yourself)) includes: 'PLATYPUS_DICTIONARY_SCHEMA.DERIVED_ATTRIBUTE' ]


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> explicitAttributes [
	^ self explicitAttributesUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> explicitAttributesUsingContext: aContext [
	^ self explicitAttributesUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> explicitAttributesUsingContext: aContext receiver: aReceiver [
	^ aReceiver attributes
		select: [ :a2883 | 
			(PltTYPEOFFunction
				invokeFromValues:
					(OrderedCollection new
						add: a2883;
						yourself)) includes: 'PLATYPUS_DICTIONARY_SCHEMA.EXPLICIT_ATTRIBUTE' ]


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaEntity >> fromValues: values [
	^ self adaEntityFromValues: (super fromValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> htmlTag [
	^ self htmlTagUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> htmlTagUsingContext: aContext [
	^ self htmlTagUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> htmlTagUsingContext: aContext receiver: aReceiver [
	^ PTsLowerizeFunction
		invokeFromValues:
			(OrderedCollection new
				add: (aReceiver nameUsingContext: self class context);
				yourself)


]

{ #category : 'platypus-generated-classifying' }
ExChdAdaEntity >> isExChdAdaEntity [
	^ true


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaEntity >> localFromValues: values [
	^ self adaEntityFromValues: values


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaEntity >> localToValues: values [
	^ self adaEntityToValues: values


]

{ #category : 'platypus-generated-copying' }
ExChdAdaEntity >> pltCopyGroup: aClassSymbol to: anObject [
	self class name == aClassSymbol
		ifTrue: [ self pltCopyTo: anObject ]
		ifFalse: [ super pltCopyGroup: aClassSymbol to: anObject ]


]

{ #category : 'platypus-generated-copying' }
ExChdAdaEntity >> pltCopyTo: another [
	super pltCopyTo: another.
	self adaEntityCopyTo: another


]

{ #category : 'platypus-generated-copying' }
ExChdAdaEntity >> pltLocalCopyTo: another [
	self adaEntityCopyTo: another


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> ptrType [
	^ self ptrTypeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> ptrTypeUsingContext: aContext [
	^ self ptrTypeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> ptrTypeUsingContext: aContext receiver: aReceiver [
	^ aReceiver name pltPlus: '_Ptr'


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> putPrefix [
	^ self putPrefixUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> putPrefixUsingContext: aContext [
	^ self putPrefixUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> putPrefixUsingContext: aContext receiver: aReceiver [
	^ ''


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> refedByPointer [
	^ self refedByPointerUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> refedByPointerUsingContext: aContext [
	^ self refedByPointerUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> refedByPointerUsingContext: aContext receiver: aReceiver [
	^ false


]

{ #category : 'platypus-generated-initializing' }
ExChdAdaEntity >> stepInitialize [
	super stepInitialize


]

{ #category : 'platypus-generated-group-accessing' }
ExChdAdaEntity >> toValues: values [
	^ self adaEntityToValues: (super toValues: values)


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> xmlIoRecordCode [
	^ self xmlIoRecordCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> xmlIoRecordCodeUsingContext: aContext [
	^ self xmlIoRecordCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> xmlIoRecordCodeUsingContext: aContext receiver: aReceiver [
	^ nil


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> xmlWriterCode [
	^ self xmlWriterCodeUsingContext: self class context


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> xmlWriterCodeUsingContext: aContext [
	^ self xmlWriterCodeUsingContext: aContext receiver: self


]

{ #category : 'platypus-generated-deriving' }
ExChdAdaEntity >> xmlWriterCodeUsingContext: aContext receiver: aReceiver [
	^ nil


]
