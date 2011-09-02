TestCase subclass: NamespaceRemovedTest [

	<category: 'tests'>

	| announcement |

	removedNamespace: anAnnouncement [
		<category: 'event'>

		announcement := anAnnouncement
	]

	testNamespaceRemoving [
		<category: 'testing'>

		Smalltalk addSubspace: #Foo.
		SystemAnnouncer current on: NamespaceRemovedEvent do: [ :ann | 
				self removedNamespace: ann ].
		Smalltalk removeSubspace: #Foo.
		self assert: announcement removedNamespace = Foo.
		self assert: announcement removedNamespace = announcement item
	]
]

