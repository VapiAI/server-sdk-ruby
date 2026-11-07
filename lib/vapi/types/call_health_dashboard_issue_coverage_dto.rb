# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardIssueCoverageDto < Internal::Types::Model
      field :state, -> { Vapi::Types::CallHealthDashboardIssueCoverageDtoState }, optional: false, nullable: false
      field :as_of, -> { String }, optional: false, nullable: false, api_name: "asOf"
    end
  end
end
