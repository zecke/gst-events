CompiledMethod subclass: BlockWrapper [

	<category: 'wrapper'>

        BlockWrapper class >> installOn: aClass named: aSymbol [
                <category: 'instance creation'>

                ^ (self numArgs: aSymbol numArgs)
                                        method: (aClass >> aSymbol);
                                        install;
                                        yourself
        ]

        BlockWrapper class >> installOn: aClass named: aSymbol with: aThreeArgsBlock [
                <category: 'instance creation'>

                ^ (self installOn: aClass named: aSymbol)
                                        block: aThreeArgsBlock;
                                        yourself
        ]

        BlockWrapper class >> installOn: aClass selectors: anArray with: aThreeArgsBlock [
                <category: 'instance creation'>

                ^ anArray collect: [ :each | 
			(self installOn: aClass named: each)
                                        block: aThreeArgsBlock;
                                        yourself ]
        ]

        | method block |

        method: aCompiledMethod [
                <category: 'accessing'>

                method := aCompiledMethod
        ]

        block: aThreeArgsBlock [
                <category: 'accessing'>

                block := aThreeArgsBlock
        ]

        install [
                <category: 'installing'>

                (method methodClass)
                        addSelector: method selector withMethod: self
        ]

        valueWithReceiver: anObject withArguments: anArray [
                <category: 'wrapper'>

                ^ block value: anObject value: anArray value: method
        ]
]

