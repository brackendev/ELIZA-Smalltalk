private
reflections
	| dict |
	dict := OrderedDictionary new.
	dict at: 'am' put: 'are'.
	dict at: 'was' put: 'were'.
	dict at: 'i' put: 'you'.
	dict at: 'i''d' put: 'you would'.
	dict at: 'i''ve' put: 'you have'.
	dict at: 'i''ll' put: 'you will'.
	dict at: 'my' put: 'your'.
	dict at: 'are' put: 'am'.
	dict at: 'you''ve' put: 'I have'.
	dict at: 'you''ll' put: 'I will'.
	dict at: 'your' put: 'my'.
	dict at: 'yours' put: 'mine'.
	dict at: 'you' put: 'me'.
	dict at: 'me' put: 'you'.
	^ dict
