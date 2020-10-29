"
I am ELIZATest, a test class for testing the behavior of ELIZA.
"
Class {
	#name : #ELIZATest,
	#superclass : #TestCase,
	#instVars : [
		'eliza'
	],
	#category : 'ELIZA-Tests'
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
	self assert: ((eliza words: 'I am') at: 2) equals: 'am'.
]
