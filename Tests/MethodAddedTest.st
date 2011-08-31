TestCase subclass: MethodAddedTest [

	<category: 'tests'>

	| announcement |

	addedMethod: anAnnouncement [
		<category: 'event'>

		announcement := anAnnouncement
	]

	testMethodAdding [
		<category: 'testing'>
		
		Object subclass: #Foo123.
		SystemAnnouncer current on: MethodAddedEvent do: [ :ann | 
				self addedMethod: ann ].
		Foo123 compile: 'foo []'.
		self assert: announcement method = (Foo123 >> #foo)
	]
]

