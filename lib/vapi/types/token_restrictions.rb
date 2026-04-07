# frozen_string_literal: true

module Vapi
  module Types
    class TokenRestrictions < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :allowed_origins, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "allowedOrigins"
      field :allowed_assistant_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "allowedAssistantIds"
      field :allow_transient_assistant, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "allowTransientAssistant"
    end
  end
end
