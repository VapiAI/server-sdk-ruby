# frozen_string_literal: true

module Vapi
  module Types
    class EvalGoogleModel < Internal::Types::Model
      field :model, -> { Vapi::Types::EvalGoogleModelModel }, optional: false, nullable: false
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :max_tokens, -> { Integer }, optional: true, nullable: false, api_name: "maxTokens"
      field :messages, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false
    end
  end
end
