initialization
initializePresenters
	fieldOutput := self newText enabled: false.

	fieldInput := self newTextInput
		whenTextIsAcceptedDo: [ self handleInput ];
		placeholder: 'Say something'.

	self focusOrder add: fieldInput