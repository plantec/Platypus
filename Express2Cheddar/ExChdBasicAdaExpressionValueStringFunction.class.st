"
<ISO10303-11-EXPRESS>
FUNCTION basic_ada_expression_value_string ( e : expression ) : STRING;
	LOCAL 
		code : STRING := '';
	END_LOCAL;

	IF ( 'PLATYPUS_EXPRESSIONS_SCHEMA.IDENTIFIER' IN TYPEOF ( e ) ) THEN
		RETURN ( e.name );
	END_IF;

	IF ( 'PLATYPUS_EXPRESSIONS_SCHEMA.INTEGER_LITERAL' IN TYPEOF ( e ) ) THEN
		RETURN ( FORMAT ( e.val, 'I' ) );
	END_IF;

	IF ( 'PLATYPUS_EXPRESSIONS_SCHEMA.TRUE_CONSTANT' IN TYPEOF ( e ) ) THEN
		RETURN ( 'True' );
	END_IF;

	IF ( 'PLATYPUS_EXPRESSIONS_SCHEMA.FALSE_CONSTANT' IN TYPEOF ( e ) ) THEN
		RETURN ( 'False' );
	END_IF;

	IF ( 'PLATYPUS_EXPRESSIONS_SCHEMA.BINARY_EXPRESSION' IN TYPEOF ( e ) ) THEN
		RETURN ( '(' + basic_ada_expression_value_string ( e.left_expr ) + ' ' + e.op_string + ' ' + basic_ada_expression_value_string ( e.right_expr ) + ')' );
	END_IF;
	RETURN ( 'null' );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdBasicAdaExpressionValueStringFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'e',
		'code'
	],
	#category : 'Express2Cheddar-CheddarDomainsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDomainsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdBasicAdaExpressionValueStringFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdBasicAdaExpressionValueStringFunction class >> schemaDefinition [
	^ ExChdCheddarDomainsSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdBasicAdaExpressionValueStringFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdBasicAdaExpressionValueStringFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdBasicAdaExpressionValueStringFunction >> code [
	^ code


]

{ #category : 'platypus-generated-accessing' }
ExChdBasicAdaExpressionValueStringFunction >> code: aString [
	code := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdBasicAdaExpressionValueStringFunction >> e [
	^ e


]

{ #category : 'platypus-generated-accessing' }
ExChdBasicAdaExpressionValueStringFunction >> e: aExChdExpression [
	e := aExChdExpression


]

{ #category : 'platypus-generated-accessing' }
ExChdBasicAdaExpressionValueStringFunction >> fromValues: values [
	self e: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdBasicAdaExpressionValueStringFunction >> invoke [
	" ---------- locals assignments ----------"

	self code: ''.	" ---------- statements ----------"
	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self e;
				yourself)) includes: 'PLATYPUS_EXPRESSIONS_SCHEMA.IDENTIFIER')
		ifTrue: [ ^ self return: (self e nameUsingContext: self class context) ].
	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self e;
				yourself)) includes: 'PLATYPUS_EXPRESSIONS_SCHEMA.INTEGER_LITERAL')
		ifTrue: [ 
			^ self
				return:
					(PltFORMATFunction
						invokeFromValues:
							(OrderedCollection new
								add: (self e valUsingContext: self class context);
								add: 'I';
								yourself)) ].
	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self e;
				yourself)) includes: 'PLATYPUS_EXPRESSIONS_SCHEMA.TRUE_CONSTANT')
		ifTrue: [ ^ self return: 'True' ].
	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self e;
				yourself)) includes: 'PLATYPUS_EXPRESSIONS_SCHEMA.FALSE_CONSTANT')
		ifTrue: [ ^ self return: 'False' ].
	((PltTYPEOFFunction
		invokeFromValues:
			(OrderedCollection new
				add: self e;
				yourself)) includes: 'PLATYPUS_EXPRESSIONS_SCHEMA.BINARY_EXPRESSION')
		ifTrue: [ 
			^ self
				return:
					(((((('('
						pltPlus:
							(ExChdBasicAdaExpressionValueStringFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self e leftExprUsingContext: self class context);
										yourself))) pltPlus: ' ') pltPlus: (self e opStringUsingContext: self class context)) pltPlus: ' ')
						pltPlus:
							(ExChdBasicAdaExpressionValueStringFunction
								invokeFromValues:
									(OrderedCollection new
										add: (self e rightExprUsingContext: self class context);
										yourself))) pltPlus: ')') ].
	^ self return: 'null'


]
