public
start
	| e |
	e := ELIZAGUI new.
	e openWithSpec.
	e addELIZAResponse: ELIZA welcome
