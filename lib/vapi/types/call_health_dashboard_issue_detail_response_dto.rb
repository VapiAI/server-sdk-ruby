# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardIssueDetailResponseDto < Internal::Types::Model
      field :issue, -> { Vapi::Types::CallHealthDashboardIssueSummaryDto }, optional: false, nullable: false
      field :series_page, -> { Vapi::Types::CallHealthDashboardSeriesPageDto }, optional: false, nullable: false, api_name: "seriesPage"
      field :definition, -> { Vapi::Types::CallHealthDashboardIssueDefinitionDto }, optional: false, nullable: false
      field :coverage, -> { Vapi::Types::CallHealthDashboardCoverageDto }, optional: false, nullable: false
    end
  end
end
