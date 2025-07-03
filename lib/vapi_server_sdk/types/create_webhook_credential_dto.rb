# frozen_string_literal: true
require_relative "create_webhook_credential_dto_authentication_plan"
require "ostruct"
require "json"

module Vapi
  class CreateWebhookCredentialDto
  # @return [Vapi::CreateWebhookCredentialDtoAuthenticationPlan] This is the authentication plan. Supports OAuth2 RFC 6749 and HMAC signing.
    attr_reader :authentication_plan
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param authentication_plan [Vapi::CreateWebhookCredentialDtoAuthenticationPlan] This is the authentication plan. Supports OAuth2 RFC 6749 and HMAC signing.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateWebhookCredentialDto]
    def initialize(authentication_plan:, name: OMIT, additional_properties: nil)
      @authentication_plan = authentication_plan
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "authenticationPlan": authentication_plan, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateWebhookCredentialDto
    #
    # @param json_object [String] 
    # @return [Vapi::CreateWebhookCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["authenticationPlan"].nil?
        authentication_plan = parsed_json["authenticationPlan"].to_json
        authentication_plan = Vapi::CreateWebhookCredentialDtoAuthenticationPlan.from_json(json_object: authentication_plan)
      else
        authentication_plan = nil
      end
      name = parsed_json["name"]
      new(
        authentication_plan: authentication_plan,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateWebhookCredentialDto to a JSON object
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
      Vapi::CreateWebhookCredentialDtoAuthenticationPlan.validate_raw(obj: obj.authentication_plan)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end