# frozen_string_literal: true

require_relative "credential_session_dto_provider"
require "ostruct"
require "json"

module Vapi
  class CredentialSessionDto
    # @return [Vapi::CredentialSessionDtoProvider] The type of credential to generate a session for. Only Nango user-facing
    #  providers are supported.
    attr_reader :provider
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [Vapi::CredentialSessionDtoProvider] The type of credential to generate a session for. Only Nango user-facing
    #  providers are supported.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CredentialSessionDto]
    def initialize(provider:, additional_properties: nil)
      @provider = provider
      @additional_properties = additional_properties
      @_field_set = { "provider": provider }
    end

    # Deserialize a JSON object to an instance of CredentialSessionDto
    #
    # @param json_object [String]
    # @return [Vapi::CredentialSessionDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      new(provider: provider, additional_properties: struct)
    end

    # Serialize an instance of CredentialSessionDto to a JSON object
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
      obj.provider.is_a?(Vapi::CredentialSessionDtoProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
    end
  end
end
