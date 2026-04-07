# frozen_string_literal: true

module Vapi
  module Types
    class DtmfTool < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::DtmfToolMessagesItem] }, optional: true, nullable: false
      field :sip_info_dtmf_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "sipInfoDtmfEnabled"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
