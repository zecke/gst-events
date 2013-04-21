UndefinedObject extend [

	allInstVarNames [
                <category: '*ChangeSet'>

                ^ #()
	]

        name [
                <category: '*ChangeSet'>

                ^ 'nil'
        ]
]

Behavior extend [

        setSuperclass: aClass [
                <category: '*ChangeSet'>

                superClass := aClass.
                instanceSpec isNil
                        ifTrue:
                                [instanceSpec := aClass isNil ifTrue: [0] ifFalse: [aClass instanceSpec]]
        ]
]

Class extend [

	setCategory: aString [
                <category: '*ChangeSet'>

		category := aString
	]
]

Metaclass extend [

    newMeta: className environment: aNamespace subclassOf: theSuperclass instanceVariableArray: arrayOfInstVarNames shape: shape classPool: classVarDict poolDictionaries: sharedPoolNames category: categoryName [
        "Private - create a full featured class and install it"

        <category: '*ChangeSet'>
        | aClass |
        aClass := self new.
        classVarDict environment: aClass.
        instanceClass := aClass.
        Behavior flushCache.
        aClass
            setSuperclass: theSuperclass;
            setName: className;
            setEnvironment: aNamespace;
            setInstanceVariables: arrayOfInstVarNames;
            setInstanceSpec: shape instVars: arrayOfInstVarNames size;
            setClassVariables: classVarDict;
            setSharedPools: sharedPoolNames;
            setCategory: categoryName.
        aNamespace at: className put: aClass.
        theSuperclass isNil ifFalse: [theSuperclass addSubclass: aClass].
        ^ aClass
    ]
]

Eval [
        BlockWrapper
                installOn: AbstractNamespace class
                named: #'primNew:name:'
                with: [ :anObject :anArray :aCompiledMethod |
                        | result signal |
			signal := anArray first includes: anArray second.
                        result := aCompiledMethod valueWithReceiver: anObject withArguments: anArray.
                        signal ifFalse: [ SystemAnnouncer current announce: (NamespaceAddedEvent addedNamespace: result) ].
                        result ].

        BlockWrapper
                installOn: AbstractNamespace
                named: #'removeSubspace:'
                with: [ :anObject :anArray :aCompiledMethod |
                        | result |
                        result := aCompiledMethod valueWithReceiver: anObject withArguments: anArray.
			SystemAnnouncer current announce: (NamespaceRemovedEvent removedNamespace: result).
                        result ].

	BlockWrapper
		installOn: Metaclass 
		named: #'newMeta:environment:subclassOf:instanceVariableArray:shape:classPool:poolDictionaries:category:'
		with: [ :anObject :anArray :aCompiledMethod |
			| result |
			result := aCompiledMethod valueWithReceiver: anObject withArguments: anArray.
			SystemAnnouncer current announce: (ClassAddedEvent addedClass: result).
			result ].

        BlockWrapper
                installOn: Behavior
                selectors: #(#addInstVarName:
                        #instanceVariableNames:
                        #removeInstVarName:)
                with: [ :anObject :anArray :aCompiledMethod |
                        | oldClass result |
                        oldClass := anObject isClass ifTrue: [ anObject copy ].
                        result := aCompiledMethod valueWithReceiver: anObject withArguments: anArray.
                        oldClass isNil ifFalse: [ SystemAnnouncer current announce: (ClassDefinitionChangedEvent oldClass: oldClass class: anObject) ].
                        result ].

        BlockWrapper
                installOn: Class
                selectors: #(#superclass:
			#addClassVarName:
                        #addSharedPool:
                        #comment:
                        #environment:
                        #removeClassVarName:
                        #removeSharedPool:
                        #'registerHandler:forPragma:')
                with: [ :anObject :anArray :aCompiledMethod |
                        | oldClass result |
                        oldClass := anObject isClass ifTrue: [ anObject copy ].
                        result := aCompiledMethod valueWithReceiver: anObject withArguments: anArray.
                        oldClass isNil ifFalse: [ SystemAnnouncer current announce: (ClassDefinitionChangedEvent oldClass: oldClass class: anObject) ].
                        result ].

        BlockWrapper
                installOn: Class 
                named: #'category:'
                with: [ :anObject :anArray :aCompiledMethod |
                        | oldCategory result |
			oldCategory := anObject category.
                        result := aCompiledMethod valueWithReceiver: anObject withArguments: anArray.
			anArray first = result ifFalse: [ SystemAnnouncer current announce: (ClassRecategorizedEvent updatedClass: anObject oldCategory: oldCategory to: anArray first) ].
                        result ].

        BlockWrapper
                installOn: MethodDictionary
                named: #'removeKey:ifAbsent:'
                with: [ :anObject :anArray :aCompiledMethod |
                        | result |
                        result := aCompiledMethod valueWithReceiver: anObject withArguments: anArray.
			SystemAnnouncer current announce: (MethodRemovedEvent method: result).
                        result ].

        BlockWrapper
                installOn: MethodDictionary   
                named: #'at:put:'
                with: [ :anObject :anArray :aCompiledMethod |
                        | result |
                        result := aCompiledMethod valueWithReceiver: anObject withArguments: anArray.
			SystemAnnouncer current announce: (MethodAddedEvent method: result).
                        result ].
]

