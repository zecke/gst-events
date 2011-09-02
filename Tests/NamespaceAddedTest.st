TestCase subclass: NamespaceAddedTest [

	<category: 'tests'>

	| announcement |

	addedNamespace: anAnnouncement [
		<category: 'event'>

		announcement := anAnnouncement
	]

	testNamespaceAdding [
		<category: 'testing'>

		SystemAnnouncer current on: NamespaceAddedEvent do: [ :ann | 
				self addedNamespace: ann ].
		Smalltalk addSubspace: #Foo.
		self assert: announcement addedNamespace = Foo.
		self assert: announcement addedNamespace = announcement item
	]
]

