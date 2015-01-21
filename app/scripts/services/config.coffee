'use strict'

###*
 # @ngdoc service
 # @name seaspongeApp.config
 # @description
 # # configurationu
 # Factory in the seaspongeApp.
###
angular.module('seaspongeApp')
    .factory('config', [ ->


        config = {

            setConfiguration: (serialized) ->
                @dataClassificationOptions = serialized.dataClassificationOptions
                @securityControlOptions = serialized.securityControlOptions
                @severityOptions = serialized.severityOptions
                return @
            
            codeTypeOptions: [
                "Not selected"
                "Managed"
                "Unmanaged"
            ]
            runningAsOptions: [
                "Kernel"
                "System"
                "Network Service"
                "Local Service"
                "Administrator"
                "Standard User with Elevation"
                "Standard User without Elevation"
                "Windows Store App"
            ]
            acceptsInputOptions: [
                "Not Selected"
                "Any Remote User or Entity"
                "Kernel, System, or Local Admin"
                "Local or Network Service"
                "Local Standard User With Elevation"
                "Local Standard User Without Elevation"
                "Windows Store Apps or App Container Processes"
                "Nothing"
                "Other"
            ]
            dataClassificationOptions: [
                "public"
                "internal"
                "restricted"
                "secret"
            ]
            securityControlOptions: [
                "confidentiality"
                "integrity"
                "availability"
            ]
            severityOptions: [
                "Low"
                "Medium"
                "High"
            ]
        }

        return config # Return Model instance
    ])
