# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class CompliancePlan
  # @return [Boolean] When this is enabled, no logs, recordings, or transcriptions will be stored.
#  At the end of the call, you will still receive an end-of-call-report message to
#  store on your server. Defaults to false.
    attr_reader :hipaa_enabled
  # @return [Boolean] When this is enabled, the user will be restricted to use PCI-compliant
#  providers, and no logs or transcripts are stored.
#  At the end of the call, you will receive an end-of-call-report message to store
#  on your server. Defaults to false.
    attr_reader :pci_enabled
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param hipaa_enabled [Boolean] When this is enabled, no logs, recordings, or transcriptions will be stored.
#  At the end of the call, you will still receive an end-of-call-report message to
#  store on your server. Defaults to false.
    # @param pci_enabled [Boolean] When this is enabled, the user will be restricted to use PCI-compliant
#  providers, and no logs or transcripts are stored.
#  At the end of the call, you will receive an end-of-call-report message to store
#  on your server. Defaults to false.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CompliancePlan]
    def initialize(hipaa_enabled: OMIT, pci_enabled: OMIT, additional_properties: nil)
      @hipaa_enabled = hipaa_enabled if hipaa_enabled != OMIT
      @pci_enabled = pci_enabled if pci_enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = { "hipaaEnabled": hipaa_enabled, "pciEnabled": pci_enabled }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CompliancePlan
    #
    # @param json_object [String] 
    # @return [Vapi::CompliancePlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      hipaa_enabled = parsed_json["hipaaEnabled"]
      pci_enabled = parsed_json["pciEnabled"]
      new(
        hipaa_enabled: hipaa_enabled,
        pci_enabled: pci_enabled,
        additional_properties: struct
      )
    end
# Serialize an instance of CompliancePlan to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.hipaa_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.hipaa_enabled is not the expected type, validation failed.")
      obj.pci_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.pci_enabled is not the expected type, validation failed.")
    end
  end
end