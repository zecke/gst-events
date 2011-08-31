Announcer subclass: SystemAnnouncer [

    <category: 'announcer'>

    SystemAnnouncer class [ | current | ]

    SystemAnnouncer class >> current [
        <category: 'accessing'>

        ^ current ifNil: [ current := super new ]
    ]

    SystemAnnouncer class >> new [
        <category: 'instance creation'>

        self shouldNotImplement
    ]
]

