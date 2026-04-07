# frozen_string_literal: true

module Vapi
  module ProviderResources
    module Types
      class ProviderResourceControllerGetProviderResourcesPaginatedRequest < Internal::Types::Model
        field :provider, -> { Vapi::ProviderResources::Types::ProviderResourceControllerGetProviderResourcesPaginatedRequestProvider }, optional: false, nullable: false
        field :resource_name, -> { Vapi::ProviderResources::Types::ProviderResourceControllerGetProviderResourcesPaginatedRequestResourceName }, optional: false, nullable: false, api_name: "resourceName"
        field :id, -> { String }, optional: true, nullable: false
        field :resource_id, -> { String }, optional: true, nullable: false, api_name: "resourceId"
        field :page, -> { Integer }, optional: true, nullable: false
        field :sort_order, -> { Vapi::ProviderResources::Types::ProviderResourceControllerGetProviderResourcesPaginatedRequestSortOrder }, optional: true, nullable: false, api_name: "sortOrder"
        field :limit, -> { Integer }, optional: true, nullable: false
        field :created_at_gt, -> { String }, optional: true, nullable: false, api_name: "createdAtGt"
        field :created_at_lt, -> { String }, optional: true, nullable: false, api_name: "createdAtLt"
        field :created_at_ge, -> { String }, optional: true, nullable: false, api_name: "createdAtGe"
        field :created_at_le, -> { String }, optional: true, nullable: false, api_name: "createdAtLe"
        field :updated_at_gt, -> { String }, optional: true, nullable: false, api_name: "updatedAtGt"
        field :updated_at_lt, -> { String }, optional: true, nullable: false, api_name: "updatedAtLt"
        field :updated_at_ge, -> { String }, optional: true, nullable: false, api_name: "updatedAtGe"
        field :updated_at_le, -> { String }, optional: true, nullable: false, api_name: "updatedAtLe"
      end
    end
  end
end
