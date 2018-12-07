"
<ISO10303-11-EXPRESS>
FUNCTION USEDIN ( T : GENERIC; R : STRING ) : BAG OF GENERIC;
	(*#           
			| result tmpResult ent role schemaEntityAttribute schemaKey entityKey attributeKey |
			ent := self t.
			role := self r.
			result := PltBagInstance new.
			ent 
				ifMissing: [^ self return: ent]
				ifNotMissing: [
					role 
						ifMissing: [^ self return: role]
						ifNotMissing: [
							tmpResult := Bag new.
							role pltNativeValue 
								ifEmpty: [schemaKey := ''.
									entityKey := ''.
									attributeKey := '']
								ifNotEmpty: [:arg | schemaEntityAttribute := role pltNativeValue findTokens: $..
									schemaKey := schemaEntityAttribute first asUppercase.
									entityKey := schemaEntityAttribute second asUppercase.
									attributeKey := schemaEntityAttribute third asUppercase].
							self
								dataDo: [:d | d
									rolesValue: ent
									roleSchema: schemaKey
									roleEntity: entityKey
									roleAttribute: attributeKey
									in: tmpResult].
							result contents: tmpResult.
							^ self return: result]]
		           #*) (*# <pharo>
			| result tmpResult ent role schemaEntityAttribute schemaKey entityKey attributeKey |
			ent := self t.
			role := self r.
			result := Bag new.
			ent 
				ifNil: [^ self return: ent]
				ifNotNil: [
					role 
						ifNil: [^ self return: role]
						ifNotNil: [
							role 
								ifEmpty: [schemaKey := ''.
									entityKey := ''.
									attributeKey := '']
								ifNotEmpty: [:arg | schemaEntityAttribute := role findTokens: $..
									schemaKey := schemaEntityAttribute first asUppercase.
									entityKey := schemaEntityAttribute second asUppercase.
									attributeKey := schemaEntityAttribute third asUppercase].
							self
								dataDo: [:d | d
									rolesValue: ent
									roleSchema: schemaKey
									roleEntity: entityKey
									roleAttribute: attributeKey
									in: result].
							^ self return: result]]
		           #*);
END_FUNCTION;
</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltUSEDINFunction,
	#superclass : #PlatypusCoreAlgorithmDeclaration,
	#instVars : [
		't',
		'r'
	],
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltUSEDINFunction class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltUSEDINFunction class >> schemaDefinition [
  ^PltExpressBuiltinsSchemaDefinition singleton


]

{ #category : #'platypus-generated-platypus-signature' }
PltUSEDINFunction class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltUSEDINFunction class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-accessing' }
PltUSEDINFunction >> fromValues: values [
  self t: (values at: 1).
  self r: (values at: 2)


]

{ #category : #'platypus-generated-invoking' }
PltUSEDINFunction >> invoke [
  " ---------- locals assignments ----------"" ---------- statements ----------""---------- native statement ---------- "
  | result tmpResult ent role schemaEntityAttribute schemaKey entityKey attributeKey |
  ent := self t.
  role := self r.
  result := Bag new.
  ent ifNil: [ ^self return: ent ] ifNotNil: [ role ifNil: [ ^self return: role ] ifNotNil: [ role ifEmpty: [ schemaKey := ''.
                    entityKey := ''.
                    attributeKey := '' ] ifNotEmpty: [:arg |  schemaEntityAttribute := role findTokens: $..
                    schemaKey := schemaEntityAttribute first asUppercase.
                    entityKey := schemaEntityAttribute second asUppercase.
                    attributeKey := schemaEntityAttribute third asUppercase ].
              self dataDo: [:d |  d rolesValue: ent roleSchema: schemaKey roleEntity: entityKey roleAttribute: attributeKey in: result ].
              ^self return: result ] ]


]

{ #category : #'platypus-generated-accessing' }
PltUSEDINFunction >> r [
  ^r


]

{ #category : #'platypus-generated-accessing' }
PltUSEDINFunction >> r: aString [
  r := aString


]

{ #category : #'platypus-generated-accessing' }
PltUSEDINFunction >> t [
  ^t


]

{ #category : #'platypus-generated-accessing' }
PltUSEDINFunction >> t: anObject [
  t := anObject


]

{ #category : #'platypus-generated-accessing' }
PltUSEDINFunction >> t: anObject r: aString [
  self t: anObject.
  self r: aString


]
