# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardIntakeCoverageDto < Internal::Types::Model
      field :delivery_mode, -> { Vapi::Types::CallHealthDashboardIntakeCoverageDtoDeliveryMode }, optional: false, nullable: false, api_name: "deliveryMode"
      field :end_to_end_coverage, -> { Vapi::Types::CallHealthDashboardIntakeCoverageDtoEndToEndCoverage }, optional: false, nullable: false, api_name: "endToEndCoverage"
    end
  end
end
