# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardAssistantListResponseDto < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::CallHealthDashboardAssistantOverviewDto] }, optional: false, nullable: false
      field :next_cursor, -> { String }, optional: true, nullable: false, api_name: "nextCursor"
      field :coverage, -> { Vapi::Types::CallHealthDashboardCoverageDto }, optional: false, nullable: false
    end
  end
end
