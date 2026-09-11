# frozen_string_literal: true

module Vapi
  module Types
    # Controls filtering of transcripts for security threats before content is sent to the assistant's language model,
    # including filter selection, handling mode, and replacement text.
    class SecurityFilterPlan < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :filters, -> { Internal::Types::Array[Vapi::Types::SecurityFilterBase] }, optional: true, nullable: false
      field :mode, -> { Vapi::Types::SecurityFilterPlanMode }, optional: true, nullable: false
      field :replacement_text, -> { String }, optional: true, nullable: false, api_name: "replacementText"
    end
  end
end
