# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class CredentialEndUser
  # @return [String] 
    attr_reader :end_user_id
  # @return [String] 
    attr_reader :organization_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param end_user_id [String] 
    # @param organization_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CredentialEndUser]
    def initialize(end_user_id:, organization_id:, additional_properties: nil)
      @end_user_id = end_user_id
      @organization_id = organization_id
      @additional_properties = additional_properties
      @_field_set = { "endUserId": end_user_id, "organizationId": organization_id }
    end
# Deserialize a JSON object to an instance of CredentialEndUser
    #
    # @param json_object [String] 
    # @return [Vapi::CredentialEndUser]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      end_user_id = parsed_json["endUserId"]
      organization_id = parsed_json["organizationId"]
      new(
        end_user_id: end_user_id,
        organization_id: organization_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CredentialEndUser to a JSON object
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
      obj.end_user_id.is_a?(String) != false || raise("Passed value for field obj.end_user_id is not the expected type, validation failed.")
      obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
    end
  end
end