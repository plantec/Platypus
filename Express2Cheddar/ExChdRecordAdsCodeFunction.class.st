"
<ISO10303-11-EXPRESS>
FUNCTION record_ads_code ( rec : record ) : STRING;
	LOCAL 
		result : STRING;
		domain : entity_instance;
	END_LOCAL;
	result := '\n' 
	+ '-- --------= ' + rec.name + ' =--------\n\n' 

	+ 'type ' + rec.name + ' is\nrecord\n';

	REPEAT no := LOINDEX ( rec.attributes ) TO HIINDEX ( rec.attributes );
		result := result + ' ' + rec.attributes [ no].name + ' : ';
		domain := basic_ada_domain ( rec.attributes [ no].domain );

		IF domain.handled.refed_by_pointer THEN
			result := result + domain.handled.ptr_type + ';\n';
		ELSE
			result := result + domain.ada_ref_ident + ';\n';
		END_IF;
	END_REPEAT;
	result := result + 'end record;\n\n' 

	+ 'procedure Initialize(obj : out ' + rec.name + ');\n' 
	+ 'procedure Put(obj : in ' + rec.name + ');\n' 
	+ 'procedure Put(obj : in ' + rec.ptr_type + ');\n' 
	+ 'function Copy(obj : in ' + rec.ptr_type + ') return ' + rec.ptr_type + ';\n' 
	+ 'function Copy(obj : in ' + rec.name + ') return ' + rec.ptr_type + ';\n' 
	+ 'procedure Build_Attributes_XML_String(obj : in ' + rec.name + '; result : in out Unbounded_String);\n' 
	+ 'function XML_String(obj : in ' + rec.name + ') return Unbounded_String;\n' 
	+ 'function XML_String(obj : in ' + rec.ptr_type + ') return Unbounded_String;\n' 
	+ 'function XML_Ref_String(obj : in ' + rec.name + ') return Unbounded_String;\n' 
	+ 'procedure Free  is new Unchecked_Deallocation (' + rec.name + ', ' + rec.ptr_type + ');\n';
	RETURN ( result );
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdRecordAdsCodeFunction',
	#superclass : 'PlatypusCoreAlgorithmDeclaration',
	#instVars : [
		'rec',
		'result',
		'domain'
	],
	#category : 'Express2Cheddar-RecordAndClassSchema',
	#package : 'Express2Cheddar',
	#tag : 'RecordAndClassSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordAdsCodeFunction class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdRecordAdsCodeFunction class >> schemaDefinition [
	^ ExChdRecordAndClassSchemaDefinition singleton


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordAdsCodeFunction class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdRecordAdsCodeFunction class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordAdsCodeFunction >> domain [
	^ domain


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordAdsCodeFunction >> domain: aExChdEntityInstance [
	domain := aExChdEntityInstance


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordAdsCodeFunction >> fromValues: values [
	self rec: (values at: 1)


]

{ #category : 'platypus-generated-invoking' }
ExChdRecordAdsCodeFunction >> invoke [
	" ---------- locals assignments ----------"

	" ---------- statements ----------"

	self
		result:
			(((((('\n' pltPlus: '-- --------= ') pltPlus: (self rec nameUsingContext: self class context)) pltPlus: ' =--------\n\n')
				pltPlus: 'type ') pltPlus: (self rec nameUsingContext: self class context)) pltPlus: ' is\nrecord\n').
	PlatypusCoreRepeatStatement
		repeat: [ :no1816 | 
			self
				result:
					(((self result pltPlus: ' ')
						pltPlus:
							(((self rec attributesUsingContext: self class context) pltAt: no1816) nameUsingContext: self class context))
						pltPlus: ' : ').
			self
				domain:
					(ExChdBasicAdaDomainFunction
						invokeFromValues:
							(OrderedCollection new
								add:
										(((self rec attributesUsingContext: self class context) pltAt: no1816) domainUsingContext: self class context);
								yourself)).
			((self domain handledUsingContext: self class context) refedByPointerUsingContext: self class context)
				ifTrue: [ 
					self
						result:
							((self result pltPlus: ((self domain handledUsingContext: self class context) ptrTypeUsingContext: self class context))
								pltPlus: ';\n') ]
				ifFalse: [ self result: ((self result pltPlus: (self domain adaRefIdentUsingContext: self class context)) pltPlus: ';\n') ] ]
		from:
			(PltLOINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self rec attributesUsingContext: self class context);
						yourself))
		to:
			(PltHIINDEXFunction
				invokeFromValues:
					(OrderedCollection new
						add: (self rec attributesUsingContext: self class context);
						yourself)).
	self
		result:
			(((((((((((((((((((((((((((((((((((((self result pltPlus: 'end record;\n\n') pltPlus: 'procedure Initialize(obj : out ')
				pltPlus: (self rec nameUsingContext: self class context)) pltPlus: ');\n') pltPlus: 'procedure Put(obj : in ')
				pltPlus: (self rec nameUsingContext: self class context)) pltPlus: ');\n') pltPlus: 'procedure Put(obj : in ')
				pltPlus: (self rec ptrTypeUsingContext: self class context)) pltPlus: ');\n') pltPlus: 'function Copy(obj : in ')
				pltPlus: (self rec ptrTypeUsingContext: self class context)) pltPlus: ') return ')
				pltPlus: (self rec ptrTypeUsingContext: self class context)) pltPlus: ';\n') pltPlus: 'function Copy(obj : in ')
				pltPlus: (self rec nameUsingContext: self class context)) pltPlus: ') return ')
				pltPlus: (self rec ptrTypeUsingContext: self class context)) pltPlus: ';\n')
				pltPlus: 'procedure Build_Attributes_XML_String(obj : in ') pltPlus: (self rec nameUsingContext: self class context))
				pltPlus: '; result : in out Unbounded_String);\n') pltPlus: 'function XML_String(obj : in ')
				pltPlus: (self rec nameUsingContext: self class context)) pltPlus: ') return Unbounded_String;\n')
				pltPlus: 'function XML_String(obj : in ') pltPlus: (self rec ptrTypeUsingContext: self class context))
				pltPlus: ') return Unbounded_String;\n') pltPlus: 'function XML_Ref_String(obj : in ')
				pltPlus: (self rec nameUsingContext: self class context)) pltPlus: ') return Unbounded_String;\n')
				pltPlus: 'procedure Free  is new Unchecked_Deallocation (') pltPlus: (self rec nameUsingContext: self class context))
				pltPlus: ', ') pltPlus: (self rec ptrTypeUsingContext: self class context)) pltPlus: ');\n').
	^ self return: self result


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordAdsCodeFunction >> rec [
	^ rec


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordAdsCodeFunction >> rec: aExChdRecord [
	rec := aExChdRecord


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordAdsCodeFunction >> result [
	^ result


]

{ #category : 'platypus-generated-accessing' }
ExChdRecordAdsCodeFunction >> result: aString [
	result := aString


]
