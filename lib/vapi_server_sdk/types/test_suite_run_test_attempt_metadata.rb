# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class TestSuiteRunTestAttemptMetadata
  # @return [String] This is the session ID for the test attempt.
    attr_reader :session_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param session_id [String] This is the session ID for the test attempt.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TestSuiteRunTestAttemptMetadata]
    def initialize(session_id:, additional_properties: nil)
      @session_id = session_id
      @additional_properties = additional_properties
      @_field_set = { "sessionId": session_id }
    end
# Deserialize a JSON object to an instance of TestSuiteRunTestAttemptMetadata
    #
    # @param json_object [String] 
    # @return [Vapi::TestSuiteRunTestAttemptMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      session_id = parsed_json["sessionId"]
      new(session_id: session_id, additional_properties: struct)
    end
# Serialize an instance of TestSuiteRunTestAttemptMetadata to a JSON object
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
      obj.session_id.is_a?(String) != false || raise("Passed value for field obj.session_id is not the expected type, validation failed.")
    end
  end
end