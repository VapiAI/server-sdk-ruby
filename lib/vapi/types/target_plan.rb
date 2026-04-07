# frozen_string_literal: true

module Vapi
  module Types
    class TargetPlan < Internal::Types::Model
      field :phone_number_id, -> { String }, optional: true, nullable: false, api_name: "phoneNumberId"
      field :phone_number, -> { Vapi::Types::TestSuitePhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
    end
  end
end
