# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardDiscoveryCoverageDto < Internal::Types::Model
      field :pending_issue_category_count, -> { Integer }, optional: false, nullable: false, api_name: "pendingIssueCategoryCount"
      field :blocked_issue_category_count, -> { Integer }, optional: false, nullable: false, api_name: "blockedIssueCategoryCount"
    end
  end
end
