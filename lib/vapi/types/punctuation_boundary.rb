# frozen_string_literal: true

module Vapi
  module Types
    module PunctuationBoundary
      extend Vapi::Internal::Types::Enum

      CIRCLE = "。"
      FULL_WIDTH_COMMA = "，"
      DOT = "."
      EXCLAMATION = "!"
      QUESTION = "?"
      SEMICOLON = ";"
      PARENTHESIS = ")"
      ARABIC_COMMA = "،"
      URDU_FULL_STOP = "۔"
      BENGALI_FULL_STOP = "।"
      DOUBLE_DANDA = "॥"
      PIPE = "|"
      DOUBLE_PIPE = "||"
      HALF_WIDTH_COMMA = ","
      COLON = ":"
    end
  end
end
