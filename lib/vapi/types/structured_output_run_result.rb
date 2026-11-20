# frozen_string_literal: true

module Vapi
  module Types
    class StructuredOutputRunResult < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :result, -> { Vapi::Types::StructuredOutputRunResultResult }, optional: false, nullable: true
      field :compliance_plan, -> { Vapi::Types::ComplianceOverride }, optional: true, nullable: false, api_name: "compliancePlan"
    end
  end
end
