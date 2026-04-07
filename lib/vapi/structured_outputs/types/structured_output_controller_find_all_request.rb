# frozen_string_literal: true

module Vapi
  module StructuredOutputs
    module Types
      class StructuredOutputControllerFindAllRequest < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :page, -> { Integer }, optional: true, nullable: false
        field :sort_order, -> { Vapi::StructuredOutputs::Types::StructuredOutputControllerFindAllRequestSortOrder }, optional: true, nullable: false, api_name: "sortOrder"
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
