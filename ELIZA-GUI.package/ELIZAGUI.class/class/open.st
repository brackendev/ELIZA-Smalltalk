public
open
	| gui |
	gui := self new
		openWithSpec;
		addELIZAResponse: ELIZA new welcomeMessage.
		gui fieldInput takeKeyboardFocus.