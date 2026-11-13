# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardIssueActivityDto < Internal::Types::Model
      field :row_version, -> { Integer }, optional: false, nullable: false, api_name: "rowVersion"
      field :action, -> { Vapi::Types::CallHealthDashboardIssueActivityDtoAction }, optional: false, nullable: false
      field :actor_user_id, -> { String }, optional: true, nullable: false, api_name: "actorUserId"
      field :comment, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
