# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunPaymentRequiredResponse < Internal::Types::Model
      field :status_code, -> { Integer }, optional: false, nullable: false, api_name: "statusCode"
      field :message, -> { String }, optional: false, nullable: false
      field :reason, -> { Vapi::Types::SimulationRunPaymentRequiredResponseReason }, optional: false, nullable: false
    end
  end
end
