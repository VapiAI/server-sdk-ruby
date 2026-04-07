# frozen_string_literal: true

module Vapi
  module Types
    class Token < Internal::Types::Model
      field :tag, -> { Vapi::Types::TokenTag }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :value, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :restrictions, -> { Vapi::Types::TokenRestrictions }, optional: true, nullable: false
    end
  end
end
