# frozen_string_literal: true

module Vapi
  module Types
    class InsightRunResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :insight_id, -> { String }, optional: false, nullable: false, api_name: "insightId"
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
