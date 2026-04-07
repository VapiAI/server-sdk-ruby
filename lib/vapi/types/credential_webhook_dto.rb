# frozen_string_literal: true

module Vapi
  module Types
    class CredentialWebhookDto < Internal::Types::Model
      field :type, -> { Vapi::Types::CredentialWebhookDtoType }, optional: false, nullable: false
      field :operation, -> { Vapi::Types::CredentialWebhookDtoOperation }, optional: false, nullable: false
      field :from, -> { String }, optional: false, nullable: false
      field :connection_id, -> { String }, optional: false, nullable: false, api_name: "connectionId"
      field :auth_mode, -> { Vapi::Types::CredentialWebhookDtoAuthMode }, optional: false, nullable: false, api_name: "authMode"
      field :provider_config_key, -> { String }, optional: false, nullable: false, api_name: "providerConfigKey"
      field :provider, -> { String }, optional: false, nullable: false
      field :environment, -> { String }, optional: false, nullable: false
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :end_user, -> { Vapi::Types::CredentialEndUser }, optional: false, nullable: false, api_name: "endUser"
      field :error, -> { Vapi::Types::CredentialSessionError }, optional: true, nullable: false
      field :tags, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
