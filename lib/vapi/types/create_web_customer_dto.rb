# frozen_string_literal: true

module Vapi
  module Types
    class CreateWebCustomerDto < Internal::Types::Model
      field :number_e_164_check_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "numberE164CheckEnabled"
      field :extension, -> { String }, optional: true, nullable: false
      field :assistant_overrides, -> { Vapi::Types::ChatAssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :number, -> { String }, optional: true, nullable: false
      field :sip_uri, -> { String }, optional: true, nullable: false, api_name: "sipUri"
      field :name, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"
    end
  end
end
