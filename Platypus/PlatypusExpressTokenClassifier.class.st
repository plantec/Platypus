Class {
	#name : #PlatypusExpressTokenClassifier,
	#superclass : #PlatypusTokenClassifier,
	#category : #'Platypus-HW-CodeTokens'
}

{ #category : #accessing }
PlatypusExpressTokenClassifier >> builtinFunctionsSymbols [
	^ #(#'value_in' #'value_unique' #even #odd #blength #hiindex #rolesof #sin #valueIn #lobound #nvl #format #hibound #cos #log10 #length #tan #usedin #typeof #log2 #abs #exp #asin #sqrt #acos #exists #sizeof #log #loindex #valueUnique #atan #value )
]

{ #category : #accessing }
PlatypusExpressTokenClassifier >> builtinProceduresSymbols [
	^ #(#remove #insert )
]

{ #category : #'initialize/release' }
PlatypusExpressTokenClassifier >> initialize [
	super initialize.
	#('[' '{' '(' '{*' )
		do: [:value | tokensClassByTokenValueMap at: value put: PlatypusOpenDelimToken].
	#(']' '}' ')' '*}' )
		do: [:value | tokensClassByTokenValueMap at: value put: PlatypusCloseDelimToken].
	#('.' ',' '\' ':' '|' '<*' '?' )
		do: [:value | tokensClassByTokenValueMap at: value put: PlatypusDelimToken].
	#('||' '=' '<>' ':=:' '-' '<' '<=' '/' '*' '>=' '**' ':<>' )
		do: [:value | tokensClassByTokenValueMap at: value put: PlatypusOperatorToken].
	#(#true #false #unknown )
		do: [:symbol | tokensClassByTokenSymbolMap at: symbol put: PlatypusLogicalToken].
	#('.F.' '.T.' '.U.' )
		do: [:symbol | tokensClassByTokenValueMap at: symbol put: PlatypusLogicalToken].
	#(#alias #begin #repeat #if  #local #case #constant )
		do: [:symbol | tokensClassByTokenSymbolMap at: symbol put: PlatypusOpenKeywordToken].
	#(#rule #entity #type #function #procedure #schema #map)
		do: [:symbol | tokensClassByTokenSymbolMap at: symbol put: PlatypusPrimaryElementOpenKeywordToken].
	#(#'end_repeat' #'end_if' #'end_alias' #'end_case' #end #'end_constant' #'end_local' )
		do: [:symbol | tokensClassByTokenSymbolMap at: symbol put: PlatypusCloseKeywordToken].
	#(#'end_function' #'end_entity' #'end_schema' #'end_rule' #'end_type' #'end_procedure' #'end_map' )
		do: [:symbol | tokensClassByTokenSymbolMap at: symbol put: PlatypusPrimaryElementCloseKeywordToken].
	#(#where #inverse #unique #enumeration #else #then #derive #select )
		do: [:symbol | tokensClassByTokenSymbolMap at: symbol put: PlatypusGroupKeywordToken].
	#(#meta #reference #constE #use #skip #fixed #while #to #return #optional #pi #of #by #otherwise #escape #self #var #as #until #subtype #abstract #supertype #for #from #generic )
		do: [:symbol | tokensClassByTokenSymbolMap at: symbol put: PlatypusKeywordToken].
	#(#div #and #andor #xor #in #oneof #query #mod #not #or #like )
		do: [:symbol | tokensClassByTokenSymbolMap at: symbol put: PlatypusOperatorToken].
	#(#list #real #array #set #binary #number #aggregate #logical #string #bag #integer #boolean #generic )
		do: [:symbol | tokensClassByTokenSymbolMap at: symbol put: PlatypusBuiltinDomainToken].
	self builtinProceduresSymbols
		do: [:symbol | tokensClassByTokenSymbolMap at: symbol put: PlatypusBuiltinProcedureToken].
	self builtinFunctionsSymbols
		do: [:symbol | tokensClassByTokenSymbolMap at: symbol put: PlatypusBuiltinFunctionToken].
	tokensClassByTokenValueMap at: ';' asSymbol put: PlatypusSemicolonToken.
	tokensClassByTokenValueMap at: ':=' asSymbol put: PlatypusAssignToken.
	tokensClassByTokenValueMap at: '+' asSymbol put: PlatypusPlusToken.
	tokensClassByTokenValueMap at: $; put: PlatypusSemicolonToken.
	tokensClassByTokenValueMap at: ':=' put: PlatypusAssignToken.
	tokensClassByTokenValueMap at: $+ put: PlatypusPlusToken.
	tokensClassByTokenValueMap at: ';' put: PlatypusSemicolonToken.
	tokensClassByTokenValueMap at: '+' put: PlatypusPlusToken.
	tokensClassByTokenValueMap at: Character space put: PlatypusOneWhiteSpaceToken.
	tokensClassByTokenValueMap at: Character tab put: PlatypusIndentToken.
	tokensClassByTokenValueMap at: Character cr put: PlatypusEolToken.
	tokensClassByTokenValueMap at: Character lf put: nil.
	self
		classifyString: PlatypusNumberToken
		block: [:v | v size > 1
				and: [(v first = $-
							or: [v first = $+])
						and: [v
								allSatisfy: [:c | c isDigit
										or: [#($. $e $- $+ ) includes: c]]]]].
	self
		classifyString: PlatypusLogicalToken
		block: [:v | v size > 2
				and: [v first = $.
						and: [v last = $.]]].
	self
		classifyString: PlatypusNumberToken
		block: [:v | v notEmpty
				and: [v first isDigit]].
	self
		classifyString: PlatypusStringToken
		block: [:v | v notEmpty
				and: [v first == $']].
	self
		classifyString: PlatypusStringToken
		block: [:v | v notEmpty
				and: [v first == $"]].
	self
		classifyString: PlatypusStringToken
		block: [:v | v notEmpty
				and: [v first == $%]]
]
