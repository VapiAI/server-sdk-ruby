# frozen_string_literal: true

module Vapi
  module Types
    class BoardItemsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::BoardInsightItem }
      member -> { Vapi::Types::BoardMetricWidgetItem }
    end
  end
end
