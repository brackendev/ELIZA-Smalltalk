specs
defaultSpec
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :row | 
			row
				newColumn: [ :column | column newRow: [ :r | r newColumn: #chatArea ] ];
				newRow: #inputArea height: 25
			]
