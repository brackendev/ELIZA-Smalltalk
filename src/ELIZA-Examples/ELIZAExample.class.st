"
Class: ELIZAExample

I represent a class that demonstrates the usage of the ELIZA chatbot.

Responsibilities:
- I provide an example of how to use the ELIZA chatbot.
- I know how to generate a response from the ELIZA chatbot.
- I can return a sample response to a given input.

Collaborators:
- ELIZA: I interact with the ELIZA class to generate responses based on the input provided.

Example:
- To use this class, call the exampleResponseTo method: `ELIZAExample exampleResponseTo`
  ""This will return a response from the ELIZA chatbot to the input 'Time for small talk.'""


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #ELIZAExample,
	#superclass : #Object,
	#category : #'ELIZA-Examples-Core'
}

{ #category : #example }
ELIZAExample class >> exampleResponseTo [

	<sampleInstance>
	^ ELIZA respondTo: 'Time for small talk.'
]
