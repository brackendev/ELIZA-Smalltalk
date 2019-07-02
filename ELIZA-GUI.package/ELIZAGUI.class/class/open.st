public
open
	| eliza gui |
	eliza := ELIZA new.
	
	gui := ELIZAGUI new.
	gui openWithSpec.
	gui addELIZAResponse: eliza welcomeMessage