TestCase subclass: ClassAddedTest [

	<category: 'tests'>

	| announcement |

	addedClass: anAnnouncement [
		<category: 'event'>

		announcement := anAnnouncement
	]

	testClassAdding [
		<category: 'testing'>

		SystemAnnouncer current on: ClassAddedEvent do: [ :ann | 
				self addedClass: ann ].
		Object subclass: #Foo234.
		self assert: announcement addedClass == announcement item.
		self assert: announcement addedClass == Foo234
	]
]

