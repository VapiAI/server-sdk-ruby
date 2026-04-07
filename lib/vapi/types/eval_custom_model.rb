# frozen_string_literal: true

module Vapi
  module Types
    class EvalCustomModel < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
      field :headers, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
      field :model, -> { String }, optional: false, nullable: false
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :max_tokens, -> { Integer }, optional: true, nullable: false, api_name: "maxTokens"
      field :messages, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false
    end
  end
end
