# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunItemCallMonitor < Internal::Types::Model
      field :listen_url, -> { String }, optional: true, nullable: false, api_name: "listenUrl"
    end
  end
end
