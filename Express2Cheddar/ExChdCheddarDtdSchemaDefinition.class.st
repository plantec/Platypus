"
<ISO10303-11-EXPRESS>
SCHEMA cheddar_dtd;
	USE FROM express2cheddar_facade;
	USE FROM platypus_dictionary_schema;
	USE FROM express_toolsbox_functions;
	USE FROM express_dictionary_queries;
	USE FROM record_and_class;
	USE FROM cheddar_domains;
	USE FROM package;
	USE FROM discriminated_type;

	ENTITY dtd_element 
		ABSTRACT SUPERTYPE;
		owner : OPTIONAL dtd_element;
		tag : STRING;
	DERIVE
		dtd_code : STRING := '';
	END_ENTITY;

	ENTITY composite_dtd_element 
		ABSTRACT SUPERTYPE 
		SUBTYPE OF ( dtd_element );
	DERIVE
		subs : LIST OF dtd_element := [ ];
	END_ENTITY;

	ENTITY root_dtd_element 
		SUBTYPE OF ( composite_dtd_element );
	DERIVE
		packages : LIST OF ada_package := xml_packages_with_tag ( SELF.tag );
		SELF\composite_dtd_element.subs : LIST OF package_dtd_element := compute_root_sub_elements ( SELF );
		SELF\dtd_element.dtd_code : STRING := compute_root_dtd_code ( SELF );
		declared_domains : LIST OF dtd_element := get_declared_entity_domains ( subs );
		referenced_entities : LIST OF dtd_element := get_referenced_entity_domains ( subs );
		implicit_domains : LIST OF entity_ref_dtd_element := compute_implicit_domains ( SELF );
	END_ENTITY;

	ENTITY package_dtd_element 
		SUBTYPE OF ( composite_dtd_element );
		package : ada_package;
	DERIVE
		SELF\dtd_element.tag : STRING := lowerize ( package.name );
		SELF\composite_dtd_element.subs : LIST OF dtd_element := compute_package_sub_elements ( SELF );
		SELF\dtd_element.dtd_code : STRING := compute_package_dtd_code ( SELF );
		attributes : LIST OF attribute_dtd_element := compute_package_attribute_dtd_elements ( SELF );
	END_ENTITY;

	ENTITY entity_dtd_element 
		SUBTYPE OF ( composite_dtd_element );
		domain : ada_entity;
	DERIVE
		SELF\dtd_element.tag : STRING := lowerize ( domain.name );
		SELF\composite_dtd_element.subs : LIST OF dtd_element := compute_entity_sub_elements ( SELF );
		SELF\dtd_element.dtd_code : STRING := compute_entity_dtd_code ( SELF );
	END_ENTITY;

	ENTITY ada_class_dtd_element 
		SUBTYPE OF ( entity_dtd_element );
	END_ENTITY;

	ENTITY record_dtd_element 
		SUBTYPE OF ( entity_dtd_element );
	END_ENTITY;

	ENTITY discriminated_type_dtd_element 
		SUBTYPE OF ( entity_dtd_element );
	DERIVE
		SELF\entity_dtd_element.subs : LIST OF dtd_element := compute_discriminated_type_sub_elements ( SELF );
		SELF\entity_dtd_element.dtd_code : STRING := compute_discriminated_type_code ( SELF );
	END_ENTITY;

	ENTITY attribute_dtd_element 
		SUBTYPE OF ( dtd_element );
		attribute : attribute;
		domain : domain_dtd_element;
	DERIVE
		SELF\dtd_element.tag : STRING := lowerize ( attribute.name );
		SELF\dtd_element.dtd_code : STRING := domain.dtd_code;
	END_ENTITY;

	ENTITY domain_dtd_element 
		SUBTYPE OF ( dtd_element );
		domain : entity_instance;
	DERIVE
		as_collection_element_dtd_code_tail : STRING := '';
	END_ENTITY;

	ENTITY simple_domain_dtd_element 
		SUBTYPE OF ( domain_dtd_element );
	DERIVE
		SELF\dtd_element.dtd_code : STRING := '<!ELEMENT ' + SELF.owner.tag + ' (#PCDATA)>\n';
		SELF\domain_dtd_element.as_collection_element_dtd_code_tail : STRING := '(#PCDATA)>\n';
	END_ENTITY;

	ENTITY collection_dtd_element 
		SUBTYPE OF ( domain_dtd_element );
		element_domain : domain_dtd_element;
	DERIVE
		SELF\dtd_element.dtd_code : STRING := '<!ELEMENT ' + owner.tag + ' ' + element_domain.as_collection_element_dtd_code_tail;
	END_ENTITY;

	ENTITY entity_ref_dtd_element 
		SUBTYPE OF ( domain_dtd_element );
	DERIVE
		infered_element : entity_dtd_element := ?;
		SELF\dtd_element.dtd_code : STRING := '<!ELEMENT ' + owner.tag + ' (' + lowerize ( domain.name ) + ')>\n';
	END_ENTITY;

	ENTITY record_ref_dtd_element 
		SUBTYPE OF ( entity_ref_dtd_element );
	DERIVE
		SELF\entity_ref_dtd_element.infered_element : entity_dtd_element := dtd_element ( ?, ? ) || composite_dtd_element ( ) || entity_dtd_element ( domain ) || record_dtd_element ( );
		SELF\domain_dtd_element.as_collection_element_dtd_code_tail : STRING := '(' + lowerize ( domain.handled.name ) + ')*>\n';
	END_ENTITY;

	ENTITY ada_class_ref_dtd_element 
		SUBTYPE OF ( entity_ref_dtd_element );
	DERIVE
		SELF\entity_ref_dtd_element.infered_element : entity_dtd_element := dtd_element ( ?, ? ) || composite_dtd_element ( ) || entity_dtd_element ( domain ) || ada_class_dtd_element ( );
		SELF\entity_ref_dtd_element.dtd_code : STRING := '<!ELEMENT ' + owner.tag + ' EMPTY>\n' 
		+ '<!ATTLIST ' + owner.tag + ' ref IDREF #REQUIRED>\n';
		SELF\entity_ref_dtd_element.as_collection_element_dtd_code_tail : STRING := ' EMPTY>\n' 
		+ '<!ATTLIST ' + owner.owner.tag + ' refs IDREFS #REQUIRED>\n';
	END_ENTITY;

	ENTITY discriminated_type_ref_dtd_element 
		SUBTYPE OF ( entity_ref_dtd_element );
	DERIVE
		SELF\entity_ref_dtd_element.infered_element : entity_dtd_element := dtd_element ( ?, ? ) || composite_dtd_element ( ) || entity_dtd_element ( domain ) || discriminated_type_dtd_element ( );
		SELF\domain_dtd_element.as_collection_element_dtd_code_tail : STRING := '(' + lowerize ( domain.handled.name ) + ')*>\n';
	END_ENTITY;

	ENTITY unknown_domain_dtd_element 
		SUBTYPE OF ( domain_dtd_element );
	DERIVE
		SELF\dtd_element.dtd_code : STRING := '<!ELEMENT ' + SELF.owner.tag + ' ANY>\n';
		SELF\domain_dtd_element.as_collection_element_dtd_code_tail : STRING := 'ANY>\n';
	END_ENTITY;

	FUNCTION compute_root_dtd_code ( r : root_dtd_element ) : STRING;
		LOCAL 
			s : STRING := '';
			code : STRING;
			lines : LIST OF STRING := [ ];
			licence : STRING := string_replace ( source_licence, '--', '  ' );
			pkgs : LIST OF package_dtd_element := r.subs;
			attributes : LIST OF attribute_dtd_element := [ ];
			acode : STRING;
			previous : LIST OF STRING := [ ];
			implicits : LIST OF dtd_element := r.implicit_domains;
			infered : LIST OF entity_dtd_element := [ ];
			el : entity_dtd_element;
			infered_attributes : LIST OF attribute_dtd_element := [ ];
		END_LOCAL;

		REPEAT no := LOINDEX ( implicits ) TO HIINDEX ( implicits );
			el := implicits [ no].infered_element;
			infered := infered + el;
			infered_attributes := infered_attributes + el.subs;
		END_REPEAT;
		s := s + '<!--' + licence + '-->\n\n' 

		+ '<!ELEMENT ' + r.tag + ' (';

		REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );
			s := s + pkgs [ no].tag + '?';
			IF ( no < HIINDEX ( pkgs ) ) THEN
				s := s + ' | ';
			END_IF;
		END_REPEAT;
		s := s + ')*>\n\n';

		REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );
			code := pkgs [ no].dtd_code;
			previous := previous + LinesFromString ( code );
			s := s + code;
		END_REPEAT;
		s := s + '\n';

		REPEAT no := LOINDEX ( infered ) TO HIINDEX ( infered );
			acode := infered [ no].dtd_code;
			IF NOT ( acode IN previous ) THEN
				s := s + acode;
				previous := previous + acode;
			END_IF;
		END_REPEAT;

		REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );
			attributes := attributes + compute_package_attribute_dtd_elements ( pkgs [ no] );
		END_REPEAT;

		REPEAT no := LOINDEX ( attributes ) TO HIINDEX ( attributes );
			acode := attributes [ no].dtd_code;
			IF NOT ( acode IN previous ) THEN
				s := s + attributes [ no].dtd_code;
				previous := previous + acode;
			END_IF;
		END_REPEAT;

		REPEAT no := LOINDEX ( infered_attributes ) TO HIINDEX ( infered_attributes );
			acode := infered_attributes [ no].dtd_code;
			IF NOT ( acode IN previous ) THEN
				s := s + acode;
				previous := previous + acode;
			END_IF;
		END_REPEAT;
		RETURN ( s );
	END_FUNCTION;

	FUNCTION root_dtds : LIST OF root_dtd_element;
		LOCAL 
			xml_pkgs : LIST OF ada_package := xml_packages ( );
			root_names : LIST OF STRING := [ ];
			result : LIST OF root_dtd_element := [ ];
		END_LOCAL;

		REPEAT no := LOINDEX ( xml_pkgs ) TO HIINDEX ( xml_pkgs );
			ALIAS curr_pkg FOR xml_pkgs [ no];
				root_names := root_names + curr_pkg.xml_root_tags;
			END_ALIAS;
		END_REPEAT;
		root_names := SetToList ( ListToSet ( root_names ) );

		REPEAT no := LOINDEX ( root_names ) TO HIINDEX ( root_names );
			result := result + composite_dtd_element ( ) || root_dtd_element ( ) || dtd_element ( ?, root_names [ no] );
		END_REPEAT;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION compute_root_sub_elements ( e : root_dtd_element ) : LIST OF package_dtd_element;
		LOCAL 
			result : LIST OF package_dtd_element := [ ];
		END_LOCAL;

		ALIAS packages FOR e.packages;
			REPEAT no := LOINDEX ( packages ) TO HIINDEX ( packages );
				result := result + ( dtd_element ( e, ? ) || composite_dtd_element ( ) || package_dtd_element ( packages [ no] ) );
			END_REPEAT;
		END_ALIAS;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION compute_package_attribute_dtd_elements ( p : package_dtd_element ) : LIST OF attribute_dtd_element;
		LOCAL 
			subs : LIST OF dtd_element := p.subs;
			r : LIST OF attribute_dtd_element := [ ];
		END_LOCAL;

		REPEAT no := LOINDEX ( subs ) TO HIINDEX ( subs );
			r := r + subs [ no].subs;
		END_REPEAT;
		RETURN ( r );
	END_FUNCTION;

	FUNCTION compute_package_dtd_code ( p : package_dtd_element ) : STRING;
		LOCAL 
			subs : LIST OF dtd_element := p.subs;
			s : STRING := '';
		END_LOCAL;

		IF ( SIZEOF ( subs ) > 0 ) THEN
			s := s + '<!ELEMENT ' + p.tag + ' (';
			REPEAT no := LOINDEX ( subs ) TO HIINDEX ( subs );
				s := s + subs [ no].tag;
				IF ( no < HIINDEX ( subs ) ) THEN
					s := s + ' | ';
				END_IF;
			END_REPEAT;
			s := s + ')+>\n';
			REPEAT no := LOINDEX ( subs ) TO HIINDEX ( subs );
				s := s + subs [ no].dtd_code;
			END_REPEAT;
			s := s + '\n';
		END_IF;
		RETURN ( s );
	END_FUNCTION;

	FUNCTION compute_package_sub_elements ( e : package_dtd_element ) : LIST OF dtd_element;
		LOCAL 
			result : LIST OF dtd_element := [ ];
			classes : LIST OF ada_entity := package_ada_classes ( e.package );
			records : LIST OF ada_entity := package_records ( e.package );
			discrims : LIST OF discriminated_type := package_discriminated_types ( e.package );
		END_LOCAL;

		REPEAT no := LOINDEX ( classes ) TO HIINDEX ( classes );
			ALIAS curr FOR classes [ no];
				result := result + ( dtd_element ( e, ? ) || composite_dtd_element ( ) || entity_dtd_element ( curr ) || ada_class_dtd_element ( ) );
			END_ALIAS;
		END_REPEAT;

		REPEAT no := LOINDEX ( records ) TO HIINDEX ( records );
			ALIAS curr FOR records [ no];
				result := result + ( dtd_element ( e, ? ) || composite_dtd_element ( ) || entity_dtd_element ( curr ) || record_dtd_element ( ) );
			END_ALIAS;
		END_REPEAT;

		REPEAT no := LOINDEX ( discrims ) TO HIINDEX ( discrims );
			ALIAS curr FOR discrims [ no];
				result := result + ( dtd_element ( e, ? ) || composite_dtd_element ( ) || entity_dtd_element ( curr ) || discriminated_type_dtd_element ( ) );
			END_ALIAS;
		END_REPEAT;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION compute_entity_dtd_code ( ent : entity_dtd_element ) : STRING;
		LOCAL 
			s : STRING := '';
			l : LIST OF STRING := [ ];
			subs : LIST OF dtd_element := ent.subs;
		END_LOCAL;

		REPEAT no := LOINDEX ( subs ) TO HIINDEX ( subs );
			ALIAS curr FOR subs [ no];
				l := l + curr.tag;
			END_ALIAS;
		END_REPEAT;
		s := '<!ELEMENT ' + ent.tag + ' (' + StringAggregateConcatSeparatedBy ( l, ' | ' ) + ')*>\n';

		IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( ent.domain ) ) THEN
			s := s + '<!ATTLIST ' + ent.tag + ' id ID #REQUIRED>\n';
		END_IF;
		RETURN ( s );
	END_FUNCTION;

	FUNCTION compute_attribute_dtd_list_from_attribute_list ( owner : dtd_element; attrs : LIST OF explicit_attribute ) : LIST OF dtd_element;
		LOCAL 
			result : LIST OF dtd_element := [ ];
		END_LOCAL;

		REPEAT no := LOINDEX ( attrs ) TO HIINDEX ( attrs );
			ALIAS curr FOR attrs [ no];
				IF ( lowerize ( curr.name ) <> lowerize ( xml_id_name ) ) THEN
					result := result + compute_attribute_dtd_element ( owner, curr );
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION compute_entity_sub_elements ( e : entity_dtd_element ) : LIST OF dtd_element;
		LOCAL 
			attrs : LIST OF explicit_attribute := inherited_explicit_attributes ( e.domain );
			result : LIST OF dtd_element := compute_attribute_dtd_list_from_attribute_list ( e, attrs );
		END_LOCAL;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION compute_discriminated_type_code ( ent : discriminated_type_dtd_element ) : STRING;
		LOCAL 
			s : STRING := '';
			l : LIST OF STRING := [ ];
			subs : LIST OF dtd_element := ent.subs;
		END_LOCAL;

		REPEAT no := LOINDEX ( subs ) TO HIINDEX ( subs );
			ALIAS curr FOR subs [ no];
				l := l + curr.tag;
			END_ALIAS;
		END_REPEAT;
		s := '<!ELEMENT ' + ent.tag + ' (' + StringAggregateConcatSeparatedBy ( l, ' | ' ) + ')*>\n';
		RETURN ( s );
	END_FUNCTION;

	FUNCTION compute_discriminated_type_sub_elements ( e : discriminated_type_dtd_element ) : LIST OF dtd_element;
		LOCAL 
			attrs : LIST OF explicit_attribute := discriminated_type_attributes ( e.domain );
			result : LIST OF dtd_element := compute_attribute_dtd_list_from_attribute_list ( e, attrs );
		END_LOCAL;
		RETURN ( result );
	END_FUNCTION;

	FUNCTION compute_attribute_dtd_element ( owner : dtd_element; a : attribute ) : attribute_dtd_element;
		LOCAL 
			domain : entity_instance := basic_ada_domain ( a.domain ).handled;
			result : attribute_dtd_element;
		END_LOCAL;
		result := ( dtd_element ( owner, ? ) || attribute_dtd_element ( a, ? ) );
		result.domain := compute_domain_dtd_element ( result, domain );
		RETURN ( result );
	END_FUNCTION;

	FUNCTION compute_domain_dtd_element ( owner : dtd_element; domain : entity_instance ) : domain_dtd_element;
		LOCAL 
			sub_domain : entity_instance;
			element_domain : entity_instance;
			result : domain_dtd_element;
		END_LOCAL;

		IF ( 'PLATYPUS_DICTIONARY_SCHEMA.DICTIONARY_INSTANCE_REFERENCE' IN TYPEOF ( domain ) ) THEN
			RETURN ( compute_domain_dtd_element ( owner, domain.ref ) );
		ELSE
			IF ( 'CHEDDAR_DOMAINS.ADA_PRIMITIVE_TYPE' IN TYPEOF ( domain ) ) THEN
				RETURN ( simple_domain_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
			ELSE
				IF ( 'CHEDDAR_DOMAINS.ADA_ENUMERATION' IN TYPEOF ( domain ) ) THEN
					RETURN ( simple_domain_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
				ELSE
					IF ( 'CHEDDAR_DOMAINS.CHEDDAR_PRIORITY_RANGE' IN TYPEOF ( domain ) ) THEN
						RETURN ( simple_domain_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
					ELSE
						IF ( 'RECORD_AND_CLASS.RECORD' IN TYPEOF ( domain ) ) THEN
							RETURN ( record_ref_dtd_element ( ) || entity_ref_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
						ELSE
							IF ( 'DISCRIMINATED_TYPE.DISCRIMINATED_TYPE' IN TYPEOF ( domain ) ) THEN
								RETURN ( discriminated_type_ref_dtd_element ( ) || entity_ref_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
							ELSE
								IF ( 'RECORD_AND_CLASS.ADA_CLASS' IN TYPEOF ( domain ) ) THEN
									RETURN ( ada_class_ref_dtd_element ( ) || entity_ref_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
								ELSE
									IF ( 'PLATYPUS_DICTIONARY_SCHEMA.DEFINED_TYPE' IN TYPEOF ( domain ) ) THEN
										sub_domain := basic_ada_domain ( domain.domain );
										IF ( 'PLATYPUS_DICTIONARY_SCHEMA.AGGREGATION_TYPE' IN TYPEOF ( sub_domain ) ) THEN
											element_domain := basic_ada_domain ( sub_domain.element_type );
											result := collection_dtd_element ( ? ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain );
											result.element_domain := compute_domain_dtd_element ( result, element_domain );
											RETURN ( result );
										END_IF;
									END_IF;
								END_IF;
							END_IF;
						END_IF;
					END_IF;
				END_IF;
			END_IF;
		END_IF;
		println ( domain );
		RETURN ( unknown_domain_dtd_element ( ) || dtd_element ( owner, ? ) || domain_dtd_element ( domain ) );
	END_FUNCTION;

	FUNCTION xml_packages : LIST OF ada_package;
		RETURN ( QUERY ( p <* SetToList ( all_ada_packages ( ) ) | SIZEOF ( p.xml_root_tags ) > 0 ) );
	END_FUNCTION;

	FUNCTION get_referenced_entity_domains ( pkgs : LIST OF package_dtd_element ) : LIST OF entity_ref_dtd_element;
		LOCAL 
			attributes : LIST OF attribute_dtd_element := [ ];
			domains : LIST OF entity_ref_dtd_element := [ ];
			names : LIST OF STRING := [ ];
			curr : domain_dtd_element;
		END_LOCAL;

		REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );
			attributes := attributes + compute_package_attribute_dtd_elements ( pkgs [ no] );
		END_REPEAT;

		REPEAT noi := LOINDEX ( attributes ) TO HIINDEX ( attributes );
			curr := ?;
			ALIAS dom FOR attributes [ noi].domain;
				IF ( 'CHEDDAR_DTD.ENTITY_REF_DTD_ELEMENT' IN TYPEOF ( dom ) ) THEN
					curr := dom;
				END_IF;
				IF ( ( 'CHEDDAR_DTD.COLLECTION_DTD_ELEMENT' IN TYPEOF ( dom ) ) AND ( 'CHEDDAR_DTD.ENTITY_REF_DTD_ELEMENT' IN TYPEOF ( dom.element_domain ) ) ) THEN
					curr := dom.element_domain;
				END_IF;
				IF EXISTS ( curr ) THEN
					IF NOT ( lowerize ( curr.domain.name ) IN names ) THEN
						domains := domains + curr;
						names := names + lowerize ( curr.domain.name );
					END_IF;
				END_IF;
			END_ALIAS;
		END_REPEAT;
		RETURN ( domains );
	END_FUNCTION;

	FUNCTION get_declared_entity_domains ( pkgs : LIST OF package_dtd_element ) : LIST OF dtd_element;
		LOCAL 
			result : LIST OF dtd_element := [ ];
		END_LOCAL;

		REPEAT no := LOINDEX ( pkgs ) TO HIINDEX ( pkgs );
			result := result + pkgs [ no].subs;
		END_REPEAT;
		RETURN ( result );
	END_FUNCTION;

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

	FUNCTION xml_packages_with_tag ( tag : STRING ) : LIST OF ada_package;
		RETURN ( QUERY ( p <* xml_packages ( ) | tag IN p.xml_root_tags ) );
	END_FUNCTION;
END_SCHEMA;

</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdCheddarDtdSchemaDefinition',
	#superclass : 'PlatypusCoreSchema',
	#category : 'Express2Cheddar-CheddarDtdSchema',
	#package : 'Express2Cheddar',
	#tag : 'CheddarDtdSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarDtdSchemaDefinition class >> iso10303P11Translater [
	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarDtdSchemaDefinition class >> translatedFromISO10303P11 [
	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdCheddarDtdSchemaDefinition class >> vwNamespaceName [
	^ #Express2Cheddar


]

{ #category : 'platypus-generated-context-accessing' }
ExChdCheddarDtdSchemaDefinition >> context [
	^ self schemaInstance context


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition1 [
	^ #(#dtd_element #ExChdDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition10 [
	^ #(#domain_dtd_element #ExChdDomainDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition11 [
	^ #(#simple_domain_dtd_element #ExChdSimpleDomainDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition12 [
	^ #(#collection_dtd_element #ExChdCollectionDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition13 [
	^ #(#entity_ref_dtd_element #ExChdEntityRefDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition14 [
	^ #(#record_ref_dtd_element #ExChdRecordRefDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition15 [
	^ #(#ada_class_ref_dtd_element #ExChdAdaClassRefDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition16 [
	^ #(#discriminated_type_ref_dtd_element #ExChdDiscriminatedTypeRefDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition17 [
	^ #(#unknown_domain_dtd_element #ExChdUnknownDomainDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition2 [
	^ #(#composite_dtd_element #ExChdCompositeDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition3 [
	^ #(#root_dtd_element #ExChdRootDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition4 [
	^ #(#package_dtd_element #ExChdPackageDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition5 [
	^ #(#entity_dtd_element #ExChdEntityDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition6 [
	^ #(#ada_class_dtd_element #ExChdAdaClassDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition7 [
	^ #(#record_dtd_element #ExChdRecordDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition8 [
	^ #(#discriminated_type_dtd_element #ExChdDiscriminatedTypeDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinition9 [
	^ #(#attribute_dtd_element #ExChdAttributeDtdElement)


]

{ #category : 'platypus-generated-entities' }
ExChdCheddarDtdSchemaDefinition >> entityDefinitionCount [
	^ 17


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration1 [
	^ #(#compute_root_dtd_code #ExChdComputeRootDtdCodeFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration10 [
	^ #(#compute_discriminated_type_code #ExChdComputeDiscriminatedTypeCodeFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration11 [
	^ #(#compute_discriminated_type_sub_elements #ExChdComputeDiscriminatedTypeSubElementsFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration12 [
	^ #(#compute_attribute_dtd_element #ExChdComputeAttributeDtdElementFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration13 [
	^ #(#compute_domain_dtd_element #ExChdComputeDomainDtdElementFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration14 [
	^ #(#xml_packages #ExChdXmlPackagesFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration15 [
	^ #(#get_referenced_entity_domains #ExChdGetReferencedEntityDomainsFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration16 [
	^ #(#get_declared_entity_domains #ExChdGetDeclaredEntityDomainsFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration17 [
	^ #(#compute_implicit_domains #ExChdComputeImplicitDomainsFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration18 [
	^ #(#xml_packages_with_tag #ExChdXmlPackagesWithTagFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration2 [
	^ #(#root_dtds #ExChdRootDtdsFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration3 [
	^ #(#compute_root_sub_elements #ExChdComputeRootSubElementsFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration4 [
	^ #(#compute_package_attribute_dtd_elements #ExChdComputePackageAttributeDtdElementsFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration5 [
	^ #(#compute_package_dtd_code #ExChdComputePackageDtdCodeFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration6 [
	^ #(#compute_package_sub_elements #ExChdComputePackageSubElementsFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration7 [
	^ #(#compute_entity_dtd_code #ExChdComputeEntityDtdCodeFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration8 [
	^ #(#compute_attribute_dtd_list_from_attribute_list #ExChdComputeAttributeDtdListFromAttributeListFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclaration9 [
	^ #(#compute_entity_sub_elements #ExChdComputeEntitySubElementsFunction)


]

{ #category : 'platypus-generated-functions' }
ExChdCheddarDtdSchemaDefinition >> functionDeclarationCount [
	^ 18


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdCheddarDtdSchemaDefinition >> schemaInstanceClassName [
	^ #ExChdExpress2cheddarSchemaInstance


]
