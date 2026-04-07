# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunItemMetadata < Internal::Types::Model
      field :assistant, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :squad, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :scenario, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :personality, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :simulation, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :call, -> { Vapi::Types::SimulationRunItemCallMetadata }, optional: true, nullable: false
      field :hooks, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
