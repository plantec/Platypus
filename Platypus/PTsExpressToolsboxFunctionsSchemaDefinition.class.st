Class {
	#name : #PTsExpressToolsboxFunctionsSchemaDefinition,
	#superclass : #PlatypusCoreSchema,
	#category : #'Platypus-ExpressToolsboxFunctionsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PTsExpressToolsboxFunctionsSchemaDefinition class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-platypus-signature' }
PTsExpressToolsboxFunctionsSchemaDefinition class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
PTsExpressToolsboxFunctionsSchemaDefinition class >> vwNamespaceName [
	^ #PTs


]

{ #category : #'platypus-generated-context-accessing' }
PTsExpressToolsboxFunctionsSchemaDefinition >> context [
	^ self schemaInstance context


]

{ #category : #'platypus-generated-entities' }
PTsExpressToolsboxFunctionsSchemaDefinition >> entityDefinitionCount [
	^ 0


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration1 [
	^ #(#string_ends_with #PTsStringEndsWithFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration10 [
	^ #(#capitalize #PTsCapitalizeFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration11 [
	^ #(#lowerize #PTsLowerizeFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration12 [
	^ #(#upperize #PTsUpperizeFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration13 [
	^ #(#ToString #PTsToStringFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration14 [
	^ #(#numbered_name #PTsNumberedNameFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration15 [
	^ #(#allModelInstances #PTsAllModelInstancesFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration16 [
	^ #(#askForExpressDictionaryMetaData #PTsAskForExpressDictionaryMetaDataFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration2 [
	^ #(#string_replace #PTsStringReplaceFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration3 [
	^ #(#SmalltalkCodeOf #PTsSmalltalkCodeOfFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration4 [
	^ #(#StringAggregateConcatSeparatedBy #PTsStringAggregateConcatSeparatedByFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration5 [
	^ #(#LinesFromString #PTsLinesFromStringFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration6 [
	^ #(#SetToAggregate #PTsSetToAggregateFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration7 [
	^ #(#SetToList #PTsSetToListFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration8 [
	^ #(#ListToSet #PTsListToSetFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclaration9 [
	^ #(#AggregateToSet #PTsAggregateToSetFunction)


]

{ #category : #'platypus-generated-functions' }
PTsExpressToolsboxFunctionsSchemaDefinition >> functionDeclarationCount [
	^ 16


]

{ #category : #'platypus-generated-meta-data-accessing' }
PTsExpressToolsboxFunctionsSchemaDefinition >> schemaInstanceClassName [
	^ #PTsExpressToolsboxSchemaInstance


]
