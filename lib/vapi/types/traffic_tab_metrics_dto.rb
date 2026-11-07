# frozen_string_literal: true

module Vapi
  module Types
    class TrafficTabMetricsDto < Internal::Types::Model
      field :window, -> { Vapi::Types::TrafficTabMetricsWindowDto }, optional: false, nullable: false
      field :total_calls, -> { Integer }, optional: false, nullable: false, api_name: "totalCalls"
      field :current_allocation, -> { Vapi::Types::TrafficAllocation }, optional: true, nullable: false, api_name: "currentAllocation"
      field :versions, -> { Internal::Types::Array[Vapi::Types::TrafficTabVersionMetricsDto] }, optional: false, nullable: false
    end
  end
end
