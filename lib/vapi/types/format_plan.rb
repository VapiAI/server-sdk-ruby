# frozen_string_literal: true

module Vapi
  module Types
    # Controls text normalization before voice synthesis, including built-in formatters, number handling, and custom
    # replacements.
    class FormatPlan < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :number_to_digits_cutoff, -> { Integer }, optional: true, nullable: false, api_name: "numberToDigitsCutoff"
      field :replacements, -> { Internal::Types::Array[Vapi::Types::FormatPlanReplacementsItem] }, optional: true, nullable: false
      field :formatters_enabled, -> { Internal::Types::Array[Vapi::Types::FormatPlanFormattersEnabledItem] }, optional: true, nullable: false, api_name: "formattersEnabled"
    end
  end
end
