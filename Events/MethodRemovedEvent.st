SystemAnnouncement subclass: MethodRemovedEvent [

        <category: 'events'>

        MethodRemovedEvent class >> method: aCompiledMethod [
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
