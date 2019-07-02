private
addResponse: aString
	chatArea textArea text isEmpty
		ifFalse: [ chatArea textArea appendText: String crlf ].

	chatArea textArea appendText: aString