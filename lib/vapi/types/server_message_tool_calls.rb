# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageToolCalls < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ServerMessageToolCallsPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ServerMessageToolCallsType }, optional: true, nullable: false
      field :tool_with_tool_call_list, -> { Internal::Types::Array[Vapi::Types::ServerMessageToolCallsToolWithToolCallListItem] }, optional: false, nullable: false, api_name: "toolWithToolCallList"
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :artifact, -> { Vapi::Types::Artifact }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :chat, -> { Vapi::Types::Chat }, optional: true, nullable: false
      field :tool_call_list, -> { Internal::Types::Array[Vapi::Types::ToolCall] }, optional: false, nullable: false, api_name: "toolCallList"
    end
  end
end
