SystemAnnouncement subclass: MethodAddedEvent [

        <category: 'events'>

        MethodAddedEvent class >> method: aCompiledMethod [
                <category: 'instance creation'>

                ^ self new
                        method: aCompiledMethod;
                        yourself
        ]

        | method |

        method [
                <category: 'accessing'>

                ^ method
        ]

        method: aCompiledMethod [
                <category: 'accessing'>

                method := aCompiledMethod
        ]

	item [
		<category: 'accessing'>

		^ self method
	]
]
