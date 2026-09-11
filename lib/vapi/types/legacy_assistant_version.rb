# frozen_string_literal: true

module Vapi
  module Types
    class LegacyAssistantVersion < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :data, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
