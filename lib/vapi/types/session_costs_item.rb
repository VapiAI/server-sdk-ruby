# frozen_string_literal: true

module Vapi
  module Types
    class SessionCostsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::ModelCost }, key: "MODEL"
      member -> { Vapi::Types::AnalysisCost }, key: "ANALYSIS"
      member -> { Vapi::Types::SessionCost }, key: "SESSION"
    end
  end
end
