"
<ISO10303-11-EXPRESS>
SCHEMA ada_interface;
	USE FROM platypus_dictionary_schema;
	USE FROM express_toolsbox_functions;
	USE FROM package;

	ENTITY ada_interface;
		prefix : STRING;
		suffix : OPTIONAL STRING;
		with_it : BOOLEAN;
		use_it : BOOLEAN;
	DERIVE
		full_name : STRING := ada_interface_path ( SELF );
		declaration : STRING := ada_interface_declaration ( SELF );
	END_ENTITY;

	FUNCTION ada_interface_path ( i : ada_interface ) : STRING;
		LOCAL 
			name : STRING := i.prefix;
		END_LOCAL;

		IF EXISTS ( i.suffix ) THEN
			name := name + '.' + i.suffix;
		END_IF;
		RETURN ( name );
	END_FUNCTION;

	FUNCTION ada_interface_declaration ( int : ada_interface ) : STRING;
		LOCAL 
			s : STRING := '';
			name : STRING := ada_interface_path ( int );
		END_LOCAL;

		IF int.with_it THEN
			s := s + 'with ' + name + ';\n';
		END_IF;

		IF int.use_it THEN
			s := s + 'use ' + name + ';\n';
		END_IF;
		RETURN ( s );
	END_FUNCTION;

	FUNCTION ada_interfaces_code ( from_pkg : ada_package; l : LIST OF ada_interface ) : STRING;
		LOCAL 
			found : SET OF STRING := [ ];
			with_suffix : LIST OF ada_interface := [ ];
			with_prefix_only : LIST OF ada_interface := [ ];
			cleaned : LIST OF ada_interface := [ ];
			inserted : BOOLEAN;
			s : STRING := '';
		END_LOCAL;

		REPEAT no := LOINDEX ( l ) TO HIINDEX ( l );
			ALIAS curr FOR l [ no];
				IF NOT EXISTS ( from_pkg ) OR ( upperize ( from_pkg.name ) <> upperize ( curr.prefix ) ) THEN
					IF NOT ( upperize ( curr.full_name ) IN found ) THEN
						found := found + upperize ( curr.full_name );
						cleaned := cleaned + curr;
					END_IF;
				END_IF;
			END_ALIAS;
		END_REPEAT;

		REPEAT no := LOINDEX ( cleaned ) TO HIINDEX ( cleaned );
			ALIAS curr FOR cleaned [ no];
				IF EXISTS ( curr.suffix ) THEN
					with_suffix := with_suffix + curr;
				ELSE
					with_prefix_only := with_prefix_only + curr;
				END_IF;
			END_ALIAS;
		END_REPEAT;
		cleaned := [ ];

		REPEAT no := LOINDEX ( with_prefix_only ) TO HIINDEX ( with_prefix_only );
			cleaned := cleaned + with_prefix_only [ no];
		END_REPEAT;

		REPEAT no := LOINDEX ( with_suffix ) TO HIINDEX ( with_suffix );
			ALIAS curr FOR with_suffix [ no];
				inserted := false;
				REPEAT noi := LOINDEX ( cleaned ) TO HIINDEX ( cleaned );
					ALIAS curri FOR cleaned [ noi];
						IF ( upperize ( curr.prefix ) = upperize ( curri.prefix ) ) THEN
							INSERT ( cleaned, curr, noi );
							inserted := true;
							ESCAPE;
						END_IF;
					END_ALIAS;
				END_REPEAT;
				IF ( inserted = false ) THEN
					cleaned := cleaned + curr;
				END_IF;
			END_ALIAS;
		END_REPEAT;

		REPEAT no := LOINDEX ( cleaned ) TO HIINDEX ( cleaned );
			ALIAS curr FOR cleaned [ no];
				s := s + curr.declaration + '\n';
			END_ALIAS;
		END_REPEAT;
		RETURN ( s );
	END_FUNCTION;
END_SCHEMA;

</ISO10303-11-EXPRESS>
"
Class {
	#name : 'ExChdAdaInterfaceSchemaDefinition',
	#superclass : 'PlatypusCoreSchema',
	#category : 'Express2Cheddar-AdaInterfaceSchema',
	#package : 'Express2Cheddar',
	#tag : 'AdaInterfaceSchema'
}

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaInterfaceSchemaDefinition class >> iso10303P11Translater [

	^ 'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaInterfaceSchemaDefinition class >> translatedFromISO10303P11 [

	^ true


]

{ #category : 'platypus-generated-platypus-signature' }
ExChdAdaInterfaceSchemaDefinition class >> vwNamespaceName [

	^ #Express2Cheddar


]

{ #category : 'platypus-generated-context-accessing' }
ExChdAdaInterfaceSchemaDefinition >> context [

	^ self schemaInstance context


]

{ #category : 'platypus-generated-entities' }
ExChdAdaInterfaceSchemaDefinition >> entityDefinition1 [

	^ #( #ada_interface #ExChdAdaInterface )


]

{ #category : 'platypus-generated-entities' }
ExChdAdaInterfaceSchemaDefinition >> entityDefinitionCount [

	^ 1


]

{ #category : 'platypus-generated-functions' }
ExChdAdaInterfaceSchemaDefinition >> functionDeclaration1 [

	^ #( #ada_interface_path #ExChdAdaInterfacePathFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdAdaInterfaceSchemaDefinition >> functionDeclaration2 [

	^ #( #ada_interface_declaration #ExChdAdaInterfaceDeclarationFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdAdaInterfaceSchemaDefinition >> functionDeclaration3 [

	^ #( #ada_interfaces_code #ExChdAdaInterfacesCodeFunction )


]

{ #category : 'platypus-generated-functions' }
ExChdAdaInterfaceSchemaDefinition >> functionDeclarationCount [

	^ 3


]

{ #category : 'platypus-generated-meta-data-accessing' }
ExChdAdaInterfaceSchemaDefinition >> schemaInstanceClassName [

	^ #ExChdExpress2cheddarSchemaInstance


]
