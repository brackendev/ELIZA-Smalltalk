initialization
initializeWidgets
	chatArea := self instantiate: TextPresenter.
	chatArea beForText;
	enabled: false.

	inputArea := self instantiate: TextInputFieldPresenter.
	inputArea whenTextIsAccepted: [ self handleInput ].

	self focusOrder add: inputArea