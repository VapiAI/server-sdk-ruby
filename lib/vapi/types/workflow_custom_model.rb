# frozen_string_literal: true

module Vapi
  module Types
    class WorkflowCustomModel < Internal::Types::Model
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
