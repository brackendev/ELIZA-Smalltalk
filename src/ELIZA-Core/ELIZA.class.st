"
I am ELIZA, an object based on an early natural language processing computer program.

Example invocation:

	ELIZA respondTo: 'Time for small talk'

"
Class {
	#name : #ELIZA,
	#superclass : #Object,
	#category : 'ELIZA-Core'
}

{ #category : #public }
ELIZA class >> respondTo: aString [
	^ ELIZA new analyze: aString
]

{ #category : #private }
ELIZA >> analyze: aString [
	| cleanup |
	cleanup := aString asLowercase trimRight: [ :c | c = $. ].
	cleanup := cleanup trimRight: [ :c | c = $! ].

	self psychobabble
		keysDo:
			[ :key | 
			| rx |
			rx := key asLowercase asRegex.
			(rx matchesPrefix: cleanup)
				ifTrue:
					[ ^ rx subexpressionCount > 1
						ifTrue:
							[ | subexpression babble |
							subexpression := rx subexpression: 2.
							babble := self psychobabble: key.
							self reflect: subexpression response: babble.
							]
						ifFalse: [ self reflect: cleanup response: (self psychobabble: key) ]
					]
			].

	^ nil
]

{ #category : #private }
ELIZA >> psychobabble [
	| dict array |
	dict := OrderedDictionary new.

	array := Array new: 3.
	array at: 1 put: 'Why do you need {0}?'.
	array at: 2 put: 'Would it really help you to get {0}?'.
	array at: 3 put: 'Are you sure you need {0}?'.
	dict at: 'I need (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'Do you really think I don''t {0}?'.
	array at: 2 put: 'Perhaps eventually I will {0}.'.
	array at: 3 put: 'Do you really want me to {0}?'.
	dict at: 'Why don''?t you ([^?]*)\?' put: array.

	array := Array new: 4.
	array at: 1 put: 'Do you think you should be able to {0}?'.
	array at: 2 put: 'If you could {0}, what would you do?'.
	array at: 3 put: 'I don''t know -- why can''t you {0}?'.
	array at: 4 put: 'Have you really tried?'.
	dict at: 'Why can''?t I ([^?]*)\?' put: array.

	array := Array new: 3.
	array at: 1 put: 'How do you know you can''t {0}?'.
	array at: 2 put: 'Perhaps you could {0} if you tried.'.
	array at: 3 put: 'What would it take for you to {0}?'.
	dict at: 'I can''?t (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'Did you come to me because you are {0}?'.
	array at: 2 put: 'How long have you been {0}?'.
	array at: 3 put: 'How do you feel about being {0}?'.
	dict at: 'I am (.*)' put: array.

	array := Array new: 4.
	array at: 1 put: 'How does being {0} make you feel?'.
	array at: 2 put: 'Do you enjoy being {0}?'.
	array at: 3 put: 'Why do you tell me you''re {0}?'.
	array at: 4 put: 'Why do you think you''re {0}?'.
	dict at: 'I''m (.*)' put: array.

	array := Array new: 4.
	array at: 1 put: 'Why does it matter whether I am {0}?'.
	array at: 2 put: 'Would you prefer it if I were not {0}?'.
	array at: 3 put: 'Perhaps you believe I am {0}.'.
	array at: 4 put: 'I may be {0} -- what do you think?'.
	dict at: 'Are you ([^?]*)\?' put: array.

	array := Array new: 3.
	array at: 1 put: 'Why do you ask?'.
	array at: 2 put: 'How would an answer to that help you?'.
	array at: 3 put: 'What do you think?'.
	dict at: 'What (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'How do you suppose?'.
	array at: 2 put: 'Perhaps you can answer your own question.'.
	array at: 3 put: 'What is it you''re really asking?'.
	dict at: 'How (.*)' put: array.

	array := Array new: 4.
	array at: 1 put: 'Is that the real reason?'.
	array at: 2 put: 'What other reasons come to mind?'.
	array at: 3 put: 'Does that reason apply to anything else?'.
	array at: 4 put: 'If {0}, what else must be true?'.
	dict at: 'Because (.*)' put: array.

	array := Array new: 2.
	array at: 1 put: 'There are many times when no apology is needed.'.
	array at: 2 put: 'What feelings do you have when you apologize?'.
	dict at: '(.*) sorry (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'Hello... I''m glad you could drop by today.'.
	array at: 2 put: 'Hi there... how are you today?'.
	array at: 3 put: 'Hello, how are you feeling today?'.
	dict at: 'Hello(.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'Do you doubt {0}?'.
	array at: 2 put: 'Do you really think so?'.
	array at: 3 put: 'But you''re not sure {0}?'.
	dict at: 'I think (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'Tell me more about your friends.'.
	array at: 2 put: 'When you think of a friend, what comes to mind?'.
	array at: 3 put: 'Why don''t you tell me about a childhood friend?'.
	dict at: '(.*) friend (.*)' put: array.

	array := Array new: 2.
	array at: 1 put: 'You seem quite sure.'.
	array at: 2 put: 'OK, but can you elaborate a bit?'.
	dict at: 'Yes' put: array.

	array := Array new: 4.
	array at: 1 put: 'Are you really talking about me?'.
	array at: 2 put: 'Does it seem strange to talk to a computer?'.
	array at: 3 put: 'How do computers make you feel?'.
	array at: 4 put: 'Do you feel threatened by computers?'.
	dict at: '(.*) computer(.*)' put: array.

	array := Array new: 4.
	array at: 1 put: 'Do you think it is {0}?'.
	array at: 2 put: 'Perhaps it''s {0} -- what do you think?'.
	array at: 3 put: 'If it were {0}, what would you do?'.
	array at: 4 put: 'It could well be that {0}.'.
	dict at: 'Is it (.*)' put: array.

	array := Array new: 2.
	array at: 1 put: 'You seem very certain.'.
	array
		at: 2
		put: 'If I told you that it probably isn''t {0}, what would you feel?'.
	dict at: 'It is (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'What makes you think I can''t {0}?'.
	array at: 2 put: 'If I could {0}, then what?'.
	array at: 3 put: 'Why do you ask if I can {0}?'.
	dict at: 'Can you ([^?]*)\?' put: array.

	array := Array new: 3.
	array at: 1 put: 'Perhaps you don''t want to {0}.'.
	array at: 2 put: 'Do you want to be able to {0}?'.
	array at: 3 put: 'If you could {0}, would you?'.
	dict at: 'Can I ([^?]*)\?' put: array.

	array := Array new: 4.
	array at: 1 put: 'Why do you think I am {0}?'.
	array at: 2 put: 'Does it please you to think that I''m {0}?'.
	array at: 3 put: 'Perhaps you would like me to be {0}.'.
	array at: 4 put: 'Perhaps you''re really talking about yourself?'.
	dict at: 'You are (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'Why do you say I am {0}?'.
	array at: 2 put: 'Why do you think I am {0}?'.
	array at: 3 put: 'Are we talking about you, or me?'.
	dict at: 'You''re (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'Don''t you really {0}?'.
	array at: 2 put: 'Why don''t you {0}?'.
	array at: 3 put: 'Do you want to {0}?'.
	dict at: 'I don''t (.*)' put: array.

	array := Array new: 4.
	array at: 1 put: 'Good, tell me more about these feelings.'.
	array at: 2 put: 'Do you often feel {0}?'.
	array at: 3 put: 'When do you usually feel {0}?'.
	array at: 4 put: 'When you feel {0}, what do you do?'.
	dict at: 'I feel (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'Why do you tell me that you''ve {0}?'.
	array at: 2 put: 'Have you really {0}?'.
	array at: 3 put: 'Now that you have {0}, what will you do next?'.
	dict at: 'I have (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'Could you explain why you would {0}?'.
	array at: 2 put: 'Why would you {0}?'.
	array at: 3 put: 'Who else knows that you would {0}?'.
	dict at: 'I would (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'Do you think there is {0}?'.
	array at: 2 put: 'It''s likely that there is {0}.'.
	array at: 3 put: 'Would you like there to be {0}?'.
	dict at: 'Is there (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'I see, your {0}.'.
	array at: 2 put: 'Why do you say that your {0}?'.
	array at: 3 put: 'When your {0}, how do you feel?'.
	dict at: 'My (.*)' put: array.

	array := Array new: 3.
	array at: 1 put: 'We should be discussing you, not me.'.
	array at: 2 put: 'Why do you say that about me?'.
	array at: 3 put: 'Why do you care whether I {0}?'.
	dict at: 'You (.*)' put: array.

	array := Array new: 2.
	array at: 1 put: 'Why don''t you tell me the reason why {0}?'.
	array at: 2 put: 'Why do you think {0}?'.
	dict at: 'Why (.*)' put: array.

	array := Array new: 4.
	array at: 1 put: 'What would it mean to you if you got {0}?'.
	array at: 2 put: 'Why do you want {0}?'.
	array at: 3 put: 'What would you do if you got {0}?'.
	array at: 4 put: 'If you got {0}, then what would you do?'.
	dict at: 'I want (.*)' put: array.

	array := Array new: 5.
	array at: 1 put: 'Tell me more about your mother.'.
	array at: 2 put: 'What was your relationship with your mother like?'.
	array at: 3 put: 'How do you feel about your mother?'.
	array at: 4 put: 'How does this relate to your feelings today?'.
	array at: 5 put: 'Good family relations are important.'.
	dict at: '(.*) mother(.*)' put: array.

	array := Array new: 5.
	array at: 1 put: 'Tell me more about your father.'.
	array at: 2 put: 'How did your father make you feel?'.
	array at: 3 put: 'How do you feel about your father?'.
	array
		at: 4
		put:
			'Does your relationship with your father relate to your feelings today?'.
	array
		at: 5
		put: 'Do you have trouble showing affection with your family?'.
	dict at: '(.*) father(.*)' put: array.

	array := Array new: 5.
	array at: 1 put: 'Tell me more about your father.'.
	array at: 2 put: 'How did your father make you feel?'.
	array at: 3 put: 'How do you feel about your father?'.
	array
		at: 4
		put:
			'Does your relationship with your father relate to your feelings today?'.
	array
		at: 5
		put: 'Do you have trouble showing affection with your family?'.
	dict at: '(.*) father(.*)' put: array.

	array := Array new: 5.
	array at: 1 put: 'Did you have close friends as a child?'.
	array at: 2 put: 'What is your favorite childhood memory?'.
	array
		at: 3
		put: 'Do you remember any dreams or nightmares from childhood?'.
	array at: 4 put: 'Did the other children sometimes tease you?'.
	array
		at: 5
		put:
			'How do you think your childhood experiences relate to your feelings today?'.
	dict at: '(.*) child(.*)' put: array.

	array := Array new: 4.
	array at: 1 put: 'Why do you ask that?'.
	array
		at: 2
		put: 'Please consider whether you can answer your own question.'.
	array at: 3 put: 'Perhaps the answer lies within yourself?'.
	array at: 4 put: 'Why don''t you tell me?'.
	dict at: '(.*)\?' put: array.

	array := Array new: 3.
	array at: 1 put: 'Thank you for talking with me.'.
	array at: 2 put: 'Good-bye.'.
	array at: 3 put: 'Thank you, that will be $150. Have a good day!'.
	dict at: 'quit' put: array.

	array := Array new: 10.
	array at: 1 put: 'Please tell me more.'.
	array
		at: 2
		put: 'Let''s change focus a bit... Tell me about your family.'.
	array at: 3 put: 'Can you elaborate on that?'.
	array at: 4 put: 'Why do you say that {0}?'.
	array at: 5 put: 'I see.'.
	array at: 6 put: 'Very interesting.'.
	array at: 7 put: '{0}.'.
	array at: 8 put: 'I see. And what does that tell you?'.
	array at: 9 put: 'How does that make you feel?'.
	array at: 10 put: 'How do you feel when you say that?'.
	dict at: '(.*)' put: array.

	^ dict
]

{ #category : #private }
ELIZA >> psychobabble: aKey [
 ^ (self psychobabble at: aKey) shuffled at: 1.

]

{ #category : #private }
ELIZA >> reflect: aString response: aResponse [
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
]

{ #category : #private }
ELIZA >> reflections [
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

]

{ #category : #private }
ELIZA >> welcomeMessage [
	| a |
	a := Array new: 3.
	a at: 1 put: 'Please tell me what''s been bothering you.'.
	a at: 2 put: 'How do you do? Please tell me your problem.'.
	a at: 3 put: 'Is something troubling you?'.
	^ a shuffled at: 1
]

{ #category : #private }
ELIZA >> words: aString [
	| oc |
	oc := OrderedCollection new.
	aString regex: '\w+' matchesDo: [ :word | oc add: word ].
	^ oc
]
