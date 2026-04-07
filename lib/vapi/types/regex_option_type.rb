# frozen_string_literal: true

module Vapi
  module Types
    module RegexOptionType
      extend Vapi::Internal::Types::Enum

      IGNORE_CASE = "ignore-case"
      WHOLE_WORD = "whole-word"
      MULTI_LINE = "multi-line"
    end
  end
end
