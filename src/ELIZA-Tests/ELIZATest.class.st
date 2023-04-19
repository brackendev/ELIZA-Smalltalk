"
Class: ELIZATest

I represent a test class for the ELIZA chatbot implementation.

Responsibilities:
- I execute test cases to ensure the proper functioning of the ELIZA chatbot.
- I validate the chatbot's responses against expected outputs.
- I help maintain the quality and reliability of the ELIZA chatbot implementation.

Collaborators:
- ELIZA: I interact with the ELIZA chatbot class to test its methods and responses.
- TestRunner: I work with the TestRunner to execute and report the results of my test cases.

Example:
- ""Running ELIZATest to verify the correctness of the ELIZA chatbot's responses and behavior.""


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #ELIZATest,
	#superclass : #TestCase,
	#instVars : [
		'eliza'
	],
	#category : #'ELIZA-Tests'
}

{ #category : #running }
ELIZATest >> setUp [

	super setUp.
	eliza := ELIZA new
]

{ #category : #test }
ELIZATest >> testAnalyze [

	self denyEmpty: (eliza analyze: 'Test')
]

{ #category : #test }
ELIZATest >> testPsychobabble [

	self denyEmpty: eliza psychobabble
]

{ #category : #test }
ELIZATest >> testReflectResponse [

	self assert: (eliza reflect: 'Test' response: 'Test') equals: 'Test'
]

{ #category : #test }
ELIZATest >> testReflections [

	self denyEmpty: eliza reflections
]

{ #category : #test }
ELIZATest >> testWelcomeMessage [

	self denyEmpty: eliza welcomeMessage
]

{ #category : #test }
ELIZATest >> testWords [

	self assert: ((eliza words: 'I am') at: 1) equals: 'I'.
	self assert: ((eliza words: 'I am') at: 2) equals: 'am'
]
