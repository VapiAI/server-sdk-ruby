# frozen_string_literal: true

module Vapi
  module Types
    module TranscriptKeyValueResultVerdict
      extend Vapi::Internal::Types::Enum

      EXACT = "exact"
      NEAR = "near"
      MISSED = "missed"
    end
  end
end
