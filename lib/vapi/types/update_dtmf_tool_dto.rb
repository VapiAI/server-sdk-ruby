# frozen_string_literal: true

module Vapi
  module Types
    class UpdateDtmfToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateDtmfToolDtoMessagesItem] }, optional: true, nullable: false
      field :sip_info_dtmf_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "sipInfoDtmfEnabled"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
