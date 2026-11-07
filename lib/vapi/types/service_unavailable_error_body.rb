# frozen_string_literal: true

module Vapi
  module Types
    class ServiceUnavailableErrorBody < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::SimulationOnboardingErrorDto }
      member -> { Vapi::Types::ServiceUnavailableErrorBodyError }
    end
  end
end
