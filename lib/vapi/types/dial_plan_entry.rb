# frozen_string_literal: true

module Vapi
  module Types
    class DialPlanEntry < Internal::Types::Model
      field :phone_number_id, -> { String }, optional: false, nullable: false, api_name: "phoneNumberId"
      field :customers, -> { Internal::Types::Array[Vapi::Types::CreateCustomerDto] }, optional: false, nullable: false
    end
  end
end
