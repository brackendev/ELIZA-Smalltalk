private
handleInput
	| text |
	text := inputArea text trimBoth.
	text isEmpty
		ifTrue: [ ^ self ].

	self addInputResponse: inputArea text.
	self addELIZAResponse: (ELIZA respondTo: inputArea text).
	
	inputArea text: ''