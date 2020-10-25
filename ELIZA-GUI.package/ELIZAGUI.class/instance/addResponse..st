private
addResponse: aString
	fieldOutput textArea text isEmpty
		ifFalse: [ fieldOutput textArea appendText: String crlf ].

	fieldOutput textArea appendText: aString