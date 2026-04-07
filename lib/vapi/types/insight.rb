# frozen_string_literal: true

module Vapi
  module Types
    class Insight < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :type, -> { Vapi::Types::InsightType }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
