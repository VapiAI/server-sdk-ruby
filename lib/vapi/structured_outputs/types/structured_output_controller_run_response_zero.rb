# frozen_string_literal: true

module Vapi
  module StructuredOutputs
    module Types
      class StructuredOutputControllerRunResponseZero < Internal::Types::Model
        field :skipped, -> { Internal::Types::Hash[String, Vapi::Types::SkippedStructuredOutput] }, optional: true, nullable: false
      end
    end
  end
end
