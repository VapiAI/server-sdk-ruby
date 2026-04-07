# frozen_string_literal: true

module Vapi
  module Types
    class GetSessionPaginatedDto < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant_id_any, -> { String }, optional: true, nullable: false, api_name: "assistantIdAny"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :customer_number_any, -> { String }, optional: true, nullable: false, api_name: "customerNumberAny"
      field :phone_number_id, -> { String }, optional: true, nullable: false, api_name: "phoneNumberId"
      field :phone_number_id_any, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "phoneNumberIdAny"
      field :page, -> { Integer }, optional: true, nullable: false
      field :sort_order, -> { Vapi::Types::GetSessionPaginatedDtoSortOrder }, optional: true, nullable: false, api_name: "sortOrder"
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
