# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunTransportConfiguration < Internal::Types::Model
      field :provider, -> { Vapi::Types::SimulationRunTransportConfigurationProvider }, optional: false, nullable: false
    end
  end
end
