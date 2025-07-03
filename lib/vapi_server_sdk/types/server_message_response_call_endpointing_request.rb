# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class ServerMessageResponseCallEndpointingRequest
  # @return [Float] This is the timeout in seconds to wait before considering the user's speech as
#  finished.
    attr_reader :timeout_seconds
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param timeout_seconds [Float] This is the timeout in seconds to wait before considering the user's speech as
#  finished.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageResponseCallEndpointingRequest]
    def initialize(timeout_seconds:, additional_properties: nil)
      @timeout_seconds = timeout_seconds
      @additional_properties = additional_properties
      @_field_set = { "timeoutSeconds": timeout_seconds }
    end
# Deserialize a JSON object to an instance of
#  ServerMessageResponseCallEndpointingRequest
    #
    # @param json_object [String] 
    # @return [Vapi::ServerMessageResponseCallEndpointingRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      timeout_seconds = parsed_json["timeoutSeconds"]
      new(timeout_seconds: timeout_seconds, additional_properties: struct)
    end
# Serialize an instance of ServerMessageResponseCallEndpointingRequest to a JSON
#  object
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
      obj.timeout_seconds.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
    end
  end
end