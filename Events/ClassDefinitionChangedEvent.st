SystemAnnouncement subclass: ClassDefinitionChangedEvent [

	<category: 'events'>

        ClassDefinitionChangedEvent class >> oldClass: anOldClass class: aClass [
		<category: 'instance creation'>

                ^ self new
                        oldClass: anOldClass;
                        updatedClass: aClass;
                        yourself
        ]

        | oldClass class |

        oldClass [
                <category: 'accessing'>

                ^ oldClass
        ]

        oldClass: aClass [
                <category: 'accessing'>

                oldClass := aClass
        ]

        updatedClass [
                <category: 'accessing'>

                ^ class
        ]

        updatedClass: aClass [
                <category: 'accessing'>

                class := aClass
        ]

        item [
                <category: 'accessing'>

                ^ self updatedClass
        ]

        oldItem [
                <category: 'accessing'>

                ^ self oldClass
        ]

	isSuperclassModified [
		<category: 'testing'>

		^ self oldClass superclass ~~ self updatedClass superclass
	]
]

