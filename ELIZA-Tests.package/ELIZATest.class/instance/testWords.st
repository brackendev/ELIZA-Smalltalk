test
testWords
	self assert: ((eliza words: 'I am') at: 1) equals: 'I'.
	self assert: ((eliza words: 'I am') at: 2) equals: 'am'.