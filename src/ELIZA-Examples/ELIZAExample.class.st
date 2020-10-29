"
I am ELIZAExample, an object to show the capabilities of ELIZA.
"
Class {
	#name : #ELIZAExample,
	#superclass : #Object,
	#category : 'ELIZA-Examples-Core'
}

{ #category : #example }
ELIZAExample class >> exampleResponseTo [
	<sampleInstance>
	^ ELIZA respondTo: 'Time for small talk.'
]
