private
handleInput
	| text |
	text := self inputArea text trimBoth.
	text isEmpty
		ifTrue: [ ^ self ].
	self addInputResponse: self inputArea text.
	self addELIZAResponse: (ELIZA responseTo: self inputArea text).
	self inputArea text: ''
