# frozen_string_literal: true

module Vapi
  module Types
    class Eval < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::EvalMessagesItem] }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :type, -> { Vapi::Types::EvalType }, optional: false, nullable: false
    end
  end
end
