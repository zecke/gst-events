TestCase subclass: ClassRecategorizedTest [

        <category: 'tests'>

        | announcement |

        changedClass: anAnnouncement [
                <category: 'event'>

                announcement := anAnnouncement
        ]

        testClassRecategorized [
                <category: 'testing'>

		Object subclass: #Foo123.
                SystemAnnouncer current on: ClassRecategorizedEvent do: [ :ann |
                                self changedClass: ann ].
		Foo123 category: 'bla'.
                self assert: announcement updatedClass = Foo123.
                self assert: announcement category = 'bla'.
                self assert: announcement oldCategory isNil 
        ]
]

