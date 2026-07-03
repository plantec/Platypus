"
<ISO10303-11-EXPRESS>
FUNCTION ada_package_class_typeof_list ( pkg : ada_package ) : STRING;
	LOCAL 
		result : STRING := '';
		classes : LIST OF ada_class := QUERY ( e <* pkg.entities | 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( e ) );
	END_LOCAL;

	REPEAT no := LOINDEX ( classes ) TO HIINDEX ( classes );

		ALIAS curr FOR classes [ no];
			result := result + curr.name + '(';
			result := result + StringAggregateConcatSeparatedBy ( TYPEOF ( curr ), ',' );
			result := result + ')\n';
		END_ALIAS;
	END_REPEAT;
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaPackageClassTypeofListFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'pkg',
		'result',
		'classes'
	],
	#category : 'Express2Cheddar-PackageSchema',
	#package : 'Express2Cheddar',
	#tag : 'PackageSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaPackageClassTypeofListFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaPackageClassTypeofListFunction class >> schemaDefinition [
	^ ExChdPackageSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaPackageClassTypeofListFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaPackageClassTypeofListFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageClassTypeofListFunction >> classes [
	^ classes


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageClassTypeofListFunction >> classes: aListOfExChdAdaClass [
	classes := aListOfExChdAdaClass
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdAdaClass as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageClassTypeofListFunction >> fromValues: values [
	self pkg: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaPackageClassTypeofListFunction >> invoke [
	" ---------- locals assignments ----------"

	self result: ''.
	self
		classes:
			((self pkg entitiesUsingContext: self class context)
				select: [ :e1724 | 
					(PltTYPEOFFunction
						invokeFromValues:
							(OrderedCollection new
								add: e1724;
								yourself)) includes: 'RECORD_AND_CLASS.ADA_CLASS' ]).	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no1950 | 
			PlatypusCoreAliasStatement
				alias: (self classes pltAt: no1950)
				statementsBlock: [ :curr3060 | 
					self result: ((self result pltPlus: (curr3060 nameUsingContext: self class context)) pltPlus: '(').
					self
						result:
							(self result
								pltPlus:
									(PTsStringAggregateConcatSeparatedByFunction
										invokeFromValues:
											(OrderedCollection new
												add:
														(PltTYPEOFFunction
																invokeFromValues:
																	(OrderedCollection new
																		add: curr3060;
																		yourself));
												add: ',';
												yourself))).
					self result: (self result pltPlus: ')\n') ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self classes;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self classes;
						yourself)).
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageClassTypeofListFunction >> pkg [
	^ pkg


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageClassTypeofListFunction >> pkg: aExChdAdaPackage [
	pkg := aExChdAdaPackage


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageClassTypeofListFunction >> result [
	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaPackageClassTypeofListFunction >> result: aString [
	result := aString


]
