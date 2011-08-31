TestCase subclass: ClassDefinitionChangedTest [

        <category: 'tests'>

        | announcement |

        changedClass: anAnnouncement [
                <category: 'event'>

                announcement := anAnnouncement
        ]

        testClassAdding [
                <category: 'testing'>

                Object subclass: #Foo123.
                SystemAnnouncer current on: ClassDefinitionChangedEvent do: [ :ann | 
                                self changedClass: ann ].

		Foo123 superclass: nil.
                self assert: announcement oldClass name = #Foo123.
                self assert: announcement updatedClass = Foo123.
                self assert: announcement updatedClass superclass isNil.

		Foo123 addInstVarName: 'a'.
		self assert: announcement updatedClass allInstVarNames = #(#a)
        ]
]

