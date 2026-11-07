# frozen_string_literal: true

module Vapi
  module GuardrailPacks
    module Types
      class GuardrailPacksControllerPaginatedRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false
        field :search, -> { String }, optional: true, nullable: false
        field :sort_by, -> { Vapi::GuardrailPacks::Types::GuardrailPacksControllerPaginatedRequestSortBy }, optional: true, nullable: false, api_name: "sortBy"
        field :created_at_gt, -> { String }, optional: true, nullable: false, api_name: "createdAtGt"
        field :created_at_lt, -> { String }, optional: true, nullable: false, api_name: "createdAtLt"
        field :created_at_ge, -> { String }, optional: true, nullable: false, api_name: "createdAtGe"
        field :created_at_le, -> { String }, optional: true, nullable: false, api_name: "createdAtLe"
        field :updated_at_gt, -> { String }, optional: true, nullable: false, api_name: "updatedAtGt"
        field :updated_at_lt, -> { String }, optional: true, nullable: false, api_name: "updatedAtLt"
        field :updated_at_ge, -> { String }, optional: true, nullable: false, api_name: "updatedAtGe"
        field :updated_at_le, -> { String }, optional: true, nullable: false, api_name: "updatedAtLe"
        field :page, -> { Integer }, optional: true, nullable: false
        field :sort_order, -> { Vapi::GuardrailPacks::Types::GuardrailPacksControllerPaginatedRequestSortOrder }, optional: true, nullable: false, api_name: "sortOrder"
      end
    end
  end
end
