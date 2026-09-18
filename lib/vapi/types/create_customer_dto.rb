# frozen_string_literal: true

module Vapi
  module Types
    # Customer details used for call delivery and assistant personalization, including phone or SIP destination, contact
    # identifiers, extension, and assistant overrides.
    class CreateCustomerDto < Internal::Types::Model
      field :number_e_164_check_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "numberE164CheckEnabled"
      field :extension, -> { String }, optional: true, nullable: false
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :squad_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "squadOverrides"
      field :number, -> { String }, optional: true, nullable: false
      field :sip_uri, -> { String }, optional: true, nullable: false, api_name: "sipUri"
      field :name, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"
    end
  end
end
