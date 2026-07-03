"
<ISO10303-11-EXPRESS>
SCHEMA cheddar_constants;
	USE FROM express2cheddar_facade;
	USE FROM platypus_dictionary_schema;
	USE FROM cheddar_domains;
	USE FROM ada_interface;
	USE FROM express_dictionary_queries;
	USE FROM express_toolsbox_functions;

	ENTITY ada_constant 
		SUBTYPE OF ( constant_definition );
		final : BOOLEAN;
		other_initializer : OPTIONAL STRING;
	DERIVE
		ads_code : STRING := ada_constant_ads_code ( SELF );
		adb_code : STRING := '';
		ads_interfaces_list : LIST OF ada_interface := ada_constant_interfaces_list ( SELF, true );
		adb_interfaces_list : LIST OF ada_interface := [ ];
	END_ENTITY;

	FUNCTION do_comments_with ( src : STRING ) : STRING;
		(*#  "" comments "" 
		| r s |
		r := ''.
		s :=  self src val.
		s linesDo: [:l | r := r , '--', l, String cr]. 
		self return: (PltStringLiteral val: r)
     		 #*) (*# <pharo> "" comments "" 
		| r s |
		r := ''.
		s :=  self src.
		s linesDo: [:l | r := r , '--', l, String cr]. 
		^ self return: r  #*) END_FUNCTION;

	FUNCTION ada_constant_ads_code ( c : ada_constant ) : STRING;
		LOCAL 
			code : STRING := '';
			remarks : LIST OF remark := remarks_for ( c );
			rem : STRING;
			domain : dictionary_instance := basic_ada_domain ( c.domain );
		END_LOCAL;

		IF ( SIZEOF ( remarks ) > 0 ) THEN
			REPEAT no := LOINDEX ( remarks ) TO HIINDEX ( remarks );
				rem := clean_remark_text_of ( remarks [ no] );
				rem := do_comments_with ( rem );
				code := code + rem;
			END_REPEAT;
		END_IF;
		code := code + c.name + ' : ';

		IF c.final THEN
			code := code + 'constant ';
		END_IF;
		code := code + domain.ada_ref_ident;

		IF NOT EXISTS ( c.other_initializer ) THEN
			code := code + ' := ' + basic_ada_type_value_format ( c.initializer, ? ).formated + ';';
		ELSE
			IF c.other_initializer > '' THEN
				code := code + ' := ' + c.other_initializer;
			END_IF;
			code := code + ';';
		END_IF;
		code := code + '\n';
		RETURN ( code );
	END_FUNCTION;

	FUNCTION ada_constant_interfaces_list ( r : ada_constant; ads : BOOLEAN ) : LIST OF ada_interface;
		LOCAL 
			result : LIST OF ada_interface := [ ];
			ada_domain : entity_instance;
		END_LOCAL;
		ada_domain := basic_ada_domain ( r.domain );
		result := domain_interfaces_list ( ada_domain, ads, r.owner );
		RETURN ( result );
	END_FUNCTION;
END_SCHEMA;

</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdCheddarConstantsSchemaDefinition',
	#superclass : 'PlatypusCoreSchema',
	#category : 'Express2Cheddar-CheddarConstantsSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarConstantsSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarConstantsSchemaDefinition class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarConstantsSchemaDefinition class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarConstantsSchemaDefinition class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-context-accessing' }
ExChdCheddarConstantsSchemaDefinition >> context [

	^ self schemaInstance context


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarConstantsSchemaDefinition >> entityDefinition1 [

	^ #( #ada_constant #ExChdAdaConstant )


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarConstantsSchemaDefinition >> entityDefinitionCount [

	^ 1


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarConstantsSchemaDefinition >> functionDeclaration1 [

	^ #( #do_comments_with #ExChdDoCommentsWithFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarConstantsSchemaDefinition >> functionDeclaration2 [

	^ #( #ada_constant_ads_code #ExChdAdaConstantAdsCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarConstantsSchemaDefinition >> functionDeclaration3 [

	^ #( #ada_constant_interfaces_list #ExChdAdaConstantInterfacesListFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarConstantsSchemaDefinition >> functionDeclarationCount [

	^ 3


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarConstantsSchemaDefinition >> schemaInstanceClassName [

	^ #ExChdExpress2cheddarSchemaInstance


]
