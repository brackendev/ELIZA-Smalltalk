initialization
initializeWidgets
	chatArea := self instantiate: TextPresenter.
	self chatArea enabled: false.
	inputArea := self instantiate: TextInputFieldPresenter.
	self inputArea whenTextIsAccepted: [ self handleInput ].
	self focusOrder add: self inputArea 
