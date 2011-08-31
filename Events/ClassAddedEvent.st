SystemAnnouncement subclass: ClassAddedEvent [

	<category: 'events'>

        ClassAddedEvent class >> addedClass: aClass [
		<category: 'instance creation'>

                ^ self new
                        addedClass: aClass;
                        yourself
        ]

        | class |

        addedClass [
                <category: 'accessing'>

                ^ class
        ]

        addedClass: aClass [
                <category: 'accessing'>

                class := aClass
        ]
]

