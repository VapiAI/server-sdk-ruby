# frozen_string_literal: true

module Vapi
  module Types
    class TrafficTabLatencyStatsDto < Internal::Types::Model
      field :mean, -> { Integer }, optional: true, nullable: false
      field :p_50, -> { Integer }, optional: true, nullable: false, api_name: "p50"
      field :p_95, -> { Integer }, optional: true, nullable: false, api_name: "p95"
    end
  end
end
