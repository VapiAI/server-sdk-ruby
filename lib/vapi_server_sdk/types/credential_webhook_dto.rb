# frozen_string_literal: true
require_relative "credential_webhook_dto_type"
require_relative "credential_webhook_dto_operation"
require_relative "credential_webhook_dto_auth_mode"
require_relative "credential_end_user"
require_relative "credential_session_error"
require "ostruct"
require "json"

module Vapi
  class CredentialWebhookDto
  # @return [Vapi::CredentialWebhookDtoType] 
    attr_reader :type
  # @return [Vapi::CredentialWebhookDtoOperation] 
    attr_reader :operation
  # @return [String] 
    attr_reader :from
  # @return [String] 
    attr_reader :connection_id
  # @return [Vapi::CredentialWebhookDtoAuthMode] 
    attr_reader :auth_mode
  # @return [String] 
    attr_reader :provider_config_key
  # @return [String] 
    attr_reader :provider
  # @return [String] 
    attr_reader :environment
  # @return [Boolean] 
    attr_reader :success
  # @return [Vapi::CredentialEndUser] 
    attr_reader :end_user
  # @return [Vapi::CredentialSessionError] 
    attr_reader :error
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::CredentialWebhookDtoType] 
    # @param operation [Vapi::CredentialWebhookDtoOperation] 
    # @param from [String] 
    # @param connection_id [String] 
    # @param auth_mode [Vapi::CredentialWebhookDtoAuthMode] 
    # @param provider_config_key [String] 
    # @param provider [String] 
    # @param environment [String] 
    # @param success [Boolean] 
    # @param end_user [Vapi::CredentialEndUser] 
    # @param error [Vapi::CredentialSessionError] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CredentialWebhookDto]
    def initialize(type:, operation:, from:, connection_id:, auth_mode:, provider_config_key:, provider:, environment:, success:, end_user:, error: OMIT, additional_properties: nil)
      @type = type
      @operation = operation
      @from = from
      @connection_id = connection_id
      @auth_mode = auth_mode
      @provider_config_key = provider_config_key
      @provider = provider
      @environment = environment
      @success = success
      @end_user = end_user
      @error = error if error != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "operation": operation, "from": from, "connectionId": connection_id, "authMode": auth_mode, "providerConfigKey": provider_config_key, "provider": provider, "environment": environment, "success": success, "endUser": end_user, "error": error }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CredentialWebhookDto
    #
    # @param json_object [String] 
    # @return [Vapi::CredentialWebhookDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      operation = parsed_json["operation"]
      from = parsed_json["from"]
      connection_id = parsed_json["connectionId"]
      auth_mode = parsed_json["authMode"]
      provider_config_key = parsed_json["providerConfigKey"]
      provider = parsed_json["provider"]
      environment = parsed_json["environment"]
      success = parsed_json["success"]
      unless parsed_json["endUser"].nil?
        end_user = parsed_json["endUser"].to_json
        end_user = Vapi::CredentialEndUser.from_json(json_object: end_user)
      else
        end_user = nil
      end
      unless parsed_json["error"].nil?
        error = parsed_json["error"].to_json
        error = Vapi::CredentialSessionError.from_json(json_object: error)
      else
        error = nil
      end
      new(
        type: type,
        operation: operation,
        from: from,
        connection_id: connection_id,
        auth_mode: auth_mode,
        provider_config_key: provider_config_key,
        provider: provider,
        environment: environment,
        success: success,
        end_user: end_user,
        error: error,
        additional_properties: struct
      )
    end
# Serialize an instance of CredentialWebhookDto to a JSON object
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
      obj.type.is_a?(Vapi::CredentialWebhookDtoType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.operation.is_a?(Vapi::CredentialWebhookDtoOperation) != false || raise("Passed value for field obj.operation is not the expected type, validation failed.")
      obj.from.is_a?(String) != false || raise("Passed value for field obj.from is not the expected type, validation failed.")
      obj.connection_id.is_a?(String) != false || raise("Passed value for field obj.connection_id is not the expected type, validation failed.")
      obj.auth_mode.is_a?(Vapi::CredentialWebhookDtoAuthMode) != false || raise("Passed value for field obj.auth_mode is not the expected type, validation failed.")
      obj.provider_config_key.is_a?(String) != false || raise("Passed value for field obj.provider_config_key is not the expected type, validation failed.")
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.environment.is_a?(String) != false || raise("Passed value for field obj.environment is not the expected type, validation failed.")
      obj.success.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
      Vapi::CredentialEndUser.validate_raw(obj: obj.end_user)
      obj.error.nil? || Vapi::CredentialSessionError.validate_raw(obj: obj.error)
    end
  end
end