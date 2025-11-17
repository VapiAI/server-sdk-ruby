# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ComplianceOverride
    # @return [Boolean] Force storage for this output under HIPAA. Only enable if output contains no
    #  sensitive data.
    attr_reader :force_store_on_hipaa_enabled
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param force_store_on_hipaa_enabled [Boolean] Force storage for this output under HIPAA. Only enable if output contains no
    #  sensitive data.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ComplianceOverride]
    def initialize(force_store_on_hipaa_enabled: OMIT, additional_properties: nil)
      @force_store_on_hipaa_enabled = force_store_on_hipaa_enabled if force_store_on_hipaa_enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = { "forceStoreOnHipaaEnabled": force_store_on_hipaa_enabled }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ComplianceOverride
    #
    # @param json_object [String]
    # @return [Vapi::ComplianceOverride]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      force_store_on_hipaa_enabled = parsed_json["forceStoreOnHipaaEnabled"]
      new(force_store_on_hipaa_enabled: force_store_on_hipaa_enabled, additional_properties: struct)
    end

    # Serialize an instance of ComplianceOverride to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.force_store_on_hipaa_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.force_store_on_hipaa_enabled is not the expected type, validation failed.")
    end
  end
end
