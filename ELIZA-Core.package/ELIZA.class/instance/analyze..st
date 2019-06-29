private
analyze: aString
	| string |
	string := aString trimRight: [ :c | c = $. ].
	string := string trimRight: [ :c | c = $! ].
	self psychobabble
		keysDo: [ :key | 
			| rx |
			rx := key asRegex.
			(rx matchesPrefix: string)
				ifTrue: [ rx subexpressionCount > 1
						ifTrue: [ ^ self reflect: (rx subexpression: 2) response: (self psychobabble: key) ]
						ifFalse: [ ^ self reflect: string response: (self psychobabble: key) ]
					]
			] 
