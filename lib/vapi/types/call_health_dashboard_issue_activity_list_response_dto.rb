# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardIssueActivityListResponseDto < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::CallHealthDashboardIssueActivityDto] }, optional: false, nullable: false
      field :next_cursor, -> { String }, optional: true, nullable: false, api_name: "nextCursor"
    end
  end
end
