SystemAnnouncement subclass: NamespaceRemovedEvent [

	<category: 'events'>

        NamespaceRemovedEvent class >> removedNamespace: aNamespace [
		<category: 'instance creation'>

                ^ self new
                        removedNamespace: aNamespace;
                        yourself
        ]

        | namespace |

        removedNamespace [
                <category: 'accessing'>

                ^ namespace
        ]

        removedNamespace: aNamespace [
                <category: 'accessing'>

                namespace := aNamespace
        ]
]

