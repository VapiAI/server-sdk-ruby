# frozen_string_literal: true

module Vapi
  module Types
    class SipRequestTool < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::SipRequestToolMessagesItem] }, optional: true, nullable: false
      field :verb, -> { Vapi::Types::SipRequestToolVerb }, optional: false, nullable: false
      field :headers, -> { Vapi::Types::JsonSchema }, optional: true, nullable: false
      field :body, -> { Vapi::Types::SipRequestToolBody }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
