# frozen_string_literal: true

module Vapi
  module Types
    module FormatPlanFormattersEnabledItem
      extend Vapi::Internal::Types::Enum

      MARKDOWN = "markdown"
      ASTERISK = "asterisk"
      QUOTE = "quote"
      DASH = "dash"
      NEWLINE = "newline"
      COLON = "colon"
      ACRONYM = "acronym"
      DOLLAR_AMOUNT = "dollarAmount"
      EMAIL = "email"
      DATE = "date"
      TIME = "time"
      DISTANCE = "distance"
      UNIT = "unit"
      PERCENTAGE = "percentage"
      PHONE_NUMBER = "phoneNumber"
      NUMBER = "number"
      STRIP_ASTERISK = "stripAsterisk"
    end
  end
end
