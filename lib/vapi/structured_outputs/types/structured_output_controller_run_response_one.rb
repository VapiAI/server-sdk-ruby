# frozen_string_literal: true

module Vapi
  module StructuredOutputs
    module Types
      class StructuredOutputControllerRunResponseOne < Internal::Types::Model
        field :skipped, -> { Internal::Types::Hash[String, Vapi::Types::SkippedStructuredOutput] }, optional: true, nullable: false
      end
    end
  end
end
