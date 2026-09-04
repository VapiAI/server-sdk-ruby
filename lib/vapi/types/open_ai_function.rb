# frozen_string_literal: true

module Vapi
  module Types
    # Function definition exposed to a language model, including its name, purpose, parameter schema, and strict-schema
    # behavior.
    class OpenAiFunction < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :strict, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :parameters, -> { Vapi::Types::OpenAiFunctionParameters }, optional: true, nullable: false
    end
  end
end
