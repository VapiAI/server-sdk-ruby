# frozen_string_literal: true

module Vapi
  module Types
    class FormatPlanReplacementsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::ExactReplacement }, key: "EXACT"
      member -> { Vapi::Types::RegexReplacement }, key: "REGEX"
    end
  end
end
