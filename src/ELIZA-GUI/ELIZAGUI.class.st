"
I am ELIZAGUI, an object to interact graphically with ELIZA.

Example invocation:

	ELIZAGUI open.

"
Class {
	#name : #ELIZAGUI,
	#superclass : #SpPresenter,
	#instVars : [
		'fieldInput',
		'fieldOutput'
	],
	#category : 'ELIZA-GUI'
}

{ #category : #specs }
ELIZAGUI class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add: #fieldOutput;
		add: #fieldInput
			withConstraints:
			[ :constraints | 
			constraints height: 25.
			constraints padding: 5
			];
		yourself
]

{ #category : #public }
ELIZAGUI class >> open [
	| gui |
	gui := self new
		openWithSpec;
		addELIZAResponse: ELIZA new welcomeMessage.
		gui fieldInput takeKeyboardFocus.
]

{ #category : #private }
ELIZAGUI >> addELIZAResponse: aString [
	self addResponse: 'ELIZA: ', aString

]

{ #category : #private }
ELIZAGUI >> addInputResponse: aString [
	self addResponse: 'YOU: ' , aString

]

{ #category : #private }
ELIZAGUI >> addResponse: aString [
	fieldOutput textArea text
		ifNotEmpty: [ fieldOutput textArea appendText: String crlf ].

	fieldOutput textArea appendText: aString
]

{ #category : #'spec accessing' }
ELIZAGUI >> fieldInput [
	^ fieldInput
]

{ #category : #'spec accessing' }
ELIZAGUI >> fieldOutput [
	^ fieldOutput
]

{ #category : #'spec accessing' }
ELIZAGUI >> fieldOutput: anObject [
	fieldOutput := anObject
]

{ #category : #'spec accessing' }
ELIZAGUI >> fileInput: anObject [
	fieldInput := anObject
]

{ #category : #private }
ELIZAGUI >> handleInput [
	| text |
	text := fieldInput text trimBoth.
	text ifEmpty: [ ^ self ].

	self addInputResponse: text.
	self addELIZAResponse: (ELIZA respondTo: text).

	fieldInput text: ''
]

{ #category : #initialization }
ELIZAGUI >> initializePresenters [
	fieldOutput := self newText enabled: false.

	fieldInput := self newTextInput
		whenTextIsAcceptedDo: [ self handleInput ];
		placeholder: 'Say something'.

	self focusOrder add: fieldInput
]

{ #category : #initialization }
ELIZAGUI >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		aboutText: 'https://github.com/brackendev/ELIZA-Smalltalk';
		initialExtent: 400 @ 300;
		title: 'ELIZA'
]
