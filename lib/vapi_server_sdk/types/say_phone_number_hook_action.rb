# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class SayPhoneNumberHookAction
    # @return [String] This is the message to say
    attr_reader :exact
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param exact [String] This is the message to say
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SayPhoneNumberHookAction]
    def initialize(exact:, additional_properties: nil)
      @exact = exact
      @additional_properties = additional_properties
      @_field_set = { "exact": exact }
    end

    # Deserialize a JSON object to an instance of SayPhoneNumberHookAction
    #
    # @param json_object [String]
    # @return [Vapi::SayPhoneNumberHookAction]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      exact = parsed_json["exact"]
      new(exact: exact, additional_properties: struct)
    end

    # Serialize an instance of SayPhoneNumberHookAction to a JSON object
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
      obj.exact.is_a?(String) != false || raise("Passed value for field obj.exact is not the expected type, validation failed.")
    end
  end
end
