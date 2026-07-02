"
<ISO10303-11-EXPRESS>
FUNCTION compute_implicit_domains ( r : root_dtd_element ) : LIST OF entity_ref_dtd_element;
	LOCAL 
		refed : LIST OF entity_ref_dtd_element := r.referenced_entities;
		decl : LIST OF dtd_element := r.declared_domains;
		decl_domain : LIST OF entity_instance := [ ];
		not_declared : LIST OF entity_ref_dtd_element := [ ];
	END_LOCAL;

	REPEAT no := LOINDEX ( decl ) TO HIINDEX ( decl );

		ALIAS curr FOR decl [ no];
			decl_domain := decl_domain + curr.domain;
		END_ALIAS;
	END_REPEAT;

	REPEAT no := LOINDEX ( refed ) TO HIINDEX ( refed );

		ALIAS curr FOR refed [ no];
			IF NOT ( curr.domain IN decl_domain ) AND NOT ( curr IN not_declared ) THEN
				not_declared := not_declared + curr;
			END_IF;
		END_ALIAS;
	END_REPEAT;
	RETURN ( not_declared );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #ExChdComputeImplicitDomainsFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		'r',
		'refed',
		'decl',
		'declDomain',
		'notDeclared'
	],
	#category : #'Express2Cheddar-CheddarDtdSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeImplicitDomainsFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
ExChdComputeImplicitDomainsFunction class >> schemaDefinition [
	^ ExChdCheddarDtdSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeImplicitDomainsFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : #'platypus-generated-platypus-signature' }
ExChdComputeImplicitDomainsFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeImplicitDomainsFunction >> decl [
	^ decl


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeImplicitDomainsFunction >> decl: aListOfExChdDtdElement [
	decl := aListOfExChdDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdDtdElement as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeImplicitDomainsFunction >> declDomain [
	^ declDomain


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeImplicitDomainsFunction >> declDomain: aListOfExChdEntityInstance [
	declDomain := aListOfExChdEntityInstance
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdEntityInstance as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeImplicitDomainsFunction >> fromValues: values [
	self r: (values at: 1)


]

{ #category : #'platypus-generated-invoking' }
ExChdComputeImplicitDomainsFunction >> invoke [
	" ---------- locals assignments ----------"

	self refed: (self r referencedEntitiesUsingContext: self class context).
	self decl: (self r declaredDomainsUsingContext: self class context).
	self declDomain: Array new.
	self notDeclared: Array new.	" ---------- statements ----------"
	PlatypusCoreRepeatStatement
		repeat: [ :no3218 | 
			PlatypusCoreAliasStatement
				alias: (self decl pltAt: no3218)
				statementsBlock: [ :curr228 | self declDomain: (self declDomain pltPlus: (curr228 domainUsingContext: self class context)) ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self decl;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self decl;
						yourself)).
	PlatypusCoreRepeatStatement
		repeat: [ :no369 | 
			PlatypusCoreAliasStatement
				alias: (self refed pltAt: no369)
				statementsBlock: [ :curr1479 | 
					((self declDomain includes: (curr1479 domainUsingContext: self class context)) not
						and: [ (self notDeclared includes: curr1479) not ])
						ifTrue: [ self notDeclared: (self notDeclared pltPlus: curr1479) ] ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self refed;
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: self refed;
						yourself)).
	^ self return: self notDeclared


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeImplicitDomainsFunction >> notDeclared [
	^ notDeclared


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeImplicitDomainsFunction >> notDeclared: aListOfExChdEntityRefDtdElement1 [
	notDeclared := aListOfExChdEntityRefDtdElement1
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdEntityRefDtdElement1 as: OrderedCollection ]


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeImplicitDomainsFunction >> r [
	^ r


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeImplicitDomainsFunction >> r: aExChdRootDtdElement [
	r := aExChdRootDtdElement


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeImplicitDomainsFunction >> refed [
	^ refed


]

{ #category : #'platypus-generated-accessing' }
ExChdComputeImplicitDomainsFunction >> refed: aListOfExChdEntityRefDtdElement [
	refed := aListOfExChdEntityRefDtdElement
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ aListOfExChdEntityRefDtdElement as: OrderedCollection ]


]
