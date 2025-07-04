# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class TokenRestrictions
    # @return [Boolean] This determines whether the token is enabled or disabled. Default is true, it's
    #  enabled.
    attr_reader :enabled
    # @return [Array<String>] This determines the allowed origins for this token. Validates the `Origin`
    #  header. Default is any origin.
    #  Only relevant for `public` tokens.
    attr_reader :allowed_origins
    # @return [Array<String>] This determines which assistantIds can be used when creating a call. Default is
    #  any assistantId.
    #  Only relevant for `public` tokens.
    attr_reader :allowed_assistant_ids
    # @return [Boolean] This determines whether transient assistants can be used when creating a call.
    #  Default is true.
    #  If `allowedAssistantIds` is provided, this is automatically false.
    #  Only relevant for `public` tokens.
    attr_reader :allow_transient_assistant
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param enabled [Boolean] This determines whether the token is enabled or disabled. Default is true, it's
    #  enabled.
    # @param allowed_origins [Array<String>] This determines the allowed origins for this token. Validates the `Origin`
    #  header. Default is any origin.
    #  Only relevant for `public` tokens.
    # @param allowed_assistant_ids [Array<String>] This determines which assistantIds can be used when creating a call. Default is
    #  any assistantId.
    #  Only relevant for `public` tokens.
    # @param allow_transient_assistant [Boolean] This determines whether transient assistants can be used when creating a call.
    #  Default is true.
    #  If `allowedAssistantIds` is provided, this is automatically false.
    #  Only relevant for `public` tokens.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TokenRestrictions]
    def initialize(enabled: OMIT, allowed_origins: OMIT, allowed_assistant_ids: OMIT, allow_transient_assistant: OMIT,
                   additional_properties: nil)
      @enabled = enabled if enabled != OMIT
      @allowed_origins = allowed_origins if allowed_origins != OMIT
      @allowed_assistant_ids = allowed_assistant_ids if allowed_assistant_ids != OMIT
      @allow_transient_assistant = allow_transient_assistant if allow_transient_assistant != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "enabled": enabled,
        "allowedOrigins": allowed_origins,
        "allowedAssistantIds": allowed_assistant_ids,
        "allowTransientAssistant": allow_transient_assistant
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TokenRestrictions
    #
    # @param json_object [String]
    # @return [Vapi::TokenRestrictions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      enabled = parsed_json["enabled"]
      allowed_origins = parsed_json["allowedOrigins"]
      allowed_assistant_ids = parsed_json["allowedAssistantIds"]
      allow_transient_assistant = parsed_json["allowTransientAssistant"]
      new(
        enabled: enabled,
        allowed_origins: allowed_origins,
        allowed_assistant_ids: allowed_assistant_ids,
        allow_transient_assistant: allow_transient_assistant,
        additional_properties: struct
      )
    end

    # Serialize an instance of TokenRestrictions to a JSON object
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
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.allowed_origins&.is_a?(Array) != false || raise("Passed value for field obj.allowed_origins is not the expected type, validation failed.")
      obj.allowed_assistant_ids&.is_a?(Array) != false || raise("Passed value for field obj.allowed_assistant_ids is not the expected type, validation failed.")
      obj.allow_transient_assistant&.is_a?(Boolean) != false || raise("Passed value for field obj.allow_transient_assistant is not the expected type, validation failed.")
    end
  end
end
