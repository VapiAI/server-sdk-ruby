# frozen_string_literal: true

module Vapi
  module Types
    class TrafficTabLatencyMsDto < Internal::Types::Model
      field :model, -> { Vapi::Types::TrafficTabLatencyStatsDto }, optional: false, nullable: false
      field :voice, -> { Vapi::Types::TrafficTabLatencyStatsDto }, optional: false, nullable: false
      field :transcriber, -> { Vapi::Types::TrafficTabLatencyStatsDto }, optional: false, nullable: false
      field :turn, -> { Vapi::Types::TrafficTabLatencyStatsDto }, optional: false, nullable: false
    end
  end
end
