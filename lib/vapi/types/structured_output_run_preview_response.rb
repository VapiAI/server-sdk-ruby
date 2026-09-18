# frozen_string_literal: true

module Vapi
  module Types
    class StructuredOutputRunPreviewResponse < Internal::Types::Model
      field :skipped, -> { Internal::Types::Hash[String, Vapi::Types::SkippedStructuredOutput] }, optional: true, nullable: false
    end
  end
end
