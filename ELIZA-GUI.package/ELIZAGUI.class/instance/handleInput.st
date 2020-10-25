private
handleInput
	| text |
	text := fieldInput text trimBoth.
	text isEmpty
		ifTrue: [ ^ self ].

	self addInputResponse: text.
	self addELIZAResponse: (ELIZA respondTo: text).

	fieldInput text: ''