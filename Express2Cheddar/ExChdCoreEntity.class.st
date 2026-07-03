Class {
	#name : 'ExChdCoreEntity',
	#superclass : 'Object',
	#category : 'Express2Cheddar',
	#package : 'Express2Cheddar'
}

{ #category : 'platypus-generated-context-accessing' }
ExChdCoreEntity class >> context [
	^ self schemaDefinition context


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCoreEntity class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCoreEntity class >> platypusMetaData [
	^ self schemaDefinition metaDataFor: self name asSymbol


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCoreEntity class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCoreEntity class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaArrayType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaAttributeReference [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaBagType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaBooleanType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaClass [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaClassDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaClassRefDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaClassReference [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaConstant [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaDoubleType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaEntity [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaEnumeration [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaIntegerType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaInterface [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaListType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaNamedTypeReference [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaNaturalType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaPackage [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaPrimitiveClassReference [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaPrimitiveType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaRealType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaRecordReference [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaSetType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAdaUnboundedStringType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdAttributeDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdBasicAdaTypeGetter [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdBasicAdaTypeValueFormat [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdCheddarDefinedType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdCheddarEntityDefinition [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdCheddarFunctionPtr [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdCheddarLawType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdCheddarPrimitiveType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdCheddarPriorityRange [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdCheddarXmlIdType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdCollectionDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdCompositeDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdConstrainedArrayType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdDiscriminatedType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdDiscriminatedTypeDiscriminant [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdDiscriminatedTypeDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdDiscriminatedTypeRefDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdDiscriminatedTypeUnion [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdDiscriminatedTypeUnionElementType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdDiscriminatedTypeUnionType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdDomainDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdEntityDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdEntityRefDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdExplicitTypeReference [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdGenericPackageInstanciation [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdInScopeAttribute [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdPackageAlias [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdPackageDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdPragmaConvention [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdRangeType [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdRecord [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdRecordDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdRecordRefDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdRootDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdSimpleDomainDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdUnknownDomainDtdElement [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdUnmappedEntityDefinition [
	^ false


]

{ #category : 'as yet unclassified' }
ExChdCoreEntity >> isExChdUnmappedTypeReference [
	^ false


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCoreEntity >> platypusMetaData [
	^ self class platypusMetaData


]
