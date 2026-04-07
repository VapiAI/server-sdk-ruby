# frozen_string_literal: true

module Vapi
  module Types
    class UpdateByoPhoneNumberDto < Internal::Types::Model
      field :fallback_destination, -> { Vapi::Types::UpdateByoPhoneNumberDtoFallbackDestination }, optional: true, nullable: false, api_name: "fallbackDestination"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::UpdateByoPhoneNumberDtoHooksItem] }, optional: true, nullable: false
      field :number_e_164_check_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "numberE164CheckEnabled"
      field :name, -> { String }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :number, -> { String }, optional: true, nullable: false
      field :credential_id, -> { String }, optional: true, nullable: false, api_name: "credentialId"
    end
  end
end
