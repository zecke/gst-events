SystemAnnouncement subclass: ClassRecategorizedEvent [

	<category: 'events'>

        ClassRecategorizedEvent class >> updatedClass: aClass oldCategory: anOldString to: aString [
		<category: 'instance creation'>

                ^ self new
                        updatedClass: aClass;
                        oldCategory: anOldString;
			category: aString;
                        yourself
        ]

        | class oldCategory category |

        oldCategory [
                <category: 'accessing'>

                ^ oldCategory
        ]

        oldCategory: aString [
                <category: 'accessing'>

                oldCategory := aString
        ]

        category [
                <category: 'accessing'>

                ^ category
        ]

        category: aString [
                <category: 'accessing'>

                category := aString
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
]

