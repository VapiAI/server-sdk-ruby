# frozen_string_literal: true

module Vapi
  module Types
    class ProviderResource < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :provider, -> { Vapi::Types::ProviderResourceProvider }, optional: false, nullable: false
      field :resource_name, -> { Vapi::Types::ProviderResourceResourceName }, optional: false, nullable: false, api_name: "resourceName"
      field :resource_id, -> { String }, optional: false, nullable: false, api_name: "resourceId"
      field :resource, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
