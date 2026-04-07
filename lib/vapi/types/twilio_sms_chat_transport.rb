# frozen_string_literal: true

module Vapi
  module Types
    class TwilioSmsChatTransport < Internal::Types::Model
      field :conversation_type, -> { Vapi::Types::TwilioSmsChatTransportConversationType }, optional: true, nullable: false, api_name: "conversationType"
      field :phone_number_id, -> { String }, optional: true, nullable: false, api_name: "phoneNumberId"
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"
      field :use_llm_generated_message_for_outbound, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "useLLMGeneratedMessageForOutbound"
      field :type, -> { Vapi::Types::TwilioSmsChatTransportType }, optional: false, nullable: false
    end
  end
end
