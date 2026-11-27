# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardSweepCoverageDto < Internal::Types::Model
      field :state, -> { Vapi::Types::CallHealthDashboardSweepCoverageDtoState }, optional: false, nullable: false
    end
  end
end
