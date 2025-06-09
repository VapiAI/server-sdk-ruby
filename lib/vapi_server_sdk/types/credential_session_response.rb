# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class CredentialSessionResponse
  # @return [String] 
    attr_reader :session_token
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param session_token [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CredentialSessionResponse]
    def initialize(session_token:, additional_properties: nil)
      @session_token = session_token
      @additional_properties = additional_properties
      @_field_set = { "sessionToken": session_token }
    end
# Deserialize a JSON object to an instance of CredentialSessionResponse
    #
    # @param json_object [String] 
    # @return [Vapi::CredentialSessionResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      session_token = parsed_json["sessionToken"]
      new(session_token: session_token, additional_properties: struct)
    end
# Serialize an instance of CredentialSessionResponse to a JSON object
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
      obj.session_token.is_a?(String) != false || raise("Passed value for field obj.session_token is not the expected type, validation failed.")
    end
  end
end