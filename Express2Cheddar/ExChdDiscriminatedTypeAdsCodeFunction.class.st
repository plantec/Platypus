"
<ISO10303-11-EXPRESS>
FUNCTION discriminated_type_ads_code ( typ : discriminated_type ) : STRING;
	LOCAL 
		result : STRING;
		discrim_attr : attribute := typ.discriminant;
		discrim_type : entity_instance := discrim_attr.domain.handled;
		union_attr : attribute := typ.union_attr;
		union_type : defined_type := union_attr.domain.handled;
		union_selections : LIST OF attribute := inherited_explicit_attributes ( union_type );
		domain : entity_instance;
		transl_attrs : LIST OF attribute := typ.translated_attributes;
	END_LOCAL;
	result := 'type ' + typ.name + ' (' + discrim_attr.name + ' : ' + discrim_type.name + ' ) is record\n';

	REPEAT no := LOINDEX ( transl_attrs ) TO HIINDEX ( transl_attrs );

		ALIAS attr FOR transl_attrs [ no];
			domain := basic_ada_domain ( attr.domain );
			IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( domain.handled ) ) THEN
				result := result + '\t' + attr.name + ' : ' + domain.handled.ptr_type + ';\n';
			ELSE
				result := result + '\t' + attr.name + ' : ' + domain.ada_ref_ident + ';\n';
			END_IF;
		END_ALIAS;
	END_REPEAT;
	result := result + '\tcase ' + discrim_attr.name + ' is \n' 
	+ union_type.union_ads_code + '\tend case;\nend record;\n\n' 

	+ 'type ' + typ.ptr_type + ' is access all ' + typ.name + ';\n' 
	+ '\nprocedure Initialize(obj : out ' + typ.ptr_type + ');\n' 
	+ '\nprocedure Put(obj : in ' + typ.ptr_type + ');\n' 
	+ 'function Copy(obj : in ' + typ.ptr_type + ') return ' + typ.ptr_type + ';\n' 
	+ 'function Copy(obj : in ' + typ.name + ') return ' + typ.ptr_type + ';\n' 
	+ 'function XML_String(obj : in ' + typ.name + ') return Unbounded_String;\n' 
	+ '\nfunction XML_String(obj : in ' + typ.ptr_type + ') return Unbounded_String;\n' 
	+ 'procedure Free  is new Unchecked_Deallocation (' + typ.name + ', ' + typ.ptr_type + ');\n' 
	+ 'function XML_Ref_String(obj : in ' + typ.name + ') return Unbounded_String;\n' 
	+ '\nfunction XML_Ref_String(obj : in ' + typ.ptr_type + ') return Unbounded_String;\n';
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdDiscriminatedTypeAdsCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'typ',
		'result',
		'discrimAttr',
		'discrimType',
		'unionAttr',
		'unionType',
		'unionSelections',
		'domain',
		'translAttrs'
	],
	#category : 'Express2Cheddar-DiscriminatedTypeSchema',
	#package : 'Express2Cheddar',
	#tag : 'DiscriminatedTypeSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAdsCodeFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction class >> schemaDefinition [

	^ ExChdDiscriminatedTypeSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAdsCodeFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdDiscriminatedTypeAdsCodeFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> discrimAttr [

	^ discrimAttr


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> discrimAttr: aExChdAttribute [

	discrimAttr := aExChdAttribute


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> discrimType [

	^ discrimType


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> discrimType: aExChdEntityInstance [

	discrimType := aExChdEntityInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> domain [

	^ domain


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> domain: aExChdEntityInstance1 [

	domain := aExChdEntityInstance1


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> fromValues: values [

	self typ: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdDiscriminatedTypeAdsCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self discrimAttr:
		(self typ discriminantUsingContext: self class context).
	self discrimType:
		((self discrimAttr domainUsingContext: self class context)
			 handledUsingContext: self class context).
	self unionAttr: (self typ unionAttrUsingContext: self class context).
	self unionType:
		((self unionAttr domainUsingContext: self class context)
			 handledUsingContext: self class context).
	self unionSelections:
		(PTsInheritedExplicitAttributesFunction invokeFromValues:
			 (OrderedCollection new
				  add: self unionType;
				  yourself)).
	self translAttrs:
		(self typ translatedAttributesUsingContext: self class context). " ---------- statements ----------"
	self result:
		(((((('type ' pltPlus:
			      (self typ nameUsingContext: self class context)) pltPlus:
			     ' (') pltPlus:
			    (self discrimAttr nameUsingContext: self class context))
			   pltPlus: ' : ') pltPlus:
			  (self discrimType nameUsingContext: self class context))
			 pltPlus: ' ) is record\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no4160813 |
				PlatypusCoreAliasStatement
					alias: (self translAttrs pltAt: no4160813)
					statementsBlock: [ :attr3354105 |
							self domain:
								(ExChdBasicAdaDomainFunction invokeFromValues:
									 (OrderedCollection new
										  add: (attr3354105 domainUsingContext: self class context);
										  yourself)).
							((PltTYPEOFFunction invokeFromValues: (OrderedCollection new
									   add: (self domain handledUsingContext: self class context);
									   yourself)) includes: 'RECORD_AND_CLASS.ADA_CLASS')
								ifTrue: [
										self result: (((((self result pltPlus: '\t') pltPlus:
												    (attr3354105 nameUsingContext: self class context))
												   pltPlus: ' : ') pltPlus:
												  ((self domain handledUsingContext: self class context)
													   ptrTypeUsingContext: self class context)) pltPlus:
												 ';\n') ]
								ifFalse: [
										self result: (((((self result pltPlus: '\t') pltPlus:
												    (attr3354105 nameUsingContext: self class context))
												   pltPlus: ' : ') pltPlus:
												  (self domain adaRefIdentUsingContext: self class context))
												 pltPlus: ';\n') ] ] ]
		from: (PltLOINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self translAttrs;
					  yourself))
		to: (PltHIINDEXFunction invokeFromValues: (OrderedCollection new
					  add: self translAttrs;
					  yourself)).
	self result:
		(((((((((((((((((((((((((((((((((((((((((((self result pltPlus:
			                                           '\tcase ') pltPlus:
			                                          (self discrimAttr
				                                           nameUsingContext:
				                                           self class context))
			                                         pltPlus: ' is \n')
			                                        pltPlus:
			                                        (self unionType
				                                         unionAdsCodeUsingContext:
				                                         self class context))
			                                       pltPlus:
			                                       '\tend case;\nend record;\n\n')
			                                      pltPlus: 'type ') pltPlus:
			                                     (self typ
				                                      ptrTypeUsingContext:
				                                      self class context))
			                                    pltPlus: ' is access all ')
			                                   pltPlus:
			                                   (self typ nameUsingContext:
				                                    self class context)) pltPlus:
			                                  ';\n') pltPlus:
			                                 '\nprocedure Initialize(obj : out ')
			                                pltPlus:
			                                (self typ ptrTypeUsingContext:
				                                 self class context)) pltPlus:
			                               ');\n') pltPlus:
			                              '\nprocedure Put(obj : in ')
			                             pltPlus:
			                             (self typ ptrTypeUsingContext:
				                              self class context)) pltPlus: ');\n')
			                           pltPlus: 'function Copy(obj : in ')
			                          pltPlus:
			                          (self typ ptrTypeUsingContext:
				                           self class context)) pltPlus:
			                         ') return ') pltPlus:
			                        (self typ ptrTypeUsingContext:
				                         self class context)) pltPlus: ';\n')
			                      pltPlus: 'function Copy(obj : in ') pltPlus:
			                     (self typ nameUsingContext: self class context))
			                    pltPlus: ') return ') pltPlus:
			                   (self typ ptrTypeUsingContext:
				                    self class context)) pltPlus: ';\n') pltPlus:
			                 'function XML_String(obj : in ') pltPlus:
			                (self typ nameUsingContext: self class context))
			               pltPlus: ') return Unbounded_String;\n') pltPlus:
			              '\nfunction XML_String(obj : in ') pltPlus:
			             (self typ ptrTypeUsingContext: self class context))
			            pltPlus: ') return Unbounded_String;\n') pltPlus:
			           'procedure Free  is new Unchecked_Deallocation (')
			          pltPlus: (self typ nameUsingContext: self class context))
			         pltPlus: ', ') pltPlus:
			        (self typ ptrTypeUsingContext: self class context))
			       pltPlus: ');\n') pltPlus:
			      'function XML_Ref_String(obj : in ') pltPlus:
			     (self typ nameUsingContext: self class context)) pltPlus:
			    ') return Unbounded_String;\n') pltPlus:
			   '\nfunction XML_Ref_String(obj : in ') pltPlus:
			  (self typ ptrTypeUsingContext: self class context)) pltPlus:
			 ') return Unbounded_String;\n').
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> result [

	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> result: aString [

	result := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> translAttrs [

	^ translAttrs


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> translAttrs: aListOfExChdAttribute1 [

	translAttrs := aListOfExChdAttribute1
		               ifNil: [ OrderedCollection new ]
		               ifNotNil: [
		               aListOfExChdAttribute1 as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> typ [

	^ typ


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> typ: aExChdDiscriminatedType [

	typ := aExChdDiscriminatedType


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> unionAttr [

	^ unionAttr


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> unionAttr: aExChdAttribute1 [

	unionAttr := aExChdAttribute1


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> unionSelections [

	^ unionSelections


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> unionSelections: aListOfExChdAttribute [

	unionSelections := aListOfExChdAttribute
		                   ifNil: [ OrderedCollection new ]
		                   ifNotNil: [
		                   aListOfExChdAttribute as: OrderedCollection ]


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> unionType [

	^ unionType


]

{ #category : 'platypus-generated-accessing' }
ExChdDiscriminatedTypeAdsCodeFunction >> unionType: aExChdDefinedType [

	unionType := aExChdDefinedType


]
