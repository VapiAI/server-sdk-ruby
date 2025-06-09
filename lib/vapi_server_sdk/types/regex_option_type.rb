# frozen_string_literal: true

module Vapi
# This is the type of the regex option. Options are:
#  - `ignore-case`: Ignores the case of the text being matched. Add
#  - `whole-word`: Matches whole words only.
#  - `multi-line`: Matches across multiple lines.
  class RegexOptionType

    IGNORE_CASE = "ignore-case"
    WHOLE_WORD = "whole-word"
    MULTI_LINE = "multi-line"

  end
end