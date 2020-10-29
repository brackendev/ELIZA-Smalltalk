specs
defaultSpec
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