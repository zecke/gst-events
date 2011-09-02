SystemAnnouncement subclass: NamespaceAddedEvent [

	<category: 'events'>

        NamespaceAddedEvent class >> addedNamespace: aNamespace [
		<category: 'instance creation'>

                ^ self new
                        addedNamespace: aNamespace;
                        yourself
        ]

        | namespace |

        addedNamespace [
                <category: 'accessing'>

                ^ namespace
        ]

        addedNamespace: aNamespace [
                <category: 'accessing'>

                namespace := aNamespace
        ]

        item [
                <category: 'accessing'>

                ^ self addedNamespace
        ]
]

