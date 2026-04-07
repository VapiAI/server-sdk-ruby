# frozen_string_literal: true

module Vapi
  module Types
    class SimulationHookCallStarted < Internal::Types::Model
      field :do_, -> { Internal::Types::Array[Vapi::Types::SimulationHookWebhookAction] }, optional: false, nullable: false, api_name: "do"
    end
  end
end
