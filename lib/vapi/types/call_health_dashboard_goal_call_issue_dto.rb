# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardGoalCallIssueDto < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :category_key, -> { String }, optional: false, nullable: false, api_name: "categoryKey"
    end
  end
end
