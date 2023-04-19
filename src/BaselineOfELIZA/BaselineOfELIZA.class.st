"
Class: BaselineOfELIZA

I represent the baseline configuration for the ELIZA chatbot implementation in Pharo.

Responsibilities:
- I define the required packages and dependencies for the ELIZA chatbot.
- I specify the loading order of the packages.
- I provide the necessary information for version management and package updates.

Collaborators:
- Metacello: I use Metacello to manage the project's dependencies and configurations.
- ELIZA packages: I interact with the various packages that make up the ELIZA chatbot implementation.

Example:
- ""Load the ELIZA chatbot with its baseline configuration"": Metacello new baseline: 'ELIZA'; repository: 'github://user/repo'; load.


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #BaselineOfELIZA,
	#superclass : #BaselineOf,
	#category : #BaselineOfELIZA
}

{ #category : #baselines }
BaselineOfELIZA >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec package: 'ELIZA'.
		spec
			package: 'ELIZA-Tests'
			with: [ spec requires: #( 'ELIZA' ) ].
		spec
			package: 'ELIZA-Examples'
			with: [ spec requires: #( 'ELIZA' 'ELIZA-GUI' ) ]
		]
]
