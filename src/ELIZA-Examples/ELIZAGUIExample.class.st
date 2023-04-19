"
Class: ELIZAGUIExample

I represent an example class for the ELIZA GUI.

Responsibilities:
- I provide an example of how to use the ELIZA GUI.
- I demonstrate how to open the ELIZA GUI.
- I serve as a reference for users who want to learn how to interact with the ELIZA GUI.

Collaborators:
- ELIZAGUI: I interact with the ELIZAGUI class to open the GUI.

Example:
- To use the ELIZAGUIExample class, simply call the example method: ""ELIZAGUIExample example""


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #ELIZAGUIExample,
	#superclass : #Object,
	#category : #'ELIZA-Examples-GUI'
}

{ #category : #example }
ELIZAGUIExample class >> example [

	<sampleInstance>
	ELIZAGUI open
]
