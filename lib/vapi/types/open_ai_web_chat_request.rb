# frozen_string_literal: true

module Vapi
  module Types
    class OpenAiWebChatRequest < Internal::Types::Model
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :session_id, -> { String }, optional: true, nullable: false, api_name: "sessionId"
      field :session_expiration_seconds, -> { Integer }, optional: true, nullable: false, api_name: "sessionExpirationSeconds"
      field :assistant_overrides, -> { Vapi::Types::ChatAssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :customer, -> { Vapi::Types::CreateWebCustomerDto }, optional: true, nullable: false
      field :input, -> { Vapi::Types::OpenAiWebChatRequestInput }, optional: false, nullable: false
      field :stream, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :session_end, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "sessionEnd"
    end
  end
end
