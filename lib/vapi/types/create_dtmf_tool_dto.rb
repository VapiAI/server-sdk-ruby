# frozen_string_literal: true

module Vapi
  module Types
    # Configuration used to create a tool that lets an assistant send DTMF keypad tones during a call.
    class CreateDtmfToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateDtmfToolDtoMessagesItem] }, optional: true, nullable: false
      field :sip_info_dtmf_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "sipInfoDtmfEnabled"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
