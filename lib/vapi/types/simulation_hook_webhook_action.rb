# frozen_string_literal: true

module Vapi
  module Types
    class SimulationHookWebhookAction < Internal::Types::Model
      field :type, -> { Vapi::Types::SimulationHookWebhookActionType }, optional: false, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :include, -> { Vapi::Types::SimulationHookInclude }, optional: true, nullable: false
    end
  end
end
