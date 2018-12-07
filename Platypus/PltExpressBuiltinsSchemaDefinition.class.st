"
<ISO10303-11-EXPRESS>
SCHEMA EXPRESS_builtins;

	FUNCTION ABS ( P : NUMBER ) : NUMBER;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (v class val: (v pltNativeValue) abs)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v abs)] 
		           #*);
	END_FUNCTION;

	FUNCTION ACOS ( P : NUMBER ) : REAL;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) arcCos)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v arcCos)] 
		           #*);
	END_FUNCTION;

	FUNCTION ASIN ( P : NUMBER ) : REAL;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) arcSin)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v arcSin)] 
		           #*);
	END_FUNCTION;

	FUNCTION ATAN ( V1 : NUMBER; V2 : NUMBER ) : REAL;
		(*#            | v |
			(v := self v1)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) arcTan)] 
		           #*) (*# <pharo> | v |
			^ (v := self v1) ifNotNil: [self return: (v arcTan)] 
		           #*);
	END_FUNCTION;

	FUNCTION BLENGTH ( P : BINARY ) : INTEGER;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltIntegerLiteral val: (v pltNativeValue) size)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v size)] 
		           #*);
	END_FUNCTION;

	FUNCTION COS ( P : NUMBER ) : REAL;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) cos)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v cos)] 
		           #*);
	END_FUNCTION;

	FUNCTION EVEN ( P : NUMBER ) : BOOLEAN;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltLogicalLiteral val: (v pltNativeValue) even)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v even)] 
		           #*);
	END_FUNCTION;

	FUNCTION EXISTS ( P : GENERIC ) : BOOLEAN;
		(*#            
			(self p)
				ifMissing: [^ self return: (PltLogicalLiteral val: false) ]
				ifNotMissing: [^ self return: (PltLogicalLiteral val: true) ] 
		           #*) (*# <pharo> | v |
			^ (self return: self p notNil)
		           #*);
	END_FUNCTION;

	FUNCTION EXP ( P : NUMBER ) : REAL;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) exp)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v exp)] 
		           #*);
	END_FUNCTION;

	FUNCTION FORMAT ( PN : NUMBER; PF : STRING ) : STRING;
		(*#            | n f formatted |
			(n := self pN)
				ifMissing: [^ self return: n]
				ifNotMissing: [(f := self pF) 
					ifMissing: [^ self return: f]
					ifNotMissing: [formatted := PlatypusExpressBuiltinFormatFormatter format: n pltNativeValue sourceFormat: f pltNativeValue trimBoth.
						^ self return: (PltStringLiteral val: formatted)]]
		           #*) (*# <pharo> | n f formatted |
			(n := self pN)
				ifNil: [^ self return: n]
				ifNotNil: [(f := self pF) 
					ifNil: [^ self return: f]
					ifNotNil: [formatted := PlatypusExpressBuiltinFormatFormatter format: n sourceFormat: f trimBoth.
						^ self return: formatted]]
		           #*);
	END_FUNCTION;

	FUNCTION HIBOUND ( P : AGGREGATE OF GENERIC ) : INTEGER;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: v upperBound] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v upperBound)] 
		           #*);
	END_FUNCTION;

	FUNCTION HIINDEX ( P : AGGREGATE OF GENERIC ) : INTEGER;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [((v := v pltNativeValue) isPltArray)
						ifTrue: [^ self return: (v upperBound)]
						ifFalse: [^ self return: (PltIntegerLiteral val: ( v pltNativeValue ) size)]]
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v upperBound)] 
		           #*);
	END_FUNCTION;

	FUNCTION LENGTH ( P : STRING ) : INTEGER;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltIntegerLiteral val: (v pltNativeValue) size)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v size)] 
		           #*);
	END_FUNCTION;

	FUNCTION LOBOUND ( P : AGGREGATE OF GENERIC ) : INTEGER;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [
					(v := v lowerBound)
						ifMissing: [^ self return: (PltIntegerLiteral val: 0)]
						ifNotMissing: [^ self return: v]].
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v lowerBound)] 
		           #*);
	END_FUNCTION;

	FUNCTION LOG ( P : NUMBER ) : REAL;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) ln)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v ln)] 
		           #*);
	END_FUNCTION;

	FUNCTION LOG2 ( P : NUMBER ) : REAL;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) log: 2)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v log: 2)] 
		           #*);
	END_FUNCTION;

	FUNCTION LOG10 ( P : NUMBER ) : REAL;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) log)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v log)] 
		           #*);
	END_FUNCTION;

	FUNCTION LOINDEX ( P : AGGREGATE OF GENERIC ) : INTEGER;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [((v := v pltNativeValue) isPltArray)
						ifTrue: [^ self return: (v lowerBound)]
						ifFalse: [^ self return: (PltIntegerLiteral val: 1)]]
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: (v lowerBound)] 
		           #*);
	END_FUNCTION;

	FUNCTION ODD ( P : INTEGER ) : BOOLEAN;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltLogicalLiteral val: (v pltNativeValue) odd)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: v odd] 
		           #*);
	END_FUNCTION;

	FUNCTION ROLESOF ( P : GENERIC ) : SET OF STRING;
		(*#           
			| arg result tmpResult |
			(arg := self p)
				ifMissing: [^ self return: arg]
				ifNotMissing: [result := PltSetInstance new.
					tmpResult := Set new.
					self
						dataDo: [:d | d rolesOf: arg in: tmpResult].
					result contents: tmpResult.
					^ self return: result]
		           #*) (*# <pharo>
			| arg result |
			(arg := self p)
				ifNil: [^ self return: arg]
				ifNotNil: [
					result := Set new.
					self
						dataDo: [:d | d rolesOf: arg in: result].
					^ self return: result]
		           #*);
	END_FUNCTION;

	FUNCTION SIN ( P : NUMBER ) : REAL;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) sin)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: v sin] 
		           #*);
	END_FUNCTION;

	FUNCTION SIZEOF ( P : AGGREGATE OF GENERIC ) : INTEGER;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltIntegerLiteral val: (v pltNativeValue) size)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: v size] 
		           #*);
	END_FUNCTION;

	FUNCTION SQRT ( P : NUMBER ) : REAL;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) sqrt)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: v sqrt] 
		           #*);
	END_FUNCTION;

	FUNCTION TAN ( P : NUMBER ) : REAL;
		(*#            | v |
			(v := self p)
				ifMissing: [^ self return: v]
				ifNotMissing: [^ self return: (PltRealLiteral val: (v pltNativeValue) tan)] 
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNotNil: [self return: v tan] 
		           #*);
	END_FUNCTION;

	FUNCTION TYPEOF ( P : GENERIC ) : SET OF STRING;
		(*#           
			| arg result |
			(arg := self p)
				ifMissing: [^ self return: arg]
				ifNotMissing: [
					result := PltSetInstance new.
					result contents: (PlatypusExpressTypeOfBuilder typeOfSetFor: arg computedDomain).
					^ self return: result]
		           #*) (*# <pharo>
			| arg result |
			(arg := self p)
				ifNil: [^ self return: arg]
				ifNotNil: [
					(arg isKindOf: PlatypusComplexInstance) 
						ifTrue: [result := OrderedCollection new.
							arg records do: [:rec | result addAll: (PlatypusExpressTypeOfBuilder typeOfSetFor: rec class platypusMetaData)]] 
						ifFalse: [result := (PlatypusExpressTypeOfBuilder typeOfSetFor: arg class platypusMetaData)].
					^ self return: (result collect: [:r | r val])]
		           #*);
	END_FUNCTION;

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

	FUNCTION VALUE ( V : STRING ) : NUMBER;
		(*#            | param nb result |
			param := self v.
			param pltNativeValue isString
				ifTrue: [[nb := param pltNativeValue asNumber.
					result := nb isInteger
								ifTrue: [PltIntegerLiteral new]
								ifFalse: [PltRealLiteral new].
					result val: nb]
						on: Error
						do: [result := PltMissingValue new]]
				ifFalse: [result := PltMissingValue new].
			^ self return: result
		           #*) (*# <pharo> | param nb result |
			(param := self v) isString
				ifTrue: [[result := param asNumber]
						on: Error
						do: [result := nil]]
				ifFalse: [result := nil].
			^ self return: result
		           #*);
	END_FUNCTION;

	FUNCTION VALUE_IN ( C : AGGREGATE OF GENERIC : gen; V : GENERIC : gen ) : LOGICAL;
		(*#            self signal: 'Value_in primitive is not implemented'.            #*) (*# <pharo> self signal: 'VALUE_IN primitive is not implemented'.            #*);
		RETURN ( ? );
	END_FUNCTION;

	FUNCTION VALUE_UNIQUE ( V : AGGREGATE OF GENERIC ) : LOGICAL;
		(*#            self signal: 'Value_unique primitive is not implemented'.            #*) (*# <pharo> self signal: 'VALUE_UNIQUE primitive is not implemented'.            #*);
		RETURN ( ? );
	END_FUNCTION;

	PROCEDURE INSERT ( VAR PL : LIST OF GENERIC : gen; PE : GENERIC : gen; PP : INTEGER );
		(*#           
			| l e p |
			l := self pL.
			e := self pE.
			p := self pP pltNativeValue.
			l pltAdd: e beforeIndex: p
		           #*) (*# <pharo>
			| l e p |
			l := self pL.
			e := self pE.
			p := self pP.
			p <= 0
				ifTrue: [l addFirst: e]
				ifFalse: [p >= l size
						ifTrue: [l addLast: e]
						ifFalse: [l add: e afterIndex: p]]
		           #*);
	END_PROCEDURE;

	PROCEDURE REMOVE ( VAR PL : LIST OF GENERIC : gen; PP : INTEGER );
		(*#           
			| l p |
			l := self pL.
			p := self pP pltNativeValue.
			l removeAt: p	
		           #*) (*# <pharo>
			| l p |
			l := self pL.
			p := self pP.
			l removeAt: p	
		           #*);
	END_PROCEDURE;

	FUNCTION NVL ( P : GENERIC : gen1; substitute : GENERIC : gen1 ) : GENERIC : gen1;
		(*#            | v | 
			(v := self p)
				ifMissing: [^ self return: (self substitute)]
				ifNotMissing: [^ self return: (v)]
		           #*) (*# <pharo> | v |
			^ (v := self p) ifNil: [self return: self substitute] ifNotNil: [self return: v] 
		           #*);
	END_FUNCTION;
END_SCHEMA;

</ISO10303-11-EXPRESS>
"
Class {
	#name : #PltExpressBuiltinsSchemaDefinition,
	#superclass : #PlatypusCoreSchema,
	#category : #'Platypus-ExpressBuiltinsSchema'
}

{ #category : #'platypus-generated-platypus-signature' }
PltExpressBuiltinsSchemaDefinition class >> iso10303P11Translater [
  ^'Platypus (c) LISYC EA3883, Universite de Bretagne occidentale. Brest.'


]

{ #category : #'platypus-generated-platypus-signature' }
PltExpressBuiltinsSchemaDefinition class >> translatedFromISO10303P11 [
  ^true


]

{ #category : #'platypus-generated-platypus-signature' }
PltExpressBuiltinsSchemaDefinition class >> vwNamespaceName [
  ^#Platypus


]

{ #category : #'platypus-generated-context-accessing' }
PltExpressBuiltinsSchemaDefinition >> context [
  ^self schemaInstance context


]

{ #category : #'platypus-generated-entities' }
PltExpressBuiltinsSchemaDefinition >> entityDefinitionCount [
  ^0


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration1 [
  ^#(#ABS #PltABSFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration10 [
  ^#(#FORMAT #PltFORMATFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration11 [
  ^#(#HIBOUND #PltHIBOUNDFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration12 [
  ^#(#HIINDEX #PltHIINDEXFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration13 [
  ^#(#LENGTH #PltLENGTHFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration14 [
  ^#(#LOBOUND #PltLOBOUNDFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration15 [
  ^#(#LOG #PltLOGFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration16 [
  ^#(#LOG2 #PltLOG2Function)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration17 [
  ^#(#LOG10 #PltLOG10Function)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration18 [
  ^#(#LOINDEX #PltLOINDEXFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration19 [
  ^#(#ODD #PltODDFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration2 [
  ^#(#ACOS #PltACOSFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration20 [
  ^#(#ROLESOF #PltROLESOFFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration21 [
  ^#(#SIN #PltSINFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration22 [
  ^#(#SIZEOF #PltSIZEOFFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration23 [
  ^#(#SQRT #PltSQRTFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration24 [
  ^#(#TAN #PltTANFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration25 [
  ^#(#TYPEOF #PltTYPEOFFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration26 [
  ^#(#USEDIN #PltUSEDINFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration27 [
  ^#(#VALUE #PltVALUEFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration28 [
  ^#(#VALUE_IN #PltValueInFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration29 [
  ^#(#VALUE_UNIQUE #PltValueUniqueFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration3 [
  ^#(#ASIN #PltASINFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration30 [
  ^#(#NVL #PltNVLFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration4 [
  ^#(#ATAN #PltATANFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration5 [
  ^#(#BLENGTH #PltBLENGTHFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration6 [
  ^#(#COS #PltCOSFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration7 [
  ^#(#EVEN #PltEVENFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration8 [
  ^#(#EXISTS #PltEXISTSFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclaration9 [
  ^#(#EXP #PltEXPFunction)


]

{ #category : #'platypus-generated-functions' }
PltExpressBuiltinsSchemaDefinition >> functionDeclarationCount [
  ^30


]

{ #category : #'platypus-generated-meta-data-accessing' }
PltExpressBuiltinsSchemaDefinition >> schemaInstanceClassName [
  ^#PltPlatypusExpressPrimitivesSchemaInstance


]
