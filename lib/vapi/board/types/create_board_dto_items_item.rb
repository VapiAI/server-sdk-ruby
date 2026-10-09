# frozen_string_literal: true

module Vapi
  module Board
    module Types
      class CreateBoardDtoItemsItem < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        member -> { Vapi::Types::BoardInsightItem }
        member -> { Vapi::Types::BoardMetricWidgetItem }
      end
    end
  end
end
