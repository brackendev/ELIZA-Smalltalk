baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec package: 'ELIZA-Core'.
			spec package: 'ELIZA-GUI' with: [ spec requires: #('ELIZA-Core')].
			spec package: 'ELIZA-Tests' with: [ spec requires: #('ELIZA-Core') ].
			spec
				package: 'ELIZA-Examples'
				with: [ spec requires: #('ELIZA-Core' 'ELIZA-GUI') ]
			]