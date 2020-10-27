private
addResponse: aString
	fieldOutput textArea text
		ifNotEmpty: [ fieldOutput textArea appendText: String crlf ].

	fieldOutput textArea appendText: aString