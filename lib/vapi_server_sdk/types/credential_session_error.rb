# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class CredentialSessionError
    # @return [String]
    attr_reader :type
    # @return [String]
    attr_reader :description
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String]
    # @param description [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CredentialSessionError]
    def initialize(type:, description:, additional_properties: nil)
      @type = type
      @description = description
      @additional_properties = additional_properties
      @_field_set = { "type": type, "description": description }
    end

    # Deserialize a JSON object to an instance of CredentialSessionError
    #
    # @param json_object [String]
    # @return [Vapi::CredentialSessionError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      description = parsed_json["description"]
      new(
        type: type,
        description: description,
        additional_properties: struct
      )
    end

    # Serialize an instance of CredentialSessionError to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end
