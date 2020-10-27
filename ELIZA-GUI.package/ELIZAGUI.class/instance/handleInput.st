private
handleInput
	| text |
	text := fieldInput text trimBoth.
	text ifEmpty: [ ^ self ].

	self addInputResponse: text.
	self addELIZAResponse: (ELIZA respondTo: text).

	fieldInput text: ''