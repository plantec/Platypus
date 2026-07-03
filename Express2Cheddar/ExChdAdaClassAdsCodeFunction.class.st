"
<ISO10303-11-EXPRESS>
FUNCTION ada_class_ads_code ( cip : ada_class; with_private : BOOLEAN ) : STRING;
	LOCAL 
		result : STRING;
		abstr : STRING := '';
		local_sup : entity_definition := local_root_supertype_of ( cip );
	END_LOCAL;
	result := '\n' 
	+ '-- --------= ' + cip.name + ' =--------\n\n';

	IF SIZEOF ( cip.supertypes ) > 0 THEN

		ALIAS supref FOR cip.supertypes [ 1 ].ref;
			result := result + 'type ' + cip.name + ' is ' + abstr + 'new ' + supref.ada_ident + ' with ';
		END_ALIAS;
	ELSE
		result := result + 'type ' + cip.name + ' is ' + abstr + 'new Ada.Finalization.Controlled with ';
	END_IF;

	IF with_private THEN
		result := result + 'private;\n';
	ELSE
		result := result + ada_class_attributes_ads_code ( cip );
	END_IF;
	result := result + '\nprocedure Initialize(obj : in out ' + cip.name + ');\n' 
	+ 'procedure Put(obj : in ' + cip.name + ');\n' 
	+ 'procedure Put(obj : in ' + cip.ptr_type + ');\n';
	result := result + 'procedure Put_Name(obj : in ' + cip.ptr_type + ');\n';
	result := result + 'procedure Build_Attributes_XML_String(obj : in ' + cip.name + '; result : in out Unbounded_String);\n' 
	+ 'function XML_String(obj : in ' + cip.name + ') return Unbounded_String;\n' 
	+ 'function XML_String(obj : in ' + cip.ptr_type + ') return Unbounded_String;\n' 
	+ 'function XML_Ref_String(obj : in ' + cip.name + ') return Unbounded_String;\n' 
	+ 'function XML_Ref_String(obj : in ' + cip.ptr_type + ') return Unbounded_String;\n';

	IF is_named_object ( cip ) THEN
		result := result + 'function Get_Name (obj : in ' + cip.name + ') return Unbounded_String;\n' 
		+ 'function Get_Name (obj : in ' + cip.ptr_type + ') return Unbounded_String;\n';
	END_IF;
	result := result + 'function Copy(obj : in ' + cip.ptr_type + ') return ' + local_sup.ptr_type + ';\n' 
	+ 'function Copy(obj : in ' + cip.name + ') return ' + local_sup.ptr_type + ';\n' 
	+ 'function type_of(obj : in ' + cip.name + ') return unbounded_string_list;\n' 
	+ 'function type_of(obj : in ' + cip.ptr_type + ') return unbounded_string_list;\n' 
	+ 'procedure Free  is new Unchecked_Deallocation (' + cip.name + '''Class, ' + cip.ptr_type + ');\n';
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaClassAdsCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'cip',
		'withPrivate',
		'result',
		'abstr',
		'localSup'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassAdsCodeFunction class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaClassAdsCodeFunction class >> schemaDefinition [

	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassAdsCodeFunction class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaClassAdsCodeFunction class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAdsCodeFunction >> abstr [

	^ abstr


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAdsCodeFunction >> abstr: aString1 [

	abstr := aString1


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAdsCodeFunction >> cip [

	^ cip


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAdsCodeFunction >> cip: aExChdAdaClass [

	cip := aExChdAdaClass


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAdsCodeFunction >> cip: aExChdAdaClass withPrivate: aBoolean [

	self cip: aExChdAdaClass.
	self withPrivate: aBoolean


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAdsCodeFunction >> fromValues: values [

	self cip: (values at: 1).
	self withPrivate: (values at: 2)


]

{ #category : 'platypus-generated-invoking' }
ExChdAdaClassAdsCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	self abstr: ''.
	self localSup: (PTsLocalRootSupertypeOfFunction invokeFromValues:
			 (OrderedCollection new
				  add: self cip;
				  yourself)). " ---------- statements ----------"
	self result: ((('\n' pltPlus: '-- --------= ') pltPlus:
			  (self cip nameUsingContext: self class context)) pltPlus:
			 ' =--------\n\n').
	(PltSIZEOFFunction invokeFromValues: (OrderedCollection new
			  add: (self cip supertypesUsingContext: self class context);
			  yourself)) > 0
		ifTrue: [
				PlatypusCoreAliasStatement
					alias:
						(((self cip supertypesUsingContext: self class context) pltAt: 1)
							 refUsingContext: self class context)
					statementsBlock: [ :supref2353199 |
							self result: (((((((self result pltPlus: 'type ') pltPlus:
									      (self cip nameUsingContext: self class context))
									     pltPlus: ' is ') pltPlus: self abstr) pltPlus: 'new ')
									  pltPlus:
									  (supref2353199 adaIdentUsingContext: self class context))
									 pltPlus: ' with ') ] ]
		ifFalse: [
				self result: (((((self result pltPlus: 'type ') pltPlus:
						    (self cip nameUsingContext: self class context)) pltPlus:
						   ' is ') pltPlus: self abstr) pltPlus:
						 'new Ada.Finalization.Controlled with ') ].
	self withPrivate
		ifTrue: [ self result: (self result pltPlus: 'private;\n') ]
		ifFalse: [
				self result: (self result pltPlus:
						 (ExChdAdaClassAttributesAdsCodeFunction invokeFromValues:
							  (OrderedCollection new
								   add: self cip;
								   yourself))) ].
	self result:
		(((((((((self result pltPlus: '\nprocedure Initialize(obj : in out ')
			        pltPlus: (self cip nameUsingContext: self class context))
			       pltPlus: ');\n') pltPlus: 'procedure Put(obj : in ')
			     pltPlus: (self cip nameUsingContext: self class context))
			    pltPlus: ');\n') pltPlus: 'procedure Put(obj : in ') pltPlus:
			  (self cip ptrTypeUsingContext: self class context)) pltPlus:
			 ');\n').
	self result:
		(((self result pltPlus: 'procedure Put_Name(obj : in ') pltPlus:
			  (self cip ptrTypeUsingContext: self class context)) pltPlus:
			 ');\n').
	self result: (((((((((((((((self result pltPlus:
			               'procedure Build_Attributes_XML_String(obj : in ')
			              pltPlus:
			              (self cip nameUsingContext: self class context))
			             pltPlus: '; result : in out Unbounded_String);\n')
			            pltPlus: 'function XML_String(obj : in ') pltPlus:
			           (self cip nameUsingContext: self class context))
			          pltPlus: ') return Unbounded_String;\n') pltPlus:
			         'function XML_String(obj : in ') pltPlus:
			        (self cip ptrTypeUsingContext: self class context))
			       pltPlus: ') return Unbounded_String;\n') pltPlus:
			      'function XML_Ref_String(obj : in ') pltPlus:
			     (self cip nameUsingContext: self class context)) pltPlus:
			    ') return Unbounded_String;\n') pltPlus:
			   'function XML_Ref_String(obj : in ') pltPlus:
			  (self cip ptrTypeUsingContext: self class context)) pltPlus:
			 ') return Unbounded_String;\n').
	(ExChdIsNamedObjectFunction invokeFromValues: (OrderedCollection new
			  add: self cip;
			  yourself)) ifTrue: [
			self result:
				((((((self result pltPlus: 'function Get_Name (obj : in ')
					     pltPlus: (self cip nameUsingContext: self class context))
					    pltPlus: ') return Unbounded_String;\n') pltPlus:
					   'function Get_Name (obj : in ') pltPlus:
					  (self cip ptrTypeUsingContext: self class context)) pltPlus:
					 ') return Unbounded_String;\n') ].
	self result:
		(((((((((((((((((((((self result pltPlus: 'function Copy(obj : in ')
			                    pltPlus:
			                    (self cip ptrTypeUsingContext:
				                     self class context)) pltPlus: ') return ')
			                  pltPlus:
			                  (self localSup ptrTypeUsingContext:
				                   self class context)) pltPlus: ';\n') pltPlus:
			                'function Copy(obj : in ') pltPlus:
			               (self cip nameUsingContext: self class context))
			              pltPlus: ') return ') pltPlus:
			             (self localSup ptrTypeUsingContext: self class context))
			            pltPlus: ';\n') pltPlus: 'function type_of(obj : in ')
			          pltPlus: (self cip nameUsingContext: self class context))
			         pltPlus: ') return unbounded_string_list;\n') pltPlus:
			        'function type_of(obj : in ') pltPlus:
			       (self cip ptrTypeUsingContext: self class context))
			      pltPlus: ') return unbounded_string_list;\n') pltPlus:
			     'procedure Free  is new Unchecked_Deallocation (') pltPlus:
			    (self cip nameUsingContext: self class context)) pltPlus:
			   '''Class, ') pltPlus:
			  (self cip ptrTypeUsingContext: self class context)) pltPlus:
			 ');\n').
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAdsCodeFunction >> localSup [

	^ localSup


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAdsCodeFunction >> localSup: aExChdEntityDefinition [

	localSup := aExChdEntityDefinition


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAdsCodeFunction >> result [

	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAdsCodeFunction >> result: aString [

	result := aString


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAdsCodeFunction >> withPrivate [

	^ withPrivate


]

{ #category : 'platypus-generated-accessing' }
ExChdAdaClassAdsCodeFunction >> withPrivate: aBoolean [

	withPrivate := aBoolean


]
