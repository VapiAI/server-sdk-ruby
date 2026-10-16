# frozen_string_literal: true

module Vapi
  module Types
    class OpenAiReasonerSkillToolsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::CreateFunctionToolDto }, key: "FUNCTION"
      member -> { Vapi::Types::CreateApiRequestToolDto }, key: "API_REQUEST"
      member -> { Vapi::Types::CreateMcpToolDto }, key: "MCP"
      member -> { Vapi::Types::CreateEndCallToolDto }, key: "END_CALL"
      member -> { Vapi::Types::CreateDtmfToolDto }, key: "DTMF"
      member -> { Vapi::Types::CreateTransferCallToolDto }, key: "TRANSFER_CALL"
    end
  end
end
