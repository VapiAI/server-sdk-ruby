# frozen_string_literal: true

module Vapi
  module Types
    class Personality < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: true, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: false, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: false, nullable: false
      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
