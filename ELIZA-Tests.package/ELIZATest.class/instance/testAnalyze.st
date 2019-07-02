test
testAnalyze
	self assert: ((eliza analyze: 'Test') isMemberOf: ByteString)