baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec package: 'ELIZA-Core'.
			spec package: 'ELIZA-GUI' with: [ spec requires: #('ELIZA-Core') ] ]
