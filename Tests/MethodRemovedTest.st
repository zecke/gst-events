TestCase subclass: MethodRemovedTest [

	<category: 'tests'>

	| announcement |

	removedMethod: anAnnouncement [
		<category: 'event'>

		announcement := anAnnouncement
	]

	testMethodAdding [
		<category: 'testing'>
	
		| mth |
		Object subclass: #Foo123.
		SystemAnnouncer current on: MethodRemovedEvent do: [ :ann | 
				self removedMethod: ann ].
		Foo123 compile: 'foo []'.
		mth := Foo123 removeSelector: #foo.
		self assert: announcement method = mth.
		self assert: announcement method = announcement item
	]
]

