# frozen_string_literal: true

module Vapi
  module Types
    # Workflow model configuration for a custom language model endpoint, including URL, headers, metadata delivery,
    # timeout, model, temperature, and maximum output tokens.
    class WorkflowCustomModel < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::OpenAiMessage] }, optional: true, nullable: false
      field :metadata_send_mode, -> { Vapi::Types::WorkflowCustomModelMetadataSendMode }, optional: true, nullable: false, api_name: "metadataSendMode"
      field :url, -> { String }, optional: false, nullable: false
      field :headers, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
      field :model, -> { String }, optional: false, nullable: false
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :max_tokens, -> { Integer }, optional: true, nullable: false, api_name: "maxTokens"
    end
  end
end
