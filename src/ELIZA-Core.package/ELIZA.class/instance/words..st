private
words: aString
	| oc |
	oc := OrderedCollection new.
	aString regex: '\w+' matchesDo: [ :word | oc add: word ].
	^ oc