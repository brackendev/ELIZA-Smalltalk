"
Class: ELIZAGUI

I represent a graphical user interface for interacting with the ELIZA chatbot.

Responsibilities:
- I open and display the chatbot interface.
- I handle user input and display chatbot responses.
- I manage the layout and appearance of the chatbot interface.

Collaborators:
- ELIZA: I interact with the ELIZA chatbot to receive and display its responses.
- SpBoxLayout: I use SpBoxLayout to define the layout of the chatbot interface.

Example:
- ""ELIZAGUI open"" opens the ELIZA chatbot interface.


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #ELIZAGUI,
	#superclass : #SpPresenter,
	#instVars : [
		'fieldInput',
		'fieldOutput'
	],
	#category : #'ELIZA-GUI'
}

{ #category : #layout }
ELIZAGUI class >> defaultLayout [

	<spec: #default>
	^ SpBoxLayout newTopToBottom
		  add: #fieldOutput;
		  add: #fieldInput withConstraints: [ :constraints | 
			  constraints height: 25.
			  constraints padding: 5
			  ];
		  yourself
]

{ #category : #public }
ELIZAGUI class >> open [

	| gui |
	gui := self new
		       open;
		       addELIZAResponse: ELIZA new welcomeMessage.
	gui fieldInput takeKeyboardFocus
]

{ #category : #private }
ELIZAGUI >> addELIZAResponse: aString [

	self addResponse: 'ELIZA: ' , aString
]

{ #category : #private }
ELIZAGUI >> addInputResponse: aString [

	self addResponse: 'YOU: ' , aString
]

{ #category : #private }
ELIZAGUI >> addResponse: aString [

	fieldOutput insert: aString , String crlf at: fieldOutput text size
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
ELIZAGUI >> handleInput: aString [

	| text |
	text := aString trimBoth.
	text ifEmpty: [ ^ nil ].

	self addInputResponse: text.
	self addELIZAResponse: (ELIZA respondTo: text).

	fieldInput text: ''
]

{ #category : #initialization }
ELIZAGUI >> initializePresenters [

	fieldOutput := self newText
		               beNotEditable;
		               enabled: false.

	fieldInput := self newTextInput
		              whenSubmitDo: [ :text | self handleInput: text ];
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
