private
reflect: aString response: aResponse
	| oc |
	oc := OrderedCollection new.

	(self words: aString)
		do: [ :word | 
			self reflections
				at: word asLowercase
				ifPresent: [ oc add: (self reflections at: word asLowercase) ]
				ifAbsent: [ oc add: word ]
			].

	^ aResponse copyReplaceAll: '{0}' with: (Character space join: oc)