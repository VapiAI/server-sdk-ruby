# frozen_string_literal: true

module Vapi
  module Types
    class SimulationOnboardingErrorDto < Internal::Types::Model
      field :code, -> { Vapi::Types::SimulationOnboardingErrorDtoCode }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
      field :retry_after_seconds, -> { Integer }, optional: true, nullable: false, api_name: "retryAfterSeconds"
      field :limit, -> { Integer }, optional: true, nullable: false
    end
  end
end
