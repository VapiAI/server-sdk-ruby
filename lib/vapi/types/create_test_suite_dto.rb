# frozen_string_literal: true

module Vapi
  module Types
    class CreateTestSuiteDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :phone_number_id, -> { String }, optional: true, nullable: false, api_name: "phoneNumberId"
      field :tester_plan, -> { Vapi::Types::TesterPlan }, optional: true, nullable: false, api_name: "testerPlan"
      field :target_plan, -> { Vapi::Types::TargetPlan }, optional: true, nullable: false, api_name: "targetPlan"
    end
  end
end
