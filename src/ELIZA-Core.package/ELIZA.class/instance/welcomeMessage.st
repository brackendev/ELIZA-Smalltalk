private
welcomeMessage
	| a |
	a := Array new: 3.
	a at: 1 put: 'Please tell me what''s been bothering you.'.
	a at: 2 put: 'How do you do? Please tell me your problem.'.
	a at: 3 put: 'Is something troubling you?'.
	^ a shuffled at: 1