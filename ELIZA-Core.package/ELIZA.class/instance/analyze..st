private
analyze: aString
	| cleanup |
	cleanup := (aString asLowercase) trimRight: [ :c | c = $. ].
	cleanup := cleanup trimRight: [ :c | c = $! ].

	self psychobabble
		keysDo: [ :key | 
			| rx |
			rx := key asLowercase asRegex.
			(rx matchesPrefix: cleanup)
				ifTrue: [ rx subexpressionCount > 1
						ifTrue: [ | subexpression babble reflect |
							subexpression := rx subexpression: 2.
							babble := self psychobabble: key.
							reflect := self reflect: subexpression response: babble.
							^ reflect
							]
						ifFalse: [ ^ self reflect: cleanup response: (self psychobabble: key) ]
					]
			].

	^ nil