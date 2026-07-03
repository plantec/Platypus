"
<ISO10303-11-EXPRESS>
SCHEMA package;
	USE FROM platypus_dictionary_schema;
	USE FROM express_toolsbox_functions;
	USE FROM express_dictionary_queries;
	USE FROM express2cheddar_facade;
	USE FROM record_and_class;
	USE FROM cheddar_domains;
	USE FROM ada_interface;
	USE FROM cheddar_constants;
	USE FROM xml_io;

	ENTITY ada_package 
		SUBTYPE OF ( schema_definition );
		ads_interface : LIST OF ada_interface;
		adb_interface : LIST OF ada_interface;
		xml_root_tags : LIST OF STRING;
	DERIVE
		infered_ads_interfaces : LIST OF ada_interface := ada_package_interface ( SELF, true );
		ads_head : STRING := source_licence + '\n' 
		+ ada_interfaces_code ( SELF, ada_package_interface ( SELF, true ) );
		adb_head : STRING := source_licence + '\n' 
		+ ada_interfaces_code ( SELF, ada_package_interface ( SELF, false ) );
		ads_code : STRING := ads_head + '\n\nPackage ' + name + ' is \n \n' 
		+ ada_package_ads_code ( SELF ) + '\nEnd ' + name + ';';
		adb_code : STRING := adb_head + '\n\nPackage Body ' + name + ' is \n \n' 
		+ ada_package_adb_code ( SELF ) + '\nEnd ' + name + ';';
	END_ENTITY;

	ENTITY package_alias;
		package_name : STRING;
		attribute_name : STRING;
	DERIVE
		ptr_type : STRING := SELF.name + '_Ptr';
		ads_interfaces_list : LIST OF ada_interface := [ ];
		adb_interfaces_list : LIST OF ada_interface := [ ada_interface ( SELF.owner.name, ?, true, true ) ];
		ads_code : STRING := 'subtype ' + SELF.name + ' is ' + package_name + '.' + attribute_name + ';\n' 
		+ 'subtype ' + SELF.ptr_type + ' is  ' + package_name + '.' + attribute_name + '_Ptr;\n';
		adb_code : STRING := '';
		init_value : STRING := ?;
		dependencies : LIST OF dictionary_instance := [ SELF ];
		ada_ref_ident : STRING := SELF.ptr_type;
		refed_by_pointer : BOOLEAN := true;
		ads_pre_def : STRING := '';
	END_ENTITY;

	ENTITY generic_package_instanciation 
		SUBTYPE OF ( ada_entity );
		generic_package_name : STRING;
		parameters : LIST OF STRING;
		interfaces : LIST OF ada_interface;
		before_entities : BOOLEAN;
	DERIVE
		aliases : LIST OF cheddar_defined_type := generic_package_aliases ( SELF );
		ads_interfaces_list : LIST OF ada_interface := [ ada_interface ( SELF.generic_package_name, ?, true, false ), ada_interface ( SELF.owner.name, SELF.name, false, true ), ada_interface ( 'Unchecked_Deallocation', ?, true, false ) ] + interfaces;
		adb_interfaces_list : LIST OF ada_interface := [ ];
		ads_code : STRING := 'package ' + ada_ident + ' is new ' + generic_package_name + '(' + StringAggregateConcatSeparatedBy ( parameters, ', ' ) + ');\n' 
		+ 'use ' + ada_ident + ';\n' 
		+ generic_package_instanciation_attributes_ads_code ( SELF );
		adb_code : STRING := '';
		ads_pre_def : STRING := '';
	END_ENTITY;

	FUNCTION ada_package_adb_code ( pkg : ada_package ) : STRING;
		LOCAL 
			result : STRING;
		END_LOCAL;
		result := ada_package_concepts_list_code ( pkg, pkg.types, false ) + ada_package_concepts_list_code ( pkg, pkg.entities, false );
		RETURN ( result );
	END_FUNCTION;

	FUNCTION ada_package_ads_code ( pkg : ada_package ) : STRING;
		LOCAL 
			result : STRING;
			classes : LIST OF ada_class := QUERY ( e <* pkg.entities | 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( e ) );
			const_list : LIST OF ada_constant := QUERY ( e <* pkg.constants | 'CHEDDAR_CONSTANTS.ADA_CONSTANT' IN TYPEOF ( e ) );
			private_classes : LIST OF ada_class := QUERY ( e <* classes | e.is_private );
			constrained_arrays : LIST OF defined_type;
			entities : LIST OF dictionary_instance := pkg.entities;
		END_LOCAL;
		constrained_arrays := QUERY ( t <* pkg.types | 'CHEDDAR_DOMAINS.CONSTRAINED_ARRAY_TYPE' IN TYPEOF ( t ) );
		result := ada_package_concepts_list_code ( pkg, ( ( pkg.types - constrained_arrays ) + entities ) + constrained_arrays, true );

		REPEAT no := LOINDEX ( const_list ) TO HIINDEX ( const_list );
			result := result + const_list [ no].ads_code + '\n';
		END_REPEAT;

		IF SIZEOF ( private_classes ) > 0 THEN
			result := result + '\n\nprivate\n \n';
			REPEAT no := LOINDEX ( private_classes ) TO HIINDEX ( private_classes );
				ALIAS supref FOR private_classes [ no].supertypes [ 1 ].ref;
					result := result + '\ntype ' + private_classes [ no].name + ' is new ' + supref.ada_ident + ' with\n' 
					+ ada_class_attributes_ads_code ( private_classes [ no] );
				END_ALIAS;
			END_REPEAT;
		END_IF;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION ada_package_interface ( pkg : ada_package; ads : BOOLEAN ) : LIST OF ada_interface;
		LOCAL 
			ads_list : LIST OF ada_interface := [ ada_interface ( 'Ada.Strings.Unbounded', ?, true, true ), ada_interface ( 'Framework_Config', ?, true, true ), ada_interface ( 'id_generators', ?, true, true ) ];
			adb_list : LIST OF ada_interface := [ ada_interface ( 'Text_io', ?, true, true ), ada_interface ( 'unbounded_strings', ?, true, true ) ];
			wul : LIST OF ada_interface;
			result : LIST OF ada_interface := [ ];
			defs : LIST OF dictionary_instance := pkg.entities + pkg.types + pkg.constants;
			pkgKey : STRING := upperize ( pkg.name );
		END_LOCAL;

		REPEAT no := LOINDEX ( pkg.interface ) TO HIINDEX ( pkg.interface );
			ALIAS curr FOR pkg.interface [ no];
				IF ( 'PACKAGE.ADA_PACKAGE' IN TYPEOF ( curr.native_schema ) ) THEN
					ads_list := ads_list + ADA_INTERFACE ( curr.native_schema.name, ?, true, true );
				END_IF;
			END_ALIAS;
		END_REPEAT;

		REPEAT no := LOINDEX ( defs ) TO HIINDEX ( defs );
			ALIAS e FOR defs [ no];
				IF ( 'CHEDDAR_DOMAINS.CHEDDAR_DEFINED_TYPE' IN TYPEOF ( e ) ) THEN
					ads_list := ads_list + e.ads_interfaces_list;
					adb_list := adb_list + e.adb_interfaces_list;
				END_IF;
				IF ( 'CHEDDAR_DOMAINS.EXPLICIT_TYPE_REFERENCE' IN TYPEOF ( e ) ) THEN
					ads_list := ads_list + e.ads_interfaces_list;
					adb_list := adb_list + e.adb_interfaces_list;
				END_IF;
				IF ( 'CHEDDAR_CONSTANTS.ADA_CONSTANT' IN TYPEOF ( e ) ) THEN
					ads_list := ads_list + e.ads_interfaces_list;
					adb_list := adb_list + e.adb_interfaces_list;
				END_IF;
				IF ( 'RECORD_AND_CLASS.ADA_ENTITY' IN TYPEOF ( e ) ) THEN
					ads_list := ads_list + e.ads_interfaces_list;
					adb_list := adb_list + e.adb_interfaces_list;
				END_IF;
				IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( e ) ) THEN
					ads_list := ads_list + e.ads_interfaces_list;
					adb_list := adb_list + e.adb_interfaces_list;
				END_IF;
				IF ( 'CHEDDAR_DOMAINS.CONSTRAINED_ARRAY_TYPE' IN TYPEOF ( e ) ) THEN
					ads_list := ads_list + e.ads_interfaces_list;
					adb_list := adb_list + e.adb_interfaces_list;
				END_IF;
				IF ( 'PACKAGE.GENERIC_PACKAGE_INSTANCIATION' IN TYPEOF ( e ) ) THEN
					ads_list := ads_list + e.ads_interfaces_list;
					adb_list := adb_list + e.adb_interfaces_list;
				END_IF;
			END_ALIAS;
		END_REPEAT;

		IF ads THEN
			wul := ads_list + pkg.ads_interface;
		ELSE
			wul := adb_list + pkg.adb_interface;
		END_IF;

		REPEAT no := LOINDEX ( wul ) TO HIINDEX ( wul );
			ALIAS curr FOR wul [ no];
				IF ( upperize ( curr.prefix ) <> pkgKey ) THEN
					result := result + curr;
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION all_packages_code ( ads : BOOLEAN ) : STRING;
		RETURN ( all_packages_code_into ( ads, ?, ? ) );
	END_FUNCTION;

	FUNCTION concept_in_list ( c : dictionary_instance; l : LIST OF dictionary_instance ) : BOOLEAN;
		LOCAL 
			key : STRING := upperize ( c.name );
		END_LOCAL;

		REPEAT no := LOINDEX ( l ) TO HIINDEX ( l );
			IF ( upperize ( l [ no].name ) = key ) THEN
				RETURN ( true );
			END_IF;
		END_REPEAT;
		RETURN ( false );
	END_FUNCTION;

	FUNCTION concept_list_local_dependencies ( sch : schema_definition; l : LIST OF dictionary_instance ) : LIST OF dictionary_instance;
		LOCAL 
			wl : LIST OF dictionary_instance := [ ];
			r : LIST OF dictionary_instance := [ ];
		END_LOCAL;

		REPEAT no := LOINDEX ( l ) TO HIINDEX ( l );
			ALIAS c FOR l [ no];
				IF is_of_generated_concept_kind ( c ) THEN
					wl := c.dependencies;
					REPEAT noi := LOINDEX ( wl ) TO HIINDEX ( wl );
						IF NOT concept_in_list ( wl [ noi], r ) THEN
							r := r + wl [ noi];
						END_IF;
					END_REPEAT;
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( r );
	END_FUNCTION;

	FUNCTION ada_package_concepts_list_code ( p : ada_package; concepts : LIST OF dictionary_instance; ads : BOOLEAN ) : STRING;
		LOCAL 
			result : STRING := '';
			code : STRING := '';
			tmp : STRING;
		END_LOCAL;

		IF ads THEN
			REPEAT no := LOINDEX ( concepts ) TO HIINDEX ( concepts );
				ALIAS c FOR concepts [ no];
					IF is_of_generated_concept_kind ( c ) THEN
						tmp := c.ads_pre_def;
						IF ( tmp > '' ) THEN
							code := code + tmp + '\n';
						END_IF;
					END_IF;
				END_ALIAS;
			END_REPEAT;
		END_IF;

		IF ( code > '' ) THEN
			result := code + '\n\n';
		END_IF;

		REPEAT no := LOINDEX ( concepts ) TO HIINDEX ( concepts );
			ALIAS c FOR concepts [ no];
				IF is_of_generated_concept_kind ( c ) THEN
					IF ads THEN
						code := c.ads_code;
					ELSE
						code := c.adb_code;
					END_IF;
					result := result + code;
					IF ( code > '' ) THEN
						result := result + '\n';
					END_IF;
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( result );
	END_FUNCTION;

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

	FUNCTION generic_package_aliases ( e : generic_package_instanciation ) : LIST OF cheddar_defined_type;
		LOCAL 
			aliases : LIST OF entity_instance := [ ];
			attrname : STRING;
		END_LOCAL;

		REPEAT no := LOINDEX ( e.attributes ) TO HIINDEX ( e.attributes );
			ALIAS attr FOR e.attributes [ no];
				ALIAS an FOR attr.name;
					IF ( an [ LENGTH ( an ) ] = '_' ) THEN
						attrname := an [ 1 : LENGTH ( an ) - 1 ];
					ELSE
						attrname := an;
					END_IF;
				END_ALIAS;
				aliases := aliases + ( ada_type ( ) || attr.domain || package_alias ( e.name, attrname ) );
			END_ALIAS;
		END_REPEAT;
		RETURN ( aliases );
	END_FUNCTION;

	FUNCTION generic_package_instanciation_attributes_ads_code ( e : generic_package_instanciation ) : STRING;
		LOCAL 
			result : STRING := '';
			aliases : LIST OF cheddar_defined_type := e.aliases;
		END_LOCAL;

		REPEAT no := LOINDEX ( aliases ) TO HIINDEX ( aliases );
			ALIAS attr FOR e.aliases [ no];
				result := result + attr.ads_code;
			END_ALIAS;
		END_REPEAT;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION all_packages_code_into ( ads : BOOLEAN; dir : STRING; targetName : STRING ) : STRING;
		LOCAL 
			code : STRING := '';
			body : STRING;
			pkgs : LIST OF ada_package := SetToList ( all_ada_packages ( ) );
			targetPath : STRING;
		END_LOCAL;

		REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );
			IF ads THEN
				body := pkgs [ no].ads_code;
			ELSE
				body := pkgs [ no].adb_code;
			END_IF;
			IF ( body > '' ) THEN
				code := code + body + '\n\n';
			END_IF;
		END_REPEAT;

		IF ads THEN
			code := code + xml_architecture_io_ads_package_code ( );
		ELSE
			code := code + xml_architecture_io_adb_package_code ( );
		END_IF;

		IF EXISTS ( dir ) THEN
			targetPath := dir;
		ELSE
			targetPath := '.';
		END_IF;

		IF EXISTS ( targetName ) THEN
			targetPath := targetPath + '/' + targetName;
		ELSE
			targetPath := targetPath + '/' + 'Platypus2Cheddar';
		END_IF;

		IF ads THEN
			WriteFile ( targetPath + '.ads', code );
		ELSE
			WriteFile ( targetPath + '.adb', code );
		END_IF;
		RETURN ( code );
	END_FUNCTION;
END_SCHEMA;

</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdPackageSchemaDefinition',
	#superclass : 'PlatypusCoreSchema',
	#category : 'Express2Cheddar-PackageSchema',
	#package : 'Express2Cheddar',
	#tag : 'PackageSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageSchemaDefinition class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageSchemaDefinition class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdPackageSchemaDefinition class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-context-accessing' }
ExChdPackageSchemaDefinition >> context [

	^ self schemaInstance context


]

{ #category : 'platypus-generated-entities' }
ExChdPackageSchemaDefinition >> entityDefinition1 [

	^ #( #ada_package #ExChdAdaPackage )


]

{ #category : 'platypus-generated-entities' }
ExChdPackageSchemaDefinition >> entityDefinition2 [

	^ #( #package_alias #ExChdPackageAlias )


]

{ #category : 'platypus-generated-entities' }
ExChdPackageSchemaDefinition >> entityDefinition3 [

	^ #( #generic_package_instanciation #ExChdGenericPackageInstanciation )


]

{ #category : 'platypus-generated-entities' }
ExChdPackageSchemaDefinition >> entityDefinitionCount [

	^ 3


]

{ #category : 'platypus-generated-functions' }
ExChdPackageSchemaDefinition >> functionDeclaration1 [

	^ #( #ada_package_adb_code #ExChdAdaPackageAdbCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdPackageSchemaDefinition >> functionDeclaration10 [

	^ #( #generic_package_instanciation_attributes_ads_code
	     #ExChdGenericPackageInstanciationAttributesAdsCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdPackageSchemaDefinition >> functionDeclaration11 [

	^ #( #all_packages_code_into #ExChdAllPackagesCodeIntoFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdPackageSchemaDefinition >> functionDeclaration2 [

	^ #( #ada_package_ads_code #ExChdAdaPackageAdsCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdPackageSchemaDefinition >> functionDeclaration3 [

	^ #( #ada_package_interface #ExChdAdaPackageInterfaceFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdPackageSchemaDefinition >> functionDeclaration4 [

	^ #( #all_packages_code #ExChdAllPackagesCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdPackageSchemaDefinition >> functionDeclaration5 [

	^ #( #concept_in_list #ExChdConceptInListFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdPackageSchemaDefinition >> functionDeclaration6 [

	^ #( #concept_list_local_dependencies
	     #ExChdConceptListLocalDependenciesFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdPackageSchemaDefinition >> functionDeclaration7 [

	^ #( #ada_package_concepts_list_code #ExChdAdaPackageConceptsListCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdPackageSchemaDefinition >> functionDeclaration8 [

	^ #( #ada_package_class_typeof_list #ExChdAdaPackageClassTypeofListFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdPackageSchemaDefinition >> functionDeclaration9 [

	^ #( #generic_package_aliases #ExChdGenericPackageAliasesFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdPackageSchemaDefinition >> functionDeclarationCount [

	^ 11


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdPackageSchemaDefinition >> schemaInstanceClassName [

	^ #ExChdExpress2cheddarSchemaInstance


]
