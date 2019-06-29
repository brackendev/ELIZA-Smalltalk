private
words: aString
	| list |
	list := OrderedCollection new.
	aString regex: '\w+' matchesDo: [ :word | list add: word ].
	^ list
