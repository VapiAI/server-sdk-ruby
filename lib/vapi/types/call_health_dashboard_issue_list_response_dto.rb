# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardIssueListResponseDto < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::CallHealthDashboardIssueSummaryDto] }, optional: false, nullable: false
      field :series_page, -> { Vapi::Types::CallHealthDashboardSeriesPageDto }, optional: false, nullable: false, api_name: "seriesPage"
      field :facets, -> { Vapi::Types::CallHealthDashboardFacetsDto }, optional: false, nullable: false
      field :next_cursor, -> { String }, optional: true, nullable: false, api_name: "nextCursor"
      field :coverage, -> { Vapi::Types::CallHealthDashboardCoverageDto }, optional: false, nullable: false
    end
  end
end
